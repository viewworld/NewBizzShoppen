class Deal < AbstractLead
  include ScopedSearch::Model

  has_one :logo, :class_name => "Asset::DealLogo", :as => :resource, :conditions => "asset_type = 'Asset::DealLogo'", :dependent => :destroy
  has_many :images, :class_name => "Asset::DealImage", :as => :resource, :conditions => "asset_type = 'Asset::DealImage'", :dependent => :destroy
  has_many :materials, :class_name => "Asset::DealMaterial", :as => :resource, :conditions => "asset_type = 'Asset::DealMaterial'", :dependent => :destroy
  has_many :leads, :class_name => "Lead", :foreign_key => "deal_id"
  has_many :comment_threads, :class_name => "Comment", :foreign_key => :commentable_id, :conditions => {:commentable_type => 'AbstractLead'}
  has_many :deal_certification_requests
  has_and_belongs_to_many :deal_templates, :class_name => "LeadTemplate", :join_table => "leads_lead_templates", :foreign_key => "lead_id", :association_foreign_key => "lead_template_id"
  belongs_to :lead_category, :class_name => "Category", :foreign_key => "lead_category_id"
  belongs_to :deal_admin, :class_name => "User", :foreign_key => "deal_admin_email", :primary_key => "email"

  scope :without_inactive, where("leads.end_date >= ? and leads.start_date <= ?", Date.today, Date.today)
  scope :without_requested_by, lambda { |u| select("DISTINCT leads.*").joins("LEFT JOIN leads lr ON lr.deal_id = leads.id").where(["(lr.requested_by <> ? OR lr.requested_by IS NULL)", u.id]) if u }
  scope :active_is, lambda { |q| where("#{q == "1" ? "end_date >= ? and start_date <= ?" : "end_date < ? or start_date > ?"}", Date.today, Date.today) }
  scope :for_user, lambda { |q| where("creator_id = ?", q.id) }

  scoped_order :header, :end_date, :published, :created_at

  validates_presence_of :start_date, :end_date, :email_address
  validates_presence_of :deal_admin_email, :unless => Proc.new{|d| d.new_record? }
  validate :deal_admin_presence, :unless => Proc.new{|d| d.new_record? }

  before_create :create_uniq_deal_category
  after_create :certify_for_unknown_email, :assign_deal_admin
  before_save :handle_published

  attr_accessor :creation_step

  accepts_nested_attributes_for :logo, :reject_if => proc { |attributes| attributes['asset'].blank? }
  accepts_nested_attributes_for :images, :reject_if => proc { |attributes| attributes['asset'].blank? }
  accepts_nested_attributes_for :materials, :reject_if => proc { |attributes| attributes['asset'].blank? }

  ajaxful_rateable :stars => 5, :allow_update => false, :cache_column => :deal_average_rating
  acts_as_commentable

  def deal_admin_presence
    self.errors.add(:deal_admin_email, :invalid) if !deal_admin or !deal_admin.has_any_role?(:call_centre, :call_centre_agent)
  end

  def assign_deal_admin
    update_attribute(:deal_admin_email, (creator.agent? ? creator.email : Settings.default_deal_admin_email))
  end

  def self.new_for_user(user)
    Deal.new(
        :company_name => user.company_name,
        :contact_name => user.full_name,
        :email_address => user.email,
        :phone_number => user.phone,
        :address_line_1 => user.with_role.address.address_line_1,
        :address_line_2 => user.with_role.address.address_line_2,
        :address_line_3 => user.with_role.address.address_line_3,
        :zip_code => user.with_role.address.zip_code,
        :country_id => user.with_role.address.country_id,
        :region_id => user.with_role.address.region_id,
        :start_date => Date.today,
        :end_date => Date.today,
        :price => 0)
  end

  def buyer
    creator.buyer? ? creator : User::Customer.where(:email => email_address).first
  end

  def has_unread_comments_for_user?(user)
    user ? comment_threads.unread_by_user(user).count > 0 : false
  end

  def requested_by?(user)
    leads.where(:requested_by => user.id).any?
  end

  def current_dcr
    deal_certification_requests.last
  end

  def certified?
    !deal_certification_requests.blank? and current_dcr.approved?
  end

  private

  def process_for_lead_information?
    true
  end

  def cache_creator_name
    update_attribute(:creator_name, creator.full_name) unless creator_name
  end

  def create_uniq_deal_category
    if buyer and creator.buyer?
      category = buyer.deal_category_id ? LeadCategory.find(buyer.deal_category_id) : LeadCategory.create(:name => buyer.company_name)
      buyer.update_attribute(:deal_category_id, category.id) if buyer.deal_category_id.blank?
      category.update_attribute(:is_customer_unique, true) unless category.is_customer_unique
      unless category.customers.include?(buyer)
        category.customers << buyer
        category.save
      end
      self.lead_category_id = category.id
    end
  end

  def certify_for_unknown_email
    if creator.agent? or creator.admin? and buyer.nil?
      deal_certification_requests.create
    end
  end

  def handle_published
    if published_changed? and published and buyer.nil?
      self.published = false
      nil
    end
    true
  end

end