class ::User::Supplier < ::User
  ROLES = [:supplier, :lead_supplier]
  CSV_ATTRS = %w{email first_name last_name company_name address_line_1 address_line_2 address_line_3 zip_code country region  phone vat_number}
  REQUIRED_FIELDS = %w{email first_name last_name company_name address_line_1 address_line_3 zip_code}

  include User::RegistrationValidations
  include Addresses
  include BankAccounts
  include User::CommonSupplier
  include User::CampaignMonitorClient

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
  after_create :set_interests

  def set_interests
    self.countries = Country.all
  end

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

  private

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