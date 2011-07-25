class Deal < AbstractLead
  ajaxful_rateable :stars => 5, :dimensions => [:rating]

  has_one :logo, :class_name => "Asset::DealLogo", :as => :resource, :conditions => "asset_type = 'Asset::DealLogo'", :dependent => :destroy
  has_many :images, :class_name => "Asset::DealImage", :as => :resource, :conditions => "asset_type = 'Asset::DealImage'", :dependent => :destroy
  has_many :materials, :class_name => "Asset::DealMaterial", :as => :resource, :conditions => "asset_type = 'Asset::DealMaterial'", :dependent => :destroy
  has_many :leads, :class_name => "Lead", :foreign_key => "deal_id"
  has_and_belongs_to_many :deal_templates, :class_name => "LeadTemplate", :join_table => "leads_lead_templates", :foreign_key => "lead_id", :association_foreign_key => "lead_template_id"
  belongs_to :lead_category, :class_name => "Category", :foreign_key => "lead_category_id"

  scope :without_inactive, where("leads.end_date >= ? and leads.start_date <= ?", Date.today, Date.today)
  scope :without_requested_by, lambda { |u| select("DISTINCT leads.*").joins("LEFT JOIN leads lr ON lr.deal_id = leads.id").where(["(lr.requested_by <> ? OR lr.requested_by IS NULL)", u.id]) if u }
  scope :active_is, lambda { |q| where("#{q == "1" ? "end_date >= ? and start_date <= ?" : "end_date < ? or start_date > ?"}", Date.today, Date.today) }
  scope :for_user, lambda { |q| where("creator_id = ?", q.id) }

  validates_presence_of :start_date, :end_date, :email_address

  before_create :create_uniq_deal_category
  after_create :certify_for_unknown_email

  attr_accessor :creation_step

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

  private

  def process_for_lead_information?
    true
  end

  def cache_creator_name
    update_attribute(:creator_name, creator.full_name) unless creator_name
  end

  def create_uniq_deal_category
    if buyer
        category = buyer.deal_category_id ? Category.find(buyer.deal_category_id) : Category.create(:name => buyer.company_name)
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
      #certify!
    end
  end

end