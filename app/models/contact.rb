class Contact < AbstractLead

  CSV_ATTRS = %w(company_name company_phone_number company_website address_line_1 address_line_2 address_line_3 zip_code country region company_vat_no company_ean_number contact_name contact_title direct_phone_number phone_number email_address linkedin_url facebook_url note)
  REQUIRED_FIELDS = %w(company_name company_phone_number country)
  NUMERIC_FIELDS = []

  attr_accessor :strict_validate, :formatted_rows

  belongs_to :campaign
  has_many :call_results, :dependent => :destroy
  has_many :result_values, :through => :call_results
  belongs_to :lead
  has_many :contact_past_user_assignments, :foreign_key => "contact_id", :dependent => :destroy
  has_many :past_user_assignments, :through => :contact_past_user_assignments, :source => :user

  belongs_to :agent, :class_name => "User"
  validates_presence_of :company_name, :company_phone_number, :creator_id, :category_id, :country_id, :campaign_id
  validates_presence_of :price, :if => :process_for_lead_information?

  scope :with_keyword, lambda { |q| where("lower(leads.company_name) like :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :only_completed, where(:completed => false)
  scope :for_campaign, lambda { |campaign| where(:campaign_id => campaign) }
  scope :for_campaigns, lambda { |campaign_ids| where("campaign_id in (?)", campaign_ids) unless campaign_ids.to_a.empty? }
  scope :with_completed_status, lambda { |completed| where(:completed => completed) }
  scope :with_pending_status, lambda { |pending| where(:pending => pending) }
  scope :all_available_to_assign, where(:agent_id => nil).with_completed_status(false).with_pending_status(false)
  scope :available_to_assign, lambda { |user| all_available_to_assign.joins("left join contact_past_user_assignments on leads.id=contact_past_user_assignments.contact_id AND contact_past_user_assignments.user_id = #{user.id}").where("contact_past_user_assignments.user_id is NULL") }
  scope :with_results, joins(:call_results)
  scope :with_agents, lambda { |agent_ids| where("call_results.creator_id IN (:agent_ids)", {:agent_ids => agent_ids}) unless agent_ids.to_a.select { |id| !id.blank? }.empty? }
  scope :from_last_import, where(:last_import => true)
  scoped_order :company_name

  acts_as_list :scope => [:campaign_id, :agent_id, :pending]

  accepts_nested_attributes_for :call_results, :result_values

  acts_as_newsletter_subscribable :email_field => "email_address", :name_field => "contact_name", :source_associations => [:campaign]

  acts_as_taggable


  class << self

    def batch_remove(ids)
      find(ids.gsub(/^,/, "").split(",")).each { |c| c.destroy } unless ids.blank?
    end

    def batch_assign(ids, agent_id)
      contact_ids = []
      assigned_count = 0
      agent = agent_id ? User.find(agent_id).with_role : nil
      find(contact_ids = ids.gsub(/^,/, "").split(",")).each do |c|
        unless c.completed? or (agent and agent.has_max_contacts_in_campaign?(c.campaign))
          c.assign_agent(agent_id)
          assigned_count += 1
        end
      end unless ids.blank?
      [assigned_count, contact_ids.count]
    end

    def batch_move(ids, target_campaign, copy=false)
      find(ids.gsub(/^,/, "").split(",")).each { |c| c.send("#{copy ? 'copy' : 'move'}_to_campaign!".to_sym, target_campaign) } unless ids.blank?
    end

    def to_csv(*ids)
      FasterCSV.generate(:force_quotes => true) do |csv|
        contacts = find(ids)
        csv << CSV_ATTRS.map(&:humanize)
        contacts.each { |c| csv << CSV_ATTRS.map { |attr| c.send(attr).to_s.gsub(/[\n\r\t,]/, " ") } }
      end
    end

    def create_from_csv(formatted_rows, attrs)
      headers = []
      created_contacts = []
      rows = formatted_rows.split("\r\n")
      rows.shift.split("\t").each do |h|
        headers << h.underscore.gsub(" ", "_").delete('/"')
      end if rows.present?
      rows.each do |contact_row|
        contact = Contact.new(attrs)
        contact_row.split("\t").each_with_index do |value, index|
          if CSV_ATTRS.include? headers[index]
            contact.send "#{headers[index]}=", case headers[index]
                                                 when "country" then
                                                   Country.find_by_name(value.delete('/"'))
                                                 when "region" then
                                                   Region.find_by_name(value.delete('/"'))
                                                 else
                                                   value.delete('/"')
                                               end
          end
        end
        created_contacts << contact if contact.save rescue nil
      end
      created_contacts
    end

  end

  def process_for_lead_information?
    false or strict_validate
  end

  def current_call_result
    call_results.reorder("call_results.created_at DESC").first
  end

  def current_call_result_name
    current_call_result ? current_call_result.result.name : "-"
  end

  def current_call_result_note
    current_call_result ? current_call_result.note : "-"
  end

  def agent_name
    agent ? agent.full_name : "-"
  end

  def upgrade_to_lead
    self.reload
    lead = self.deep_clone!({:with_callbacks => true, :include => [:lead_purchases, :lead_translations, {:lead_template_values => :lead_template_value_translations}]})
    lead.update_attribute :type, "Lead"
    self.update_attribute(:lead_id, lead.id)
  end

  def assign_agent(agent_id)
    self.reload
    if agent_id.nil?
      self.contact_past_user_assignments.create(:user_id => read_attribute(:agent_id))
    end
    self.remove_from_list
    self.update_attributes(:agent_id => agent_id)
    self.insert_at
    self.move_to_bottom
  end

  def change_pending_status(pending)
    self.reload
    self.remove_from_list
    self.update_attributes(:pending => pending)
    self.insert_at
    self.move_to_bottom
  end

  def should_be_pending?(agent_)
    ActiveSupport::TimeZone[agent_.time_zone].parse("#{current_call_result.result_values.first.value}") > DateTime.now rescue false
  end

  def higher_item_in_campaign_list
    ids = self.class.for_campaign(campaign).select(:id).ascend_by_company_name.map(&:id)
    index = ids.index(id)+1
    (index >= ids.count or index < 0) ? nil : self.class.find(ids.at(index))
  end

  def lower_item_in_campaign_list
    ids = self.class.for_campaign(campaign).select(:id).ascend_by_company_name.map(&:id)
    index = ids.index(id)-1
    (index >= ids.count or index < 0) ? nil : self.class.find(ids.at(index))
  end

  def can_be_managed_by?(user)
    (campaign.users.map(&:id) + [campaign.creator.id]).include?(user.id) or user.has_role?(:admin)
  end

  def contacts_list_conditions_for(direction)
    Contact.where("pending = ? and campaign_id = ? and agent_id = ? and position #{direction == :higher ? '<' : '>'} ?", pending, campaign_id, agent_id, position).order("position #{direction == :higher ? 'DESC' : 'ASC'}").limit(1).first
  end

  def higher_contact
    contacts_list_conditions_for(:higher)
  end

  def lower_contact
    contacts_list_conditions_for(:lower)
  end

  def first_name
    contact_name.to_s.split.first
  end

  def last_name
    contact_name.to_s.split[1..-1].to_a.join(' ')
  end

  def crm_call_results
    crm_option = campaign.crm_option
    if crm_option == Campaign::CRM_OPTION_OFF
      call_results
    else
      select = "campaign_id IN (#{campaign.crm_campaigns+",#{campaign_id}"})"
      if crm_option == Campaign::CRM_OPTION_COMPANY_NAME
        crm_select(select, ["company_name"])
      elsif crm_option == Campaign::CRM_OPTION_CVR
        crm_select(select, ["company_vat_no"])
      elsif crm_option == Campaign::CRM_OPTION_CONTACT_EMAIL
        crm_select(select, ["email_address"])
      elsif crm_option == Campaign::CRM_OPTION_ALL
        crm_select(select, ["company_name", "email_address", "company_vat_no"])
      end
    end
  end

  def crm_select(select, fields)
    query = "#{select}"
    fields.each { |field| query += " AND lower(#{field}) = '#{send(field).blank? ? "YOU WILL NOT FIND ME - HA HA HA HA" : send(field).downcase.gsub("'", "_")}'" }
    CallResult.where(:contact_id => (Contact.where(query) + [self]).uniq.map(&:id)).order("created_at DESC")
  end

  def move_to_campaign!(other_campaign)
    update_attribute(:campaign, other_campaign)
  end

  def copy_to_campaign!(other_campaign)
    new_contact = self.deep_clone!(:with_callbacks => false, :include => [:call_results => [:call_log, :result_values, :archived_email]])
    new_contact.campaign = other_campaign
    new_contact.save
    new_contact
  end

end