class ::User::CategoryBuyer < ::User
  ROLES = [:category_buyer, :lead_buyer, :customer]

  after_create :set_interests

  include User::RegistrationValidations
  include Addresses
  include BankAccounts
  include User::CommonBuyer

  has_many :lead_purchases, :foreign_key => "owner_id"
  has_many :lead_requests, :foreign_key => "owner_id"

  has_many :country_interests, :foreign_key => 'user_id'
  has_many :category_interests, :foreign_key => 'user_id'
  has_many :countries, :through => :country_interests
  has_many :categories, :through => :category_interests
  has_many :invoices, :foreign_key => "user_id"
  has_many :bought_leads, :through => :lead_purchases, :class_name => "Lead", :source => :lead, :conditions => "accessible_from IS NOT NULL"
  has_and_belongs_to_many :buying_categories, :class_name => 'Category', :join_table => 'categories_users', :foreign_key => :user_id

  validates_presence_of :company_name

  accepts_nested_attributes_for :lead_purchases

  private

  def set_interests
    categories << buying_categories
  end

  public

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