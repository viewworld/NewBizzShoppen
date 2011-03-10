class ::User::Customer < ::User
  ROLES = [:customer, :lead_buyer]

  include User::RegistrationValidations
  include Addresses
  include BankAccounts
  include User::CommonBuyer

  has_many :lead_purchases, :foreign_key => "owner_id"
  has_many :lead_requests, :foreign_key => "owner_id"
  has_many :bought_leads, :through => :lead_purchases, :class_name => "Lead", :source => :lead, :conditions => "accessible_from IS NOT NULL"

  has_many :country_interests, :foreign_key => 'user_id'
  has_many :category_interests, :foreign_key => 'user_id'
  has_many :countries, :through => :country_interests
  has_many :categories, :through => :category_interests
  has_many :invoices, :foreign_key => "user_id"
  has_many :accessible_lead_purchases, :foreign_key => :owner_id, :class_name => "LeadPurchase", :conditions => "accessible_from IS NOT NULL"

  accepts_nested_attributes_for :lead_purchases

  validates_presence_of :company_name

  has_many :category_customers, :foreign_key => "user_id"
  has_many :unique_categories, :through => :category_customers, :source => :category

  before_save :handle_interests

  private
  def handle_interests
    if (categories.select { |c| c.is_customer_unique } - unique_categories).size > 0
      (categories.select { |c| c.is_customer_unique } - unique_categories).each { |c| category_interests.detect { |ci| ci.category_id == c.id }.destroy }
    end
  end
end