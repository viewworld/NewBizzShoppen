class Deal < AbstractLead
  ajaxful_rateable :stars => 5, :dimensions => [:rating]

  has_one :logo, :class_name => "Asset::DealLogo", :as => :resource, :conditions => "asset_type = 'Asset::DealLogo'", :dependent => :destroy
  has_many :images, :class_name => "Asset::DealImage", :as => :resource, :conditions => "asset_type = 'Asset::DealImage'", :dependent => :destroy
  has_many :materials, :class_name => "Asset::DealMaterial", :as => :resource, :conditions => "asset_type = 'Asset::DealMaterial'", :dependent => :destroy

  scope :without_inactive, where("purchase_decision_date >= ?", Date.today)
  scope :active_is, lambda { |q| where("end_date #{q == "1" ? ">=" : "<"} ?", Date.today) }
  scope :for_user, lambda { |q| where("creator_id = ?", q.id) }

  private

  def process_for_lead_information?
    false
  end

  def cache_creator_name
    update_attribute(:creator_name, creator.full_name) unless creator_name
  end

end