class CallResult < ActiveRecord::Base
  include EmailTemplateEditor
  include ScopedSearch::Model

  attr_accessor :contact_email_address, :contact_first_name, :contact_last_name, :contact_address_line_1, :contact_address_line_2,
                :contact_address_line_3, :contact_zip_code, :contact_country_id, :contact_phone_number,
                :contact_company_name, :buying_category_ids, :result_id_changed, :user_not_charge_vat, :current_user, :contact_subscription_plan_id,
                :contact_newsletter_on, :contact_requested_deal_ids, :upgraded_user, :chain_mail_type_id, :survey_recipient,
                :save_without_callbacks

  CSV_ATTRS = %w{ result_name }

  belongs_to :contact
  belongs_to :result
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  belongs_to :payout_currency, :class_name => "Currency"
  has_many :result_values, :dependent => :destroy
  has_many :call_result_fields, :autosave => true
  has_one :send_material_result_value, :class_name => "ResultValue", :conditions => "result_values.field_type = '#{ResultField::MATERIAL}'"
  has_one :archived_email, :as => :related, :dependent => :destroy
  has_one :chain_mail, :as => :chain_mailable
  accepts_nested_attributes_for :result_values, :allow_destroy => true
  accepts_nested_attributes_for :contact
  accepts_nested_attributes_for :call_result_fields

  validates_presence_of :result_id, :creator_id, :contact_id
  validates_presence_of :contact_email_address, :if => Proc.new { |cr| cr.result.send_material? || cr.result.upgrades_to_any_user? || cr.campaign_create_deals? }
  validates_format_of :contact_email_address, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :if => Proc.new { |cr| cr.result.send_material? || cr.result.upgrades_to_any_user? || cr.campaign_create_deals?}
  validates_presence_of :contact_first_name, :contact_last_name, :contact_address_line_1, :contact_address_line_3, :contact_zip_code, :if => Proc.new { |cr| cr.result.upgrades_to_any_user? || cr.campaign_create_deals? }
  validates_presence_of :contact_company_name, :contact_phone_number, :if => Proc.new { |cr| cr.result.upgrades_to_member? || cr.campaign_create_deals? }
  validate :validate_uniqueness_of_contact_email_address, :if => Proc.new { |cr| cr.result.upgrades_to_any_user? || cr.campaign_create_deals? }
  validate :validate_upgraded_user, :if => Proc.new { |cr| cr.result.upgrades_to_any_user? || cr.campaign_create_deals? }
  validates_numericality_of :payout, :allow_blank => true
  validates_numericality_of :value, :allow_blank => true

  after_create :process_side_effects, :update_contact_note, :set_last_call_result_in_contact, :update_contact_email, :update_contact_address, :unless => :save_without_callbacks
  after_update :process_side_effects, :update_contact_email, :update_contact_address, :unless => :save_without_callbacks
  after_destroy :update_completed_status, :update_pending_status, :unless => :save_without_callbacks
  before_update :process_for_changed_result_type, :unless => :save_without_callbacks
  after_save do
    if chain_mail_type_id and new_chain_mail_type = ChainMailType.find_by_id(chain_mail_type_id) and new_chain_mail_type.id != active_chain_mail_type_id
      chain_mail.destroy if chain_mail
      ChainMail.create(:email => (contact_email_address || contact.email_address), :chain_mailable => self, :chain_mail_type => new_chain_mail_type)
    elsif active_chain_mail_type_id and chain_mail_type_id.blank?
      chain_mail.destroy
    end
  end
  before_create :set_payout
  before_create :set_value
  before_save do
    if payout_changed? and !payout.nil? and payout_currency_id.nil?
      self.payout_currency_id = contact.campaign.currency_id
    end
  end

  before_update do
    if payout_changed? and !payout.nil?
      self.euro_payout = payout_currency.to_euro(payout.to_f)
    end

    if value_changed? and !value.nil?
      self.euro_value = payout_currency.to_euro(value.to_f)
    end
  end

  PENDING_RESULT_TYPES = [:call_back, :not_interested_now, :call_back_private]

  scope :call_log_results, joins(:result).where(:results => {:final => false})
  scope :final_results, joins(:result).where(:results => {:final => true})
  scope :temp_results, joins(:result).where(:results => {:final => false})
  scope :with_creator, lambda { |agent_id| where(:creator_id => agent_id) if agent_id.present? }
  scope :for_campaign, lambda { |campaign| where("campaigns_results.campaign_id = ? and contacts.type = 'Contact' and contacts.campaign_id = ?", campaign.id, campaign.id).joins("INNER JOIN campaigns_results ON results.id = campaigns_results.result_id").joins("INNER JOIN leads as contacts ON call_results.contact_id=contacts.id") }
  scope :final_for_campaign, lambda { |campaign| final_results.for_campaign(campaign) }
  scope :temp_for_campaign, lambda { |campaign| temp_results.for_campaign(campaign) }
  scope :with_success, where("campaigns_results.is_success is true")
  scope :with_reported, where("campaigns_results.is_reported is true")
  scope :with_dynamic_value, lambda { |is_dynamic| where("campaigns_results.is_dynamic_value = ?", is_dynamic) }
  scope :with_leads_from_deals_requested_during_upgrade_to_member, joins("INNER JOIN users as members ON members.contact_id = contacts.id  AND members.roles_mask & 128 > 0").joins("INNER JOIN leads as generated_leads ON members.id = generated_leads.requested_by AND generated_leads.requested_during_upgrade_to_member IS TRUE")
  scope :created_at_from, lambda { |from| where("call_results.created_at::DATE >= ?", from.to_date) }
  scope :created_at_to, lambda { |to| where("call_results.created_at::DATE <= ?", to.to_date) }
  #scope :created_by_call_centres, lambda { |call_centres| where(:creator_id => User::CallCentre.find_all_by_id(call_centres).map(&:children).flatten.map(&:id)) }
  #scope :created_by_agents, lambda { |agents| where(:creator_id => agents.map(&:to_i)) }
  scope :with_call_id, select("call_results.*, (select call_id from call_logs where state = 'TALK' and caller_id = call_results.creator_id and call_logs.created_at < call_results.created_at AND @EXTRACT(EPOCH FROM call_logs.created_at - call_results.created_at) < 3600 ORDER BY created_at DESC LIMIT 1) call_id")
  scope :empty, where("1=0")
  default_scope :order => 'call_results.created_at DESC'

  delegate :create_deals?, :to => :campaign_result, :allow_nil => true

  amoeba do
    enable
  end

  def save_without_callbacks!
    self.save_without_callback = true
    save!
  end

  def campaign_create_deals?
    campaign_result.try(:create_deals?) && contact.user.nil?
  end

  def upgrades_to_member?
    result.upgrades_to_member? || create_deals?
  end

  def campaign_create_deals?
    create_deals? && User.find_by_email(contact.email_address).nil?
  end

  def campaign_result
    contact ? CampaignsResult.where(:campaign_id => contact.campaign_id, :result_id => result_id).first : nil
  end

  def set_payout
    if campaign_result
      self.payout = campaign_result.payout
      self.payout_currency_id = contact.campaign.currency_id
      self.euro_payout = payout_currency.to_euro(payout.to_f)
    end
  end

  def set_value
    if campaign_result
      if campaign_result.is_dynamic_value
        CampaignsResultField.where(:is_dynamic_value => true, :result_field_id => result.result_field_ids, :campaign_id => contact.campaign_id).each do |crf|
          call_result_fields.build(:dynamic_euro_value => crf.dynamic_euro_value, :campaigns_result_field_id => crf.id)
        end
      else
        self.value = campaign_result.value
        self.euro_value = payout_currency.to_euro(value.to_f)
      end
    end
  end

  def called?
    call_log.present?
  end

  def all_result_values(selected_result)
    result = Result.find(selected_result)
    result.result_fields.order(:created_at).map do |field|
      result_value = result_values.detect { |rv| rv.result_field == field }
      result_value = ResultValue.new(:result_field => field) if result_value.nil?
      result_value
    end
  end

  def can_be_managed_by?(user)
    (creator.present? and creator.id == user.id) or user.has_one_of_roles?(:admin, :call_centre)
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

  def creator_full_name
    creator ? creator.full_name : "-creator deleted-"
  end

  def to_i
    id
  end

  def chain_mail_queue
    "call_result_#{id}_chain_mails"
  end

  def active_chain_mail_type_id
    chain_mail ? chain_mail.chain_mail_type_id : nil
  end

  def register_click!
    if chain_mail and chain_mail.stop_on_link_click?
      ChainMail.stop_sending(self)
    end
  end

  def result_name
    result ? result.name : "-result deleted-"
  end

  def call_log
    CallLog.finished.order("call_logs.created_at desc").
        where(:caller_id => creator_id).
        where("call_logs.created_at < :call_result AND @EXTRACT(EPOCH FROM call_logs.created_at - :call_result) < 3600", :call_result => created_at).
        first
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

      CSV.generate(:force_quotes => true) do |csv|
        csv << (contact_information + result_fields + result_custom_fields).map(&:humanize)
        CallResult.find_all_by_id(call_result_ids).each do |c|
          csv << (contact_company_information_fields + contact_contact_information_fields).map { |attr| c.contact.send(attr).to_s.gsub(/[\n\r\t,]/, " ") } + result_fields.map { |attr| c.send(attr).to_s.gsub(/[\n\r\t,]/, " ") } + c.custom_fields_for_csv(result_custom_fields.size)
        end
      end
    end

  end

  private

  def validate_uniqueness_of_contact_email_address
    if User.find_by_email(contact_email_address) != contact.user
      self.errors.add(:contact_email_address, I18n.t("models.call_result.not_unique_email_address"))
    end
  end

  def upgrades_to_user_role
    user_role = result.upgrades_to_user_role.to_s
    user_role = 'member' if user_role.blank? && campaign_create_deals?
    user_role
  end

  def validate_upgraded_user
    if self.errors.empty? and user = prepare_user(upgrades_to_user_role).first and !user.valid?
      self.errors.add(:upgraded_user, user.errors.to_a.uniq)
      return false
    end
    true
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

  def process_result_tags
    if campaign_result and campaign_result.tag_list.present?
      campaign_result.tag_list.each do |tag|
        contact.tag_list << tag
      end
      contact.save
    end
  end

  def process_side_effects
    process_result_tags
    side_effect_result = if result.generic?
                           send "process_for_#{result.label.to_s}"
                         else
                           result.final? ? process_for_final_result : process_for_call_log_result
                         end
    reload
    upgrade_to_user('member') if campaign_create_deals?
    side_effect_result
  end

  def process_for_call_back
    process_for_call_log_result
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
    contact.upgrade_to_lead(survey_recipient)
    process_for_final_result
  end

  def process_for_call_log_result
    if contact.campaign.shared_contact_pool?
      if result.call_back_private?
        contact.update_attribute(:pending, true)
      else
        contact.update_attribute(:agent_id, nil)
      end
    else
      contact.update_attributes(:pending => PENDING_RESULT_TYPES.include?(result.label))
    end
    contact.move_to_bottom
  end

  def process_for_final_result
    contact.notifications.scoped.dismiss_all
    #contact.remove_from_list
    contact.update_attributes(:completed => true, :agent_id => nil)
    #contact.insert_at
  end

  def process_for_send_material
    deliver_material
    notify!
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

  def process_for_call_back_private
    process_for_call_back
  end

  def process_for_service_call
  end

  def prepare_user(role)
    if existing_user = User::Member.find_by_email(contact_email_address)
      return [existing_user, nil]
    end

    user_params = {:email => contact_email_address, :first_name => contact_first_name,
                   :last_name => contact_last_name,
                   :address_attributes => { :address_line_1 => contact_address_line_1, :zip_code => contact_zip_code,
                                             :country_id => contact_country_id,  :address_line_2 => contact_address_line_2,
                                             :address_line_3 => contact_address_line_3, :region_id => contact.region_id},
                   :agreement_read => true, :company_name => contact.company_name, :phone => contact_phone_number,
                   :contact => contact, :vat_number => contact.company_vat_no,
                   :company_ean_number => contact.company_ean_number, :assign_free_subscription_plan => false, :subscription_plan_id => contact_subscription_plan_id,
                   :newsletter_on => contact_newsletter_on,
                   :note => contact.note}

    if ["category_supplier", "supplier"].include?(role)
      user_params.merge!(:not_charge_vat => user_not_charge_vat)
    end

    user = "User::#{role.camelize}".constantize.new(user_params)

    new_password = contact.campaign.name.downcase.gsub(' ', '').gsub('-', '').first(6)
    if new_password.size < 6
      new_password = user.send(:generate_token, 6)
    end
    user.password = new_password
    user.password_confirmation = new_password
    user.skip_email_verification = "1"
    [user, new_password]
  end

  def upgrade_to_user(role)
    user, new_password = prepare_user(role)
    user.copy_custom_fields_from_contact(contact)
    user.save
    user.generate_login_key!

    if role == "category_supplier"
      user.buying_category_ids = buying_category_ids
      user.save
    end
    if contact.tag_list.any?
      contact.tag_list.each do |tag|
        user.tag_list << tag
      end
      user.save
    end
    self.upgraded_user = user
    deliver_email_for_upgraded_user(user, new_password)
  end

  def deliver_material
    template = contact.campaign.send_material_email_template || EmailTemplate.global.where(:uniq_id => 'result_send_material').first
    template = customize_email_template(template)
    template.preview = true

    TemplateMailer.new(contact_email_address, :blank_template, Country.get_country_from_locale,
                                       {
                                           :subject_content => template.subject,
                                           :body_content => template.render({:contact_company_name => contact.company_name,
                                                                             :contact_name => contact.contact_name,
                                                                             :agent_name => creator.full_name,
                                                                             :agent_phone_number => creator.phone}),
                                           :bcc_recipients => template.bcc,
                                           :cc_recipients => template.cc,
                                           :sender_id => current_user ? current_user.id : nil,
                                           :email_template_uniq_id => template.uniq_id,
                                           :related_id => self.id,
                                           :related_type => self.class.to_s,
                                           :email_template_id => template.id,
                                           :reply_to => template.custom_reply_to ? creator.email : nil
                                       },
                                       assets_to_path_names(send_material_result_value.materials)).deliver!
  end

  def deliver_email_for_upgraded_user(user, password)
    role = user.role_to_campaign_template_name
    template = if result.service_call?
                contact.campaign.service_call_email_template
               else
                 contact.campaign.send("upgrade_contact_to_#{role}_email_template".to_sym) || EmailTemplate.global.where(:uniq_id => "upgrade_contact_to_#{role}").first
               end
    template = customize_email_template(template)
    template.preview = true

    body_content = template.render({:user => user, :password => password})
    if user.member?
      body_content = StringUtils.replace_fairdeals_urls_for_auto_login_urls(user, body_content)
    end

    TemplateMailer.new(contact_email_address, :blank_template, Country.get_country_from_locale,
                                       {
                                           :subject_content => template.subject,
                                           :body_content => body_content,
                                           :bcc_recipients => template.bcc,
                                           :cc_recipients => template.cc,
                                           :sender_id => current_user ? current_user.id : nil,
                                           :email_template_uniq_id => template.uniq_id,
                                           :related_id => self.id,
                                           :related_type => self.class.to_s,
                                           :email_template_id => template.id,
                                           :reply_to => template.custom_reply_to ? creator.email : nil
                                       },
                                       assets_to_path_names(send_material_result_value.try(:materials))).deliver!
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

  def notify!(options={})
    options = {
      :title => I18n.t("notifications.call_result.call_back.title", :contact => contact.company_name),
      :text => I18n.t("notifications.call_result.call_back.text", :url => "/callers/campaigns/#{contact.campaign_id}/agent_work_screen?selected_contact_id=#{contact.id}"),
      :notify_at => Time.zone.parse(result_values.dates.first.value),
      :sticky => true,
      :time => nil,
      :notifier => contact
    }.merge(options)
    creator.notifications.create(options)
  end
end
