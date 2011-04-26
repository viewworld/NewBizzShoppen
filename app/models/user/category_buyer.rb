class ::User::CategoryBuyer < ::User
  ROLES = [:category_buyer, :lead_buyer, :customer]

  after_save :set_interests

  include User::RegistrationValidations
  include Addresses
  include BankAccounts
  include User::CommonBuyer
  include User::Subaccounts

  has_many :lead_purchases, :foreign_key => "owner_id"
  has_many :lead_requests, :foreign_key => "owner_id"

  has_many :country_interests, :foreign_key => 'user_id'
  has_many :category_interests, :foreign_key => 'user_id'
  has_many :countries, :through => :country_interests
  has_many :categories, :through => :category_interests
  has_many :invoices, :foreign_key => "user_id"
  has_many :bought_leads, :through => :lead_purchases, :class_name => "Lead", :source => :lead, :conditions => "accessible_from IS NOT NULL"
  has_and_belongs_to_many :buying_categories, :class_name => 'Category', :join_table => 'categories_users', :foreign_key => :user_id

  has_many :assigned_lead_purchases, :foreign_key => :assignee_id, :class_name => "LeadPurchase", :conditions => "accessible_from IS NOT NULL"
  has_many :assigned_leads, :class_name => "Lead", :through => :assigned_lead_purchases, :conditions => "accessible_from IS NOT NULL", :source => :lead

  validates_presence_of :company_name, :unless => Proc.new{|u| u.parent.present?}

  accepts_nested_attributes_for :lead_purchases

  private

  def set_interests
    self.categories = buying_categories
    self.countries = buying_categories.map(&:countries).flatten
  end

  public

  def leads
    bought_leads
  end

  def comment_threads
    Comment.for_users(self.self_and_descendants)
  end

  def accessible_categories
    Category.category_buyer_accessible_categories(self)
  end

  def parent_accessible_categories
    parent ? parent.with_role.accessible_categories : accessible_categories
  end

  def parent_buying_categories
    parent ? parent.with_role.buying_categories : buying_categories
  end

end