class Deal < AbstractLead
  ajaxful_rateable :stars => 5, :dimensions => [:rating]

  has_one :logo, :class_name => "Asset::DealLogo", :as => :resource, :conditions => "asset_type = 'Asset::DealLogo'", :dependent => :destroy
  has_many :images, :class_name => "Asset::DealImage", :as => :resource, :conditions => "asset_type = 'Asset::DealImage'", :dependent => :destroy
  has_many :materials, :class_name => "Asset::DealMaterial", :as => :resource, :conditions => "asset_type = 'Asset::DealMaterial'", :dependent => :destroy
  has_many :leads, :class_name => "Lead", :foreign_key => "deal_id"

  scope :without_inactive, where("leads.end_date >= ? and leads.start_date <= ?", Date.today, Date.today)
  scope :without_requested_by, lambda { |u| select("DISTINCT leads.*").joins("LEFT JOIN leads lr ON lr.deal_id = leads.id").where(["(lr.requested_by <> ? OR lr.requested_by IS NULL)", u.id]) if u }
  scope :active_is, lambda { |q| where("#{q == "1" ? "end_date >= ? and start_date <= ?" : "end_date < ? or start_date > ?"}", Date.today, Date.today) }
  scope :for_user, lambda { |q| where("creator_id = ?", q.id) }

  before_create :create_uniq_deal_category

  private

  def process_for_lead_information?
    false
  end

  def cache_creator_name
    update_attribute(:creator_name, creator.full_name) unless creator_name
  end

  def create_uniq_deal_category
    user = User.find(self.creator_id)
    category = user.deal_category_id ? Category.find(user.deal_category_id) : Category.create(:name => user.company_name)
    user.update_attribute(:deal_category_id, category.id) if user.deal_category_id.blank?
    category.update_attribute(:is_customer_unique, true) unless category.is_customer_unique
    unless category.customers.include?(user)
      category.customers << user
      category.save
    end
    self.category_id = category.id
  end

end