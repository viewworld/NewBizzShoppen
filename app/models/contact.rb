class Contact < AbstractLead
  CSV_ATTRS = %w(company_name company_phone_number company_website address_line_1 address_line_2 address_line_3 zip_code country region company_vat_no company_ean_number contact_name contact_title direct_phone_number phone_number email_address linkedin_url facebook_url note pnumber nnmid custom_1 custom_2 custom_3 custom_4 custom_5)
  REQUIRED_FIELDS = %w(company_name company_phone_number country)
  NUMERIC_FIELDS = []

  attr_accessor :strict_validate, :formatted_rows

  belongs_to :campaign
  has_many :call_results, :dependent => :destroy
  has_many :result_values, :through => :call_results
  has_many :leads
  has_many :contact_past_user_assignments, :foreign_key => "contact_id", :dependent => :destroy
  has_many :past_user_assignments, :through => :contact_past_user_assignments, :source => :user
  has_many :notifications, :as => :notifier

  belongs_to :agent, :class_name => User
  belongs_to :user, :class_name => User
  belongs_to :newsletter_list
  belongs_to :newsletter_list_subscriber
  validates_presence_of :company_name, :company_phone_number, :creator_id, :category_id, :country_id, :campaign_id
  validates_presence_of :price, :purchase_decision_date, :if => :process_for_lead_information?

  scope :with_keyword, lambda { |q| where("lower(leads.company_name) like :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :only_completed, where(:completed => false)
  scope :for_campaign, lambda { |campaign| where(:campaign_id => campaign) }
  scope :for_campaigns, lambda { |campaign_ids| where("campaign_id in (?)", campaign_ids) unless campaign_ids.to_a.empty? }
  scope :with_completed_status, lambda { |completed| where(:completed => completed) }
  scope :with_pending_status, lambda { |pending| where(:pending => pending) }
  scope :all_available_to_assign, where(:agent_id => nil).with_completed_status(false).with_pending_status(false)
  scope :available_to_assign, lambda { |user| all_available_to_assign.joins("left join contact_past_user_assignments on leads.id=contact_past_user_assignments.contact_id AND contact_past_user_assignments.user_id = #{user.id}").where("contact_past_user_assignments.user_id is NULL") }
  scope :with_results, joins(:call_results)
  scope :with_current_result_id, lambda { |result_id| joins("inner join call_results on call_results.id = (select id from call_results where contact_id = leads.id order by created_at desc limit 1)").where("call_results.result_id = ?", result_id) }
  scope :without_current_result_id, lambda { |result_id| joins("inner join call_results on call_results.id = (select id from call_results where contact_id = leads.id order by created_at desc limit 1)").where("call_results.result_id <> ?", result_id) }
  scope :with_agents, lambda { |agent_ids| where("call_results.creator_id IN (:agent_ids)", {:agent_ids => agent_ids}) unless agent_ids.to_a.select { |id| !id.blank? }.empty? }
  scope :with_agent_id, lambda { |agent_id| where(:agent_id => agent_id) }
  scope :with_survey, lambda { |survey_id| joins(:survey_recipients).where("survey_recipients.survey_id = ?", survey_id) }
  scope :with_survey_state, lambda { |state| joins(:survey_recipients).where( state.to_i < 0 ? ["survey_recipients.state = ? OR survey_recipients.state = ?", 1, 2] : ["survey_recipients.state = ?", state]) }
  scope :from_last_import, where(:last_import => true)
  scope :unassigned, where(:agent_id => nil)
  scope :uncompleted, with_completed_status(false)
  scope :with_pending_result_type,
      joins("INNER JOIN call_results ON call_results.id = (SELECT id FROM call_results cr WHERE cr.contact_id = leads.id ORDER BY cr.created_at DESC LIMIT 1) INNER JOIN results ON results.id = call_results.result_id INNER JOIN result_values ON result_values.call_result_id = call_results.id").
      where("lower(replace(results.name, ' ', '_')) IN (?)", CallResult::PENDING_RESULT_TYPES.map(&:to_s))
  scope :without_pending_result_type,
      joins("LEFT JOIN call_results ON call_results.id = (SELECT id FROM call_results cr WHERE cr.contact_id = leads.id ORDER BY cr.created_at DESC LIMIT 1) LEFT JOIN results ON results.id = call_results.result_id").
      where("results.name IS NULL OR lower(replace(results.name, ' ', '_')) NOT IN (?)", CallResult::PENDING_RESULT_TYPES.map(&:to_s))
  scope :not_pending_for, lambda { |agent| where("result_values.value <= ?", DateTime.now.in_time_zone(agent.time_zone)) }
  scope :by_position_asc, order("leads.position ASC")
  scoped_order :company_name

  acts_as_list :scope => [:campaign_id, :agent_id, :pending]

  accepts_nested_attributes_for :call_results, :result_values

  acts_as_taggable

  after_update :sync_with_campaign_sources


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

  def upgrade_to_lead(survey_recipient=nil)
    self.reload
    if survey_recipient
      self.upgraded_from_survey_id = survey_recipient.survey_id
      survey_recipient.categories.each do |_category|
        self.category = _category
        upgrade_to_lead!
      end
    else
      upgrade_to_lead!
    end
  end

  def upgrade_to_lead!
    lead = self.deep_clone!({:with_callbacks => true, :include => [:lead_purchases, :lead_translations, {:lead_template_values => :lead_template_value_translations}]})
    lead.update_attribute :type, "Lead"

    utl_cr = call_results.select { |cr| cr.result.name == "Upgraded to lead" }.sort { |cr1,cr2| cr1.created_at<=>cr2.created_at  }.last
    new_lead = Lead.find(lead.id)
    new_lead.creator = utl_cr.creator.admin? ? User.find(new_lead.agent_id).with_role : utl_cr.creator
    new_lead.save
    new_lead.update_attribute(:contact_id, self.id)
    new_lead.update_attribute(:published, false)
    new_lead.update_attribute(:published, true)

    campaign_result = CampaignsResult.where(:result_id => utl_cr.result.id, :campaign_id => self.campaign_id).first
    if campaign_result.settings["prompt_for_decision_date"].eql?("0")
      new_lead.update_attribute(:purchase_decision_date, Date.parse("01.01.2099"))
    end

    if tag_list.any?
      lead = Lead.find(lead.id)
      tag_list.each do |tag|
        lead.tag_list << tag
      end
      lead.save
    end
  end

  def assign_agent(agent_id)
    self.reload
    #campaign.return_to_pool_all_for_agent(agent_id) if campaign.shared_contact_pool?
    if agent_id.nil?
      self.contact_past_user_assignments.create(:user_id => read_attribute(:agent_id))
    end
    #self.remove_from_list
    self.update_attributes(:agent_id => agent_id)
    #self.insert_at
    self.move_to_bottom
  end

  def change_pending_status(pending)
    self.reload
    #self.remove_from_list
    self.update_attributes(:pending => pending)
    #self.insert_at
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
    (campaign.users.map(&:id) + [campaign.creator_id]).include?(user.id) or user.has_role?(:admin)
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
      select = "campaign_id IN (#{campaign.crm_campaigns})"
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
    query_variables = []
    fields.each do |field|
      query += " AND lower(#{field}) = ?"
      query_variables << "#{send(field).blank? ? "[field_blank]" : send(field).downcase}"
    end
    CallResult.where(:contact_id => (Contact.where([query] + query_variables).select("id") + [self]).map(&:id).uniq).order("created_at DESC")
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

  def unassign
    pending ? reassign : return_to_pool
  end

  def return_to_pool
    update_attribute(:agent_id, nil)
  end

  def reassign
    if available_agent = campaign.users.with_agents_without_call_centres.
              joins("LEFT JOIN leads ON leads.agent_id = users.id").
              select("users.*, COUNT(leads.*) as contacts").
              group("users.id").
              reorder("contacts ASC").first
      assign_agent available_agent
      notifications.update_all(
          :notificable_type => available_agent.with_role.class.name,
          :notificable_id   => available_agent.id
      )
    end
  end

  def to_s
    company_name
  end

  def sync_with_campaign_sources
    if campaign and campaign.import_contacts_from_lists_enabled? and campaign.sync_with_campaign_source? and campaign.newsletter_lists.present?
      copy_attributes_to_newsletter_subscribers!
    end
  end

  def campaign_source_subscriber_ids
    ([newsletter_list_subscriber] + NewsletterListSubscriber.where(:newsletter_list_id => campaign.newsletter_list_ids, :subscriber_type => 'Contact', :subscriber_id => id)).uniq.compact.map(&:id)
  end

  def copy_attributes_to_newsletter_subscribers!
    params = {}
    NewsletterListSubscriber.selected_attributes.each { |attr| params[attr] = send(attr) }
    NewsletterListSubscriber.update_all(params, { :id => campaign_source_subscriber_ids })
  end

  def move_to_bottom
    return unless in_list?
    assume_bottom_position
  end
end
