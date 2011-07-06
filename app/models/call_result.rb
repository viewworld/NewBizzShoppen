class CallResult < ActiveRecord::Base
  attr_accessor :contact_email_address, :contact_first_name, :contact_last_name, :contact_address_line_1, :contact_zip_code,
                :contact_company_name, :buying_category_ids, :email_template_subject, :email_template_from, :email_template_bcc,
                :email_template_cc, :email_template_body

  belongs_to :contact
  belongs_to :result
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  has_one :call_log
  has_many :result_values
  has_one :send_material_result_value, :class_name => "ResultValue", :conditions => "result_values.field_type = '#{ResultField::MATERIAL}'"
  accepts_nested_attributes_for :result_values, :allow_destroy => true
  accepts_nested_attributes_for :contact

  validates_presence_of :result_id, :creator_id, :contact_id
  validates_presence_of :contact_email_address, :if => Proc.new{|cr| cr.result.send_material? or cr.result.upgrades_to_category_buyer?}
  validates_format_of :contact_email_address, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :if => Proc.new{|cr| cr.result.send_material? or cr.result.upgrades_to_category_buyer?}
  validates_presence_of :contact_first_name, :contact_last_name, :contact_address_line_1, :contact_zip_code, :if => Proc.new { |cr| cr.result.upgrades_to_category_buyer? }
  validate :validate_uniqueness_of_contact_email_address, :if => Proc.new { |cr| cr.result.upgrades_to_category_buyer? }

  after_create :process_side_effects, :update_contact_note, :set_last_call_result_in_contact, :update_contact_email, :update_contact_address
  after_update :process_side_effects
  after_destroy :update_completed_status, :update_pending_status

  PENDING_RESULT_TYPES = [:call_back, :not_interested_now]

  scope :call_log_results, joins(:result).where(:results => {:final => false})
  scope :final_results, joins(:result).where(:results => {:final => true})
  scope :with_creator, lambda { |agent_id| where(:creator_id => agent_id) if agent_id.present? }
  scope :final_for_campaign, lambda { |campaign| final_results.where("campaigns_results.campaign_id = ?", campaign.id).joins("INNER JOIN campaigns_results ON results.id = campaigns_results.result_id") }
  scope :with_success, where("results.is_success is true")
  scope :with_reported, where("results.is_reported is true")
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
    result_values.each_with_index { |result_value, index| result[index] = "#{result_value.result_field.name}: #{result_value.value}" }
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
    completed_status = contact.current_call_result.present? ? contact.current_call_result.result.final? : false
    contact.update_attributes :completed => completed_status
  end

  def update_pending_status
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
    if result.upgrades_to_category_buyer?
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

  def process_for_upgrade_to_category_buyer
    upgrade_to_category_buyer
    process_for_final_result
  end

  def upgrade_to_category_buyer
    user = User::CategoryBuyer.new(:email => contact_email_address, :first_name => contact_first_name,
                            :last_name => contact_last_name,
                            :address_attributes => { :address_line_1 => contact_address_line_1, :zip_code => contact_zip_code,
                                                     :country_id => contact.country_id,  :address_line_2 => contact.address_line_2,
                                                     :address_line_3 => contact.address_line_3, :region_id => contact.region_id},
                            :agreement_read => true, :company_name => contact.company_name, :phone => contact.phone_number,
                            :contact => contact, :company_registration_number => contact.company_vat_no,
                            :company_ean_number => contact.company_ean_number)

    users_count = User.where("last_name = ?", contact_last_name).count
    user.screen_name = "#{contact_last_name}#{' ' + users_count.to_s if users_count > 0}"
    new_password = contact.campaign.name.downcase.gsub(' ', '').gsub('-', '').first(6)
    user.password = new_password
    user.password_confirmation = new_password
    user.skip_email_verification = "1"
    user.save
    user.buying_category_ids = buying_category_ids
    user.save
    deliver_email_for_category_buyer(user, new_password)
  end

  def customize_email_template(template)
    [:subject, :from, :bcc, :cc, :body].each do |field|
      template.send("#{field}=".to_sym, self.send("email_template_#{field}")) unless self.send("email_template_#{field}").blank?
    end
    template
  end
  
  def deliver_material
    template = contact.campaign.send_material_email_template || EmailTemplate.global.where(:uniq_id => 'result_send_material').first
    template = customize_email_template(template)
    ApplicationMailer.delay.generic_email([contact_email_address],
                                    template.subject, template.body,
                                    template.from,
                                    send_material_result_value.materials.map{ |material| Pathname.new(File.join([::Rails.root, 'public', material.url]))},
                                    template.cc, template.bcc)
  end

  def deliver_email_for_category_buyer(user, password)
    template = contact.campaign.upgrade_contact_to_category_buyer_email_template || EmailTemplate.global.where(:uniq_id => 'upgrade_contact_to_category_buyer').first
    template = customize_email_template(template)
    attachments_arr = send_material_result_value.materials.empty? ? [] : send_material_result_value.materials.map{ |material| Pathname.new(File.join([::Rails.root, 'public', material.url])) }

    ApplicationMailer.delay.generic_email([contact_email_address], template.subject, template.render({:user => user, :password => password}), template.from, attachments_arr, template.cc, template.bcc)
  end
  
  def set_last_call_result_in_contact
    self.contact.update_attribute(:last_call_result_at, created_at)
  end
end