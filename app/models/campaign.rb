class Campaign < ActiveRecord::Base
  include ScopedSearch::Model

  belongs_to :category
  belongs_to :country
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  has_and_belongs_to_many :users
  has_and_belongs_to_many :results
  has_many :contacts, :dependent => :destroy
  has_many :materials, :as => :resource, :class_name => "Material", :dependent => :destroy

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
  scope :available_for_user, lambda {|user| includes(:users).where("users.id = :user_id OR campaigns.creator_id = :user_id", {:user_id => user.id}) unless user.has_role? :admin}

  def assign(ids)
    self.users = ids.blank? ? [] : User.find(ids)
  end

  def assign_results(ids)
    self.results = ids.blank? ? [] : Result.find(ids)
  end

  def results_for_select
    results.map{|result| [result.name, result.id]}
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
        contact.change_pending_status(false) unless contact.should_be_pending?
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
    creator.id == user.id or user.has_role?(:admin)
  end

  def can_be_accessed_by?(user)
    has_user_as_member?(user) or creator.id == user.id or user.has_role?(:admin)
  end

end