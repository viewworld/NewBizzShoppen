class ::User::Supplier < ::User
  ROLES = [:supplier, :lead_supplier]
  CSV_ATTRS = %w{email first_name last_name company_name address_line_1 address_line_2 address_line_3 zip_code country region phone vat_number pnumber nnmid custom_1 custom_2 custom_3 custom_4 custom_5}
  REQUIRED_FIELDS = %w{email first_name last_name company_name address_line_1 address_line_3 zip_code}

  include User::RegistrationValidations
  include Addresses
  include BankAccounts
  include User::CommonSupplier
  include User::CampaignMonitorClient

  include User::Subaccounts #ROLE_MERGE


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

  validates_presence_of :company_name #ROLE_MERGE, :unless => Proc.new { |u| u.parent.present? }

  has_many :category_customers, :foreign_key => "user_id"
  has_many :unique_categories, :through => :category_customers, :source => :category

  before_save :handle_interests
  after_create :set_interests #ROLE_MERGE after_save :set_interests


  #ROLE_MERGE
  has_and_belongs_to_many :buying_categories, :class_name => 'Category', :join_table => 'categories_users', :foreign_key => :user_id, :order => "cached_slug ASC"
  has_many :assigned_leads, :class_name => "Lead", :through => :assigned_lead_purchases, :conditions => "accessible_from IS NOT NULL", :source => :lead
  ###

  def check_and_correct_interests!
    all_categories = categories.clone
    categories.select { |c| c.parent_id.nil? }.each do |category|
      all_categories = all_categories - category.self_and_descendants
    end
    all_categories.each do |category|
      self.categories << category.ancestors
    end
    self.save
  end

  def leads
    bought_leads
  end

  def comment_threads
    Comment.for_users(self.self_and_descendants)
  end

  def can_start_new_lead_thread?
    true
  end

  def deal_certification_requests
    DealCertificationRequest.active.for_email(email)
  end

  def accessible_categories
    LeadCategory.category_supplier_accessible_categories(self)
  end


  def parent_accessible_categories_without_auto_buy
    parent_accessible_categories.where(:auto_buy => false)
  end

  def parent_accessible_categories_without_auto_buy_with_descendants
    if pac = parent_accessible_categories_without_auto_buy and pac.any?
      LeadCategory.where(pac.map { |bc| "lft between #{bc.lft} and #{bc.rgt}" }.join(" or "))
    else
      pac
    end
  end

  def parent_accessible_categories
    parent ? parent.with_role.accessible_categories : accessible_categories
  end

  def parent_buying_categories
    ((parent ? parent.with_role.buying_categories : buying_categories) + [company_unique_category].compact).uniq
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


  private

  def set_interests
    self.countries = Country.all
    #ROLE_MERGE self.categories = buying_categories
    #ROLE_MERGE self.countries = buying_categories.map(&:countries).flatten
  end

  def handle_interests
    if (categories.select { |c| c.is_customer_unique } - unique_categories).size > 0
      (categories.select { |c| c.is_customer_unique } - unique_categories).each { |c| category_interests.detect { |ci| ci.category_id == c.id }.destroy }
    end
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
