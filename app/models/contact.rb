class Contact < AbstractLead

  CSV_ATTRS = %w(company_name company_phone_number company_website address_line_1 address_line_2 address_line_3 zip_code country region company_vat_no company_ean_number contact_name direct_phone_number phone_number email_address linkedin_url facebook_url note)
  REQUIRED_FIELDS = %w(company_name company_phone_number country)
  NUMERIC_FIELDS = []

  attr_accessor :strict_validate, :formatted_rows

  belongs_to :campaign
  has_many :call_results, :dependent => :destroy
  has_many :result_values, :through => :call_results
  belongs_to :lead

  belongs_to :agent, :class_name => "User"
  validates_presence_of :company_name, :company_phone_number, :creator_id, :category_id, :country_id, :campaign_id

  scope :with_keyword, lambda { |q| where("lower(company_name) like :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :only_completed, where(:completed => false)
  scope :for_campaign, lambda { |campaign| where(:campaign_id => campaign) }
  scope :for_campaigns, lambda { |campaign_ids| where("campaign_id in (?)", campaign_ids) unless campaign_ids.to_a.empty? }
  scope :with_completed_status, lambda { |completed| where(:completed => completed) }
  scope :with_pending_status, lambda { |pending| where(:pending => pending) }
  scope :available_to_assign, where(:agent_id => nil).with_completed_status(false).with_pending_status(false)
  scope :with_results, joins(:call_results)
  scope :with_agents, lambda { |agent_ids| where("call_results.creator_id IN (:agent_ids)", {:agent_ids => agent_ids }) unless agent_ids.to_a.select{ |id| !id.blank? }.empty? }
  scope :from_last_import, where(:last_import => true)
  scoped_order :company_name

  acts_as_list :scope => [:campaign_id, :agent_id, :pending]

  accepts_nested_attributes_for :call_results, :result_values

  class << self

    def batch_remove(ids)
      find(ids.gsub(/^,/, "").split(",")).each { |c| c.destroy } unless ids.blank?
    end

    def batch_assign(ids, agent_id)
      agent = agent_id ? User.find(agent_id).with_role : nil
      find(ids.gsub(/^,/, "").split(",")).each do |c|
        unless c.completed? or (agent and agent.has_max_contacts_in_campaign?(c.campaign))
          c.assign_agent(agent_id)
        end
      end unless ids.blank?
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
        headers << h.underscore.gsub(" ","_").delete('/"')
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
    lead = self.deep_clone!({:with_callbacks => true, :include => [:lead_purchases, :lead_translations, { :lead_template_values => :lead_template_value_translations} ]})
    lead.update_attribute :type, "Lead"
    self.update_attribute(:lead_id, lead.id)
  end

  def assign_agent(agent_id)
    self.reload
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
end