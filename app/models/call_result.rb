class CallResult < ActiveRecord::Base
  attr_accessor :contact_email_address, :contact_first_name, :contact_last_name, :contact_address_line_1, :contact_address_line_2,
                :contact_address_line_3, :contact_zip_code, :contact_country_id, :contact_phone_number,
                :contact_company_name, :buying_category_ids, :result_id_changed, :user_not_charge_vat, :current_user, :contact_subscription_plan_id,
                :contact_newsletter_on

  belongs_to :contact
  belongs_to :result
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  has_one :call_log
  has_many :result_values
  has_one :send_material_result_value, :class_name => "ResultValue", :conditions => "result_values.field_type = '#{ResultField::MATERIAL}'"
  has_one :archived_email, :as => :related, :dependent => :destroy
  accepts_nested_attributes_for :result_values, :allow_destroy => true
  accepts_nested_attributes_for :contact

  include EmailTemplateEditor

  validates_presence_of :result_id, :creator_id, :contact_id
  validates_presence_of :contact_email_address, :if => Proc.new{|cr| cr.result.send_material? or cr.result.upgrades_to_any_user?}
  validates_format_of :contact_email_address, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :if => Proc.new{|cr| cr.result.send_material? or cr.result.upgrades_to_any_user?}
  validates_presence_of :contact_first_name, :contact_last_name, :contact_address_line_1, :contact_zip_code, :if => Proc.new { |cr| cr.result.upgrades_to_any_user? }
  validates_presence_of :contact_company_name, :contact_phone_number, :contact_address_line_3, :if => Proc.new { |cr| cr.result.upgrades_to_member? }
  validate :validate_uniqueness_of_contact_email_address, :if => Proc.new { |cr| cr.result.upgrades_to_any_user? }

  after_create :process_side_effects, :update_contact_note, :set_last_call_result_in_contact, :update_contact_email, :update_contact_address, :unless => :save_without_callbacks
  after_update :process_side_effects, :update_contact_email, :update_contact_address, :unless => :save_without_callbacks
  after_destroy :update_completed_status, :update_pending_status, :unless => :save_without_callbacks
  before_update :process_for_changed_result_type, :unless => :save_without_callbacks

  PENDING_RESULT_TYPES = [:call_back, :not_interested_now]

  scope :call_log_results, joins(:result).where(:results => {:final => false})
  scope :final_results, joins(:result).where(:results => {:final => true})
  scope :with_creator, lambda { |agent_id| where(:creator_id => agent_id) if agent_id.present? }
  scope :for_campaign, lambda { |campaign| where("campaigns_results.campaign_id = ? and contacts.type = 'Contact' and contacts.campaign_id = ?", campaign.id, campaign.id).joins("INNER JOIN campaigns_results ON results.id = campaigns_results.result_id").joins("INNER JOIN leads as contacts ON call_results.contact_id=contacts.id") }
  scope :final_for_campaign, lambda { |campaign| final_results.for_campaign(campaign) }
  scope :with_success, where("results.is_success is true")
  scope :with_reported, where("results.is_reported is true")
  scope :with_dynamic_value, lambda { |is_dynamic| where("campaigns_results.is_dynamic_value = ?", is_dynamic) }
  default_scope :order => 'call_results.created_at DESC'

  def called?
    call_log.present?
  end

  def all_result_values(selected_result)
    result = Result.find(selected_result)
    result.result_fields.map do |field|
      result_value = result_values.detect { |rv| rv.result_field == field }
      result_value = ResultValue.new(:result_field => field) if result_value.nil?
      result_value
    end
  end

  def can_be_managed_by?(user)
    creator.id == user.id or user.has_one_of_roles?(:admin, :call_centre)
  end

  def custom_fields_for_csv(size)
    result = []
    size.times { result << "" }
    result_values.select { |rv| !rv.result_field.nil? }.each_with_index { |result_value, index| result[index] = "#{result_value.result_field.name}: #{result_value.value}" }
    result
  end

  def buying_categories
    Category.where("id in (?)", self.buying_category_ids || contact.category.root.id)
  end

  class << self

    def for_table_header(date_from, date_to)
      DateCalculator.days_or_ranges(date_from, date_to, 14).inject([]) do |result, output|
        result << (output.class == Range ? "#{output.first.strftime(DateCalculator::FORMAT)} #{output.last.strftime(DateCalculator::FORMAT)}" : output.strftime(DateCalculator::FORMAT))
      end
    end

    def for_table_row(date_from, date_to, result_ids, agent_ids, campaign_id)
      DateCalculator.days_or_ranges(date_from, date_to, 14).inject([]) do |result, output|
        date_start, date_stop = output.class == Range ? [output.first, output.last] : [output, output]
        results = CallResult.joins(:contact).where(:leads => {:campaign_id => campaign_id}, :result_id => result_ids).with_creator(agent_ids).where("call_results.created_at < '#{date_stop.strftime("%Y-%m-%d")} 23:59:59' and call_results.created_at > '#{date_start.strftime("%Y-%m-%d")} 00:00:01'")
        result << {:number => results.size, :ids => results.map(&:id).blank? ? [0] : results.map(&:id)}
      end
    end

    def to_csv(call_result_ids)
      contact_company_information_fields = %w(company_name company_phone_number company_website address_line_1 address_line_2 address_line_3 zip_code country region company_vat_no company_ean_number creator_name)
      contact_contact_information_fields = %w(contact_name direct_phone_number phone_number email_address  linkedin_url facebook_url note)
      contact_information = contact_company_information_fields + contact_contact_information_fields
      result_fields = %w(result note)
      result_custom_fields = %w(custom_field_1 custom_field_2 custom_field_3 custom_field_4)

      FasterCSV.generate(:force_quotes => true) do |csv|
        csv << (contact_information + result_fields + result_custom_fields).map(&:humanize)
        CallResult.find_all_by_id(call_result_ids).each do |c|
          csv << (contact_company_information_fields + contact_contact_information_fields).map { |attr| c.contact.send(attr).to_s.gsub(/[\n\r\t,]/, " ") } + result_fields.map { |attr| c.send(attr).to_s.gsub(/[\n\r\t,]/, " ") } + c.custom_fields_for_csv(result_custom_fields.size)
        end
      end
    end

  end

  private

  def validate_uniqueness_of_contact_email_address
    unless User.where("email = ?", contact_email_address).empty?
      self.errors.add(:contact_email_address, I18n.t("models.call_result.not_unique_email_address"))
    end
  end

  def update_completed_status
    completed_status = (contact.current_call_result.present? and contact.current_call_result.result.present?) ? contact.current_call_result.result.final? : false
    contact.update_attributes :completed => completed_status
  end

  def update_pending_status
    return true if contact.current_call_result.present? and contact.current_call_result.result.nil?
    pending_status = contact.current_call_result.present? ? (PENDING_RESULT_TYPES.include?(contact.current_call_result.result.label) and contact.should_be_pending?(contact.agent)) : false
    contact.update_attributes :pending => pending_status
  end

  def update_contact_note
    contact.update_attributes :note => "#{note}\n#{contact.note}" if self.note.present?
  end

  def update_contact_email
    contact.update_attribute(:email_address, contact_email_address) if result.send_material? and contact_email_address.present?
  end

  def update_contact_address
    if result.upgrades_to_any_user?
      contact.update_attributes({:contact_name => "#{contact_first_name} #{contact_last_name}", :address_line_1 => contact_address_line_1,
                                 :zip_code => contact_zip_code, :email_address => contact_email_address})
    end
  end

  def process_side_effects
    if result.generic?
      send "process_for_#{result.label.to_s}"
    else
      result.final? ? process_for_final_result : process_for_call_log_result
    end
  end

  def process_for_call_back
    if Date.parse(result_values.first.value) > contact.campaign.end_date
      process_for_final_result
    else
      process_for_call_log_result
    end
  end

  def process_for_not_interested_now
    process_for_call_back
  end

  def process_for_not_in
    process_for_call_log_result
  end

  def process_for_not_interested
    process_for_final_result
  end

  def process_for_meeting_booked
    process_for_final_result
  end

  def process_for_custom_result
    process_for_final_result
  end

  def process_for_upgraded_to_lead
    contact.upgrade_to_lead
    process_for_final_result
  end

  def process_for_call_log_result
    contact.update_attributes(:pending => PENDING_RESULT_TYPES.include?(result.label))
    contact.move_to_bottom
  end

  def process_for_final_result
    contact.remove_from_list
    contact.update_attributes(:completed => true, :agent_id => nil)
    contact.insert_at
  end

  def process_for_send_material
    deliver_material
    process_for_call_log_result
  end

  def process_for_upgrade_to_category_supplier
    upgrade_to_user("category_supplier")
    process_for_final_result
  end

  def process_for_upgrade_to_supplier
    upgrade_to_user("supplier")
    process_for_final_result
  end

  def process_for_upgrade_to_member
    upgrade_to_user("member")
    process_for_final_result
  end

  def upgrade_to_user(role)
    user_params = {:email => contact_email_address, :first_name => contact_first_name,
                   :last_name => contact_last_name,
                   :address_attributes => { :address_line_1 => contact_address_line_1, :zip_code => contact_zip_code,
                                             :country_id => contact_country_id,  :address_line_2 => contact_address_line_2,
                                             :address_line_3 => contact_address_line_3, :region_id => contact.region_id},
                   :agreement_read => true, :company_name => contact.company_name, :phone => contact_phone_number,
                   :contact => contact, :vat_number => contact.company_vat_no,
                   :company_ean_number => contact.company_ean_number, :assign_free_subscription_plan => false, :subscription_plan_id => contact_subscription_plan_id,
                   :newsletter_on => contact_newsletter_on}

    if ["category_supplier", "supplier"].include?(role)
      user_params.merge!(:not_charge_vat => user_not_charge_vat)
    end

    user = "User::#{role.camelize}".constantize.new(user_params)

    new_password = contact.campaign.name.downcase.gsub(' ', '').gsub('-', '').first(6)
    user.password = new_password
    user.password_confirmation = new_password
    user.skip_email_verification = "1"
    user.save
    if role == "category_supplier"
      user.buying_category_ids = buying_category_ids
      user.save
    end
    deliver_email_for_upgraded_user(user, new_password)
  end
  
  def deliver_material
    template = contact.campaign.send_material_email_template || EmailTemplate.global.where(:uniq_id => 'result_send_material').first
    template = customize_email_template(template)

    TemplateMailer.new(contact_email_address, :blank_template, Country.get_country_from_locale,
                                       {:subject_content => template.subject, :body_content => template.body,
                                        :bcc_recipients => template.bcc, :cc_recipients => template.cc,
                                        :sender_id => current_user ? current_user.id : nil, :email_template_uniq_id => template.uniq_id, :related_id => self.id, :related_type => self.class.to_s},
                                        assets_to_path_names(send_material_result_value.materials)).deliver!
  end

  def deliver_email_for_upgraded_user(user, password)
    role = user.role_to_campaign_template_name
    template = contact.campaign.send("upgrade_contact_to_#{role}_email_template".to_sym) || EmailTemplate.global.where(:uniq_id => "upgrade_contact_to_#{role}").first
    template = customize_email_template(template)

    TemplateMailer.new(contact_email_address, :blank_template, Country.get_country_from_locale,
                                       {:subject_content => template.subject, :body_content => template.render({:user => user, :password => password}),
                                        :bcc_recipients => template.bcc, :cc_recipients => template.cc,
                                        :sender_id => current_user ? current_user.id : nil, :email_template_uniq_id => template.uniq_id, :related_id => self.id, :related_type => self.class.to_s},
                                        assets_to_path_names(send_material_result_value.materials)).deliver!
  end
  
  def set_last_call_result_in_contact
    self.contact.update_attribute(:last_call_result_at, created_at)
  end

  def process_for_changed_result_type
    if result_id_changed? and ActiveRecord::ConnectionAdapters::Column.value_to_boolean(result_id_changed)
      self.errors.add(:result_id_changed)
      self.result_id_changed = 0
      false
    end
  end
end