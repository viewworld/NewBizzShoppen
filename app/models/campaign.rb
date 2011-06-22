class Campaign < ActiveRecord::Base
  include ScopedSearch::Model

  belongs_to :category
  belongs_to :country
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  has_and_belongs_to_many :users
  has_and_belongs_to_many :results
  has_many :contacts, :dependent => :destroy
  has_many :materials, :as => :resource, :class_name => "Material", :dependent => :destroy
  has_one :send_material_email_template, :as => :resource, :class_name => "EmailTemplate", :conditions => "uniq_id = 'result_send_material'", :dependent => :destroy

  validates_uniqueness_of :name
  validates_presence_of :name, :max_contact_number, :category_id, :country_id, :start_date, :end_date
  validates_numericality_of :max_contact_number, :only_integer => true, :greater_than_or_equal_to => 0

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

  scoped_order :name, :start_date, :end_date
  scope :joins_on_category, joins("INNER JOIN categories ON campaigns.category_id=categories.id")
  scope :joins_on_country, joins("INNER JOIN countries ON campaigns.country_id=countries.id")
  scope :ascend_by_category, order("categories.name ASC").joins_on_category
  scope :descend_by_category, order("categories.name DESC").joins_on_category
  scope :ascend_country, order("countries.name ASC").joins_on_country
  scope :descend_by_country, order("countries.name DESC").joins_on_country
  scope :available_for_user, lambda { |user| includes(:users).where("users.id = :user_id OR campaigns.creator_id = :user_id", {:user_id => user.id}) unless user.has_role? :admin }

  after_save :check_send_material_email_template

  private

  def check_send_material_email_template
    unless send_material_email_template
      global_template = EmailTemplate.global.where(:uniq_id => 'result_send_material').first
      self.send_material_email_template = global_template.clone
      global_template.translations.each do |translation|
        self.send_material_email_template.translations << translation.clone
      end
      self.save
    end
  end

  public

  def return_contact_to_the_pool
    contacts.where("agent_id NOT IN (?)", user_ids).each { |c| c.update_attribute(:agent_id, nil) }
  end

  def assign(ids)
    self.users = ids.blank? ? [] : User.find(ids)
    return_contact_to_the_pool
  end

  def assign_results(ids)
    self.results = ids.blank? ? [] : Result.find(ids)
  end

  def results_for_select
    results.map { |result| [result.name, result.id] }
  end

  def completion
    "#{contacts.with_completed_status(true).count * 100 / contacts.count}%" rescue "0%"
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
      contacts_list = contacts.available_to_assign
      while (not agent.with_role.has_max_contacts_in_campaign? self) and contacts_list.present?
        contacts_list.shift.assign_agent(agent.id)
      end
    end
  end

  def has_user_as_member?(user)
    user.with_role.campaigns.include?(self)
  end

  def can_be_managed_by?(user)
    creator.id == user.id or user.has_role?(:admin) or (user.has_role?(:call_centre) and has_user_as_member?(user))
  end

  def can_be_accessed_by?(user)
    user.has_role?(:admin) or creator.id == user.id or has_user_as_member?(user)
  end

  def create_contacts_from_xls(spreadsheet, current_user)
    spreadsheet.default_sheet = spreadsheet.sheets.first
    2.upto(spreadsheet.last_row) do |line|
      contact = contacts.build
      Contact::CSV_ATTRS.each_with_index do |field, index|
        if field == "region"
          contact.region = Region.find_by_name(spreadsheet.cell(line, index+1))
        elsif field == "country"
          contact.country = Country.find_by_name(spreadsheet.cell(line, index+1))
        else
          contact.send("#{field}=".to_sym, spreadsheet.cell(line, index+1) ? spreadsheet.cell(line, index+1) : "")
        end
      end
      contact.creator_id = current_user.id
      contact.creator_type = "User"
      contact.category_id = category_id
      contact.creator_name = current_user
      contact.save
    end
  end

  def contacts_for_auto_completer
    contacts.map{|c| "{text:'#{c.company_name}', url:'/callers/campaigns/#{id}/agent_work_screen/contacts/#{c.id}'}"}
  end

end