class ::User::CategorySupplier < ::User
  ROLES = [:category_supplier, :lead_supplier, :supplier]
  CSV_ATTRS = %w{email first_name last_name company_name screen_name address_line_1 address_line_2 address_line_3 zip_code country region  phone vat_number}
  REQUIRED_FIELDS = %w{email first_name last_name company_name screen_name address_line_1 address_line_3 zip_code}

  after_save :set_interests

  include User::RegistrationValidations
  include Addresses
  include BankAccounts
  include User::CommonSupplier
  include User::Subaccounts

  has_many :lead_purchases, :foreign_key => "owner_id"
  has_many :lead_requests, :foreign_key => "owner_id"

  has_many :country_interests, :foreign_key => 'user_id'
  has_many :category_interests, :foreign_key => 'user_id'
  has_many :countries, :through => :country_interests
  has_many :categories, :through => :category_interests
  has_many :invoices, :foreign_key => "user_id"
  has_many :bought_leads, :through => :lead_purchases, :class_name => "Lead", :source => :lead, :conditions => "accessible_from IS NOT NULL"
  has_and_belongs_to_many :buying_categories, :class_name => 'Category', :join_table => 'categories_users', :foreign_key => :user_id, :order => "cached_slug ASC"

  has_many :assigned_lead_purchases, :foreign_key => :assignee_id, :class_name => "LeadPurchase", :conditions => "accessible_from IS NOT NULL"
  has_many :assigned_leads, :class_name => "Lead", :through => :assigned_lead_purchases, :conditions => "accessible_from IS NOT NULL", :source => :lead

  validates_presence_of :company_name, :unless => Proc.new { |u| u.parent.present? }

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
    LeadCategory.category_supplier_accessible_categories(self)
  end

  def parent_accessible_categories_without_auto_buy
    parent_accessible_categories.where(:auto_buy => false)
  end

  def parent_accessible_categories
    parent ? parent.with_role.accessible_categories : accessible_categories
  end

  def parent_buying_categories
    parent ? parent.with_role.buying_categories : buying_categories
  end

  def buying_categories_with_descendants
    LeadCategory.where(buying_categories.map { |bc| "lft between #{bc.lft} and #{bc.rgt}" }.join(" or "))
  end

  def remove_category_supplier
    return false unless (has_role?(:category_supplier) and has_role?(:supplier) and (active_subscription.is_free? or active_subscription.subscription_plan.roles.include?(:supplier)))
    subaccounts.each { |user| u = ::User::CategorySupplier.find(user.id); u.send(:remove_role_category_supplier); u.save }
    send(:remove_role_category_supplier)
    save
    upgrade_subscription!(SubscriptionPlan.active.free.for_role(:supplier).first)
    true
  end
  
########################################################################################################################
#
#   IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT
#
########################################################################################################################

  include AdvancedImport
  include AdvancedUserImport

########################################################################################################################

end