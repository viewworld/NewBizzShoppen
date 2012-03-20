class Campaign < ActiveRecord::Base
  include ScopedSearch::Model

  belongs_to :category
  belongs_to :country
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  belongs_to :currency
  has_and_belongs_to_many :users
  has_many :campaigns_results, :foreign_key => "campaign_id", :dependent => :destroy
  has_many :results, :through => :campaigns_results
  has_many :contacts, :dependent => :destroy
  has_many :materials, :as => :resource, :class_name => "Material", :dependent => :destroy
  has_one :send_material_email_template, :as => :resource, :class_name => "EmailTemplate", :conditions => "uniq_id = 'result_send_material'", :dependent => :destroy
  has_one :upgrade_contact_to_category_buyer_email_template, :as => :resource, :class_name => "EmailTemplate", :conditions => "uniq_id = 'upgrade_contact_to_category_buyer'", :dependent => :destroy
  has_one :upgrade_contact_to_buyer_email_template, :as => :resource, :class_name => "EmailTemplate", :conditions => "uniq_id = 'upgrade_contact_to_buyer'", :dependent => :destroy
  has_one :upgrade_contact_to_member_email_template, :as => :resource, :class_name => "EmailTemplate", :conditions => "uniq_id = 'upgrade_contact_to_member'", :dependent => :destroy
  has_many :user_session_logs, :dependent => :destroy
  has_many :chain_mail_types, :dependent => :nullify

  validates_uniqueness_of :name
  validates_presence_of :name, :max_contact_number, :category_id, :country_id, :start_date, :end_date, :cost_type
  validates_numericality_of :max_contact_number, :only_integer => true, :greater_than_or_equal_to => 0
  validate :fixed_cost_value_is_valid

  scope :with_keyword, lambda { |q| where("lower(name) like :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :with_state, lambda { |q|
    case q
      when "active" then
        where("start_date <= '#{Date.today}' and end_date >= '#{Date.today}'")
      when "inactive" then
        where("start_date > '#{Date.today}' or end_date < '#{Date.today}'")
      else
        where("")
    end }

  default_scope where(:deleted_at => nil)
  scoped_order :name, :start_date, :end_date
  scope :joins_on_category, joins("INNER JOIN categories ON campaigns.category_id=categories.id")
  scope :joins_on_country, joins("INNER JOIN countries ON campaigns.country_id=countries.id")
  scope :ascend_by_category, order("categories.name ASC").joins_on_category
  scope :descend_by_category, order("categories.name DESC").joins_on_category
  scope :ascend_country, order("countries.name ASC").joins_on_country
  scope :descend_by_country, order("countries.name DESC").joins_on_country
  scope :available_for_user, lambda { |user| includes(:users).where("users.id = :user_id OR campaigns.creator_id = :user_id", {:user_id => user.id}) unless user.has_role? :admin }

  before_save :set_euro_fixed_cost_value, :set_euro_production_value_per_hour
  after_save :check_email_templates, :correct_session_logs_if_cost_type_changed

  FIXED_COST = 0.freeze
  AGENT_BILLING_RATE_COST = 1.freeze
  FIXED_HOURLY_RATE_COST = 2.freeze
  NO_COST = 3.freeze
  COST_TYPES = [FIXED_COST, AGENT_BILLING_RATE_COST, FIXED_HOURLY_RATE_COST, NO_COST]
  CLONED_TEMPLATES = {
      :send_material_email_template => 'result_send_material', :upgrade_contact_to_category_buyer_email_template => 'upgrade_contact_to_category_buyer',
      :upgrade_contact_to_buyer_email_template => 'upgrade_contact_to_buyer', :upgrade_contact_to_member_email_template => 'upgrade_contact_to_member'
  }

  CRM_OPTION_OFF = 0.freeze
  CRM_OPTION_COMPANY_NAME = 1.freeze
  CRM_OPTION_CVR = 2.freeze
  CRM_OPTION_CONTACT_EMAIL = 3.freeze
  CRM_OPTION_ALL = 4.freeze
  CRM_OPTIONS = [CRM_OPTION_OFF, CRM_OPTION_COMPANY_NAME, CRM_OPTION_CVR, CRM_OPTION_CONTACT_EMAIL, CRM_OPTION_ALL]

  acts_as_newsletter_source

  private

  def fixed_cost_value_is_valid
    if cost_type == FIXED_COST or cost_type == FIXED_HOURLY_RATE_COST and fixed_cost_value.blank?
      self.errors.add(:fixed_cost_value, I18n.t("models.campaign.fixed_cost_value_is_blank"))
    elsif cost_type == AGENT_BILLING_RATE_COST and users.with_agents.any? { |u| u.billing_rate.to_i <= 0 }
      self.errors.add(:cost_type, I18n.t("models.campaign.agents_dont_have_billing_rates_defined"))
    end
  end

  def set_euro_fixed_cost_value
    if fixed_cost_value_changed? and fixed_cost_value.to_i > 0 and currency.present?
      self.euro_fixed_cost_value = currency.to_euro(fixed_cost_value)
    end
  end

  def set_euro_production_value_per_hour
    if production_value_per_hour.to_i > 0 and currency.present? and production_value_per_hour_changed?
      self.euro_production_value_per_hour = currency.to_euro(production_value_per_hour)
    end
  end

  def check_email_templates
    CLONED_TEMPLATES.each_pair do |template_clone_method, template_name|
      unless send(template_clone_method)
        global_template = EmailTemplate.global.where(:uniq_id => template_name).first
        self.send("#{template_clone_method}=".to_sym, global_template.clone)
        global_template.translations.each do |translation|
          self.send(template_clone_method).translations.send("<<".to_sym, translation.clone)
        end
        self.save
      end
    end
  end

  def correct_session_logs_if_cost_type_changed
    if cost_type_changed?
      apply_billing_rate_to_user_session_logs!
    end
  end

  public

  def apply_billing_rate_to_user_session_logs!
    if [AGENT_BILLING_RATE_COST, FIXED_HOURLY_RATE_COST].include?(cost_type)
      user_session_logs.where(:euro_billing_rate => nil).each do |usl|
        usl.update_attribute(:euro_billing_rate, cost_type == AGENT_BILLING_RATE_COST ? usl.user ? usl.user.euro_billing_rate : nil : euro_fixed_cost_value )
      end
    end
  end

  def to_i
    id
  end

  def creator_full_name
    creator.present? ? creator.full_name : "-creator deleted-"
  end

  def cloned_email_templates
    CLONED_TEMPLATES.keys.map { |template_method| send(template_method) }
  end

  def return_contact_to_the_pool
    contacts.where("agent_id NOT IN (?)", user_ids).each { |c| c.update_attribute(:agent_id, nil) }
  end

  def assign(ids)
    self.users = ids.blank? ? [] : User.find(ids)
    return_contact_to_the_pool
  end

  def assign_results(params)
    self.results = params[:campaign_result_ids].blank? ? [] : Result.find(params[:campaign_result_ids])
    self.results.each do |r|
      if params["result"] and params["result"][r.id.to_s] and params["result"][r.id.to_s]["campaign_result"] and cr = r.campaigns_results.detect { |cr| cr.campaign_id == self.id }
        cr.value = params["result"][r.id.to_s]["campaign_result"]["value"] if params["result"][r.id.to_s]["campaign_result"]["value"]
        cr.expected_completed_per_hour = params["result"][r.id.to_s]["campaign_result"]["expected_completed_per_hour"] if params["result"][r.id.to_s]["campaign_result"]["expected_completed_per_hour"]
        cr.save
      elsif params["result"] and params["result"][r.id.to_s] and params["result"][r.id.to_s]["campaign_result"]
        r.campaigns_results.create(
            :campaign_id => id,
            :value => params["result"][r.id.to_s]["campaign_result"]["value"],
            :expected_completed_per_hour => params["result"][r.id.to_s]["campaign_result"]["expected_completed_per_hour"]
        )
      end
    end
  end

  def results_for_select
    results.map { |result| [result.name, result.id] }
  end

  def completion
    completed_contacts = contacts.with_completed_status(true)
    contacts.count == 0 ? 0 : completed_contacts.count * 100 / contacts.count
  end

  def assign_contacts_to_agent(agent)
    if agent.with_role.respond_to? :has_max_contacts_in_campaign?
      #restore contact to call sheet if it's not pending anymore
      pending_contacts = agent.contacts.with_pending_status(true)
      while (not agent.with_role.has_max_contacts_in_campaign? self) and pending_contacts.present?
        contact = pending_contacts.shift
        contact.change_pending_status(false) unless contact.should_be_pending?(agent)
      end

      #assign new contacts to agent
      contacts_list = contacts.available_to_assign(agent)
      while (not agent.with_role.has_max_contacts_in_campaign? self) and contacts_list.present?
        contacts_list.shift.assign_agent(agent.id)
      end
    end
  end

  def has_user_as_member?(user)
    user.with_role.campaigns.include?(self)
  end

  def can_be_managed_by?(user)
    creator_id == user.id or user.has_role?(:admin) or (user.has_role?(:call_centre) and has_user_as_member?(user))
  end

  def can_be_accessed_by?(user)
    user.has_role?(:admin) or creator.id == user.id or has_user_as_member?(user)
  end

  def contacts_for_auto_completer
    contacts.map { |c| "{text:'#{c.company_name}', url:'/callers/campaigns/#{id}/agent_work_screen/contacts/#{c.id}'}" }
  end

  def default_materials_set
    materials.where(:is_default => true)
  end

  def to_s
    name
  end

########################################################################################################################
#
#   IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT
#
########################################################################################################################

  include AdvancedImport

  def create_contacts_from_xls(spreadsheet, current_user, only_unique)
    spreadsheet.default_sheet = spreadsheet.sheets.first
    2.upto(spreadsheet.last_row) do |line|
      contact = contacts.build
      Campaign.import_fields.each_with_index { |field, index| contact = assign_field(contact, field, spreadsheet.cell(line, index+1), spreadsheet.celltype(line, index+1)) }
      contact = Campaign.assign_current_user(contact, current_user, self)
      unless only_unique and !Contact.where("id IS NOT NULL AND campaign_id = #{contact.campaign_id} AND company_name LIKE '#{contact.company_name.to_s.gsub("'", "_")}' AND company_vat_no = '#{contact.company_vat_no}' AND email_address = '#{contact.email_address}'").blank?
        contact.save
      end
    end
  end

  class << self

    def advanced_import_contacts_from_xls(options)
      return false unless advanced_import_field_blank_validation(options[:contact_fields], options[:spreadsheet_fields])
      contact_fields, spreadsheet_fields = options[:contact_fields].split(","), options[:spreadsheet_fields].split(",")
      return false unless advanced_import_field_size_validation(contact_fields, spreadsheet_fields)

      campaign = Campaign.find(options[:object_id])

      #contacts_from_last_import_ids = campaign.contacts.from_last_import.map(&:id)
      headers, spreadsheet = advanced_import_headers(options[:spreadsheet])
      merged_fields = advanced_import_merged_fields(headers, contact_fields, spreadsheet_fields)
      counter, errors, not_unique_counter = 0, [], 0

      ActiveRecord::Base.transaction do
        2.upto(spreadsheet.last_row) do |line|
          contact = campaign.contacts.build
          import_fields.each { |field| contact = assign_field(contact, field, spreadsheet.cell(line, merged_fields[field]), spreadsheet.celltype(line, merged_fields[field])) }
          contact = assign_current_user(contact, options[:current_user], campaign)
          #contact.last_import = true
          if options[:unique_only] and !Contact.where("id IS NOT NULL AND campaign_id = #{contact.campaign_id} AND company_name LIKE '#{contact.company_name.to_s.gsub("'", "_")}' AND company_vat_no = '#{contact.company_vat_no}' AND email_address = '#{contact.email_address}'").blank?
            not_unique_counter += 1
          elsif contact.save
            counter += 1
          else
            errors << "[line: #{line}] #{contact.errors.map { |k, v| "#{k} #{v}" }.*(", ")}"
            counter = 0
            raise ActiveRecord::Rollback
          end
        end
      end

      if errors.blank? and not_unique_counter > 0
        errors << I18n.t("contacts_advanced_import.create.flash.success_with_not_unique", :counter => not_unique_counter)
      end

      #contacts_from_last_import = Contact.find_all_by_id(contacts_from_last_import_ids)
      #contacts_from_last_import.each { |c| c.update_attribute(:last_import, false) } if counter > 0 and !contacts_from_last_import.blank?

      {:counter => "#{counter} / #{spreadsheet.last_row-1}", :errors => errors.*("<br/>")}
    end

    def import_fields
      Contact::CSV_ATTRS
    end

    def required_import_fields
      Contact::REQUIRED_FIELDS
    end

    def assign_current_user(contact, current_user, campaign)
      contact.creator_id = current_user.id
      contact.creator_type = "User"
      contact.category_id = campaign.category_id
      contact.creator_name = current_user
      if current_user.has_any_role?(:agent, :call_centre_agent)
        contact.agent_id = current_user.id
      end
      contact
    end

  end

########################################################################################################################

  def no_cost?
    cost_type == NO_COST
  end

  def active?
    start_date <= Date.today and end_date >= Date.today
  end

  def duplicate!(with_call_results=true, user_to_notify=nil)
    clone_config = [:campaigns_results,
                     {:send_material_email_template => :translations},
                     {:upgrade_contact_to_buyer_email_template => :translations},
                     {:upgrade_contact_to_category_buyer_email_template => :translations},
                     {:upgrade_contact_to_member_email_template => :translations}]

    if with_call_results
      clone_config << :user_session_logs
      clone_config << {:contacts => [{:call_results => [:call_log, :result_values, :archived_email]}, :contact_past_user_assignments, {:lead_template_values => :lead_template_value_translations}, :translations]}
    else
      clone_config << {:contacts => [{:lead_template_values => :lead_template_value_translations}, :translations]}
    end

    campaign = self.deep_clone!(:with_callbacks => false, :include => clone_config)

    campaign.users = users
    campaign.name = "Copy of #{name} #{Time.now.strftime("%d-%m-%Y %H:%M:%S")}"
    campaign.save

    results = ResultValue.where("field_type::INT = ? and leads.campaign_id = ?", ResultField::MATERIAL, campaign.id).
        joins("INNER JOIN call_results on call_results.id=result_values.call_result_id INNER JOIN leads ON call_results.contact_id=leads.id").
        readonly(false)

    materials.each do |material|
      _material = material.clone
      _material.save
      _material.asset = material.asset
      _material.save
      campaign.materials << _material
      if selected = results.select { |rv| rv.value.to_i == material.id } and !selected.empty?
        selected.each { |rv| rv.update_attribute(:value, _material.id.to_s) }
      end
    end

    unless with_call_results
      campaign.contacts.each { |contact| contact.update_attributes(:completed => false, :agent_id => nil) }
    end

    if user_to_notify
      user_to_notify.notify!(:title => I18n.t("notifications.campaign.duplicated.title", :campaign_name => name), :text => I18n.t("notifications.campaign.duplicated.text", :url => "http://#{user_to_notify.domain_name}/callers/campaigns/#{campaign.id}/edit"))
    end

    campaign
  end
  handle_asynchronously :duplicate!, :queue => 'duplications'

  def pending_contacts_for(user)
    contacts.where(:agent_id => user.id).with_pending_status(true)
  end

  def call_back_call_results_for(user)
    CallResult.where("leads.campaign_id = ? and call_results.creator_id = ? and call_results.result_id = ?", id, user.id, Result.where(:generic => true, :name => "Call back").first.id).joins(:contact)
  end

  def delayed_destroy
    ActiveRecord::Base.transaction do
      ActiveRecord::Migration.execute "UPDATE leads SET position = NULL WHERE position IS NOT NULL AND type = 'Contact' AND campaign_id = #{self.id}"
      self.destroy
    end
  end

  def set_as_deleted!
    self.deleted_at = Time.now
    self.save(:validate => false)
  end

  def set_as_retrieved!
    self.deleted_at = nil
    self.save(:validate => false)
  end

  def call_backs_count(user=nil)
    call_back = Result.where("name = ?", "Call back").first
    contacts_scope = Contact.joins(:call_results).where("leads.campaign_id = ? AND call_results.result_id = ? AND leads.completed IS FALSE AND pending IS TRUE", id, call_back.id)
    if user and (user.call_centre_agent? or user.call_centre? or user.agent?)
      contacts_scope = contacts_scope.where("leads.agent_id IN (?)", user.call_centre? ? [user.id] + user.subaccount_ids : user.id)
    end
    contacts_scope.select("DISTINCT(leads.id)").count
  end
end