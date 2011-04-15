class Contact < AbstractLead

  CSV_ATTRS = %w(company_name company_phone_number company_website address_line_1 address_line_2 address_line_3 zip_code country region company_vat_no company_ean_number contact_name direct_phone_number phone_number email_address linkedin_url facebook_url)

  attr_accessor :strict_validate, :formatted_rows

  belongs_to :campaign
  has_many :call_results, :dependent => :destroy

  belongs_to :agent, :class_name => "User"
  validates_presence_of :company_name, :company_phone_number, :creator_id, :category_id, :country_id

  scope :with_keyword, lambda { |q| where("lower(company_name) like :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :only_completed, where(:completed => false)
  scope :for_campaign, lambda { |campaign| where(:campaign_id => campaign) }
  scope :with_completed_status, lambda { |completed| where(:completed => completed) }
  scope :with_pending_status, lambda { |pending| where(:pending => pending) }
  scope :available_to_assign, where(:agent_id => nil).with_completed_status(false).with_pending_status(false)
  scoped_order :company_name

  acts_as_list :scope => [:campaign_id, :agent_id, :pending]

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
        contacts.each { |c| csv << CSV_ATTRS.map { |attr| c.send attr } }
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
                Country.find_by_name(value.delete('/"')) || Country.first
              when "region" then
                Region.find_by_name(value.delete('/"'))
              else
                value.delete('/"')
            end
          end
        end
        created_contacts << contact if contact.save
      end
      created_contacts
    end

  end

  def process_for_lead_information?
    false or strict_validate
  end

  def current_call_result
    call_results.order("created_at").last
  end

  def current_call_result_name
    current_call_result ? current_call_result.result.name : "-"  
  end

  def agent_name
    agent ? agent.full_name : "-"
  end

  def upgrade_to_lead
    Lead.create!(self.attributes)
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

  def should_be_pending?
    DateTime.parse("#{current_call_result.result_values.first.value} #{DateTime.now.formatted_offset}") > DateTime.now rescue false
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

end