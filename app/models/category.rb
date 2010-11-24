class Category < ActiveRecord::Base
  translates :name, :description

  acts_as_nested_set

  has_one :image,
          :class_name => "Asset::CategoryImage",
          :as         => :resource,
          :conditions => "asset_type = 'Asset::CategoryImage'",
          :dependent  => :destroy
  has_many :category_interests
  has_many :leads do
    def including_subcategories
      Lead.where(:category_id => proxy_owner.self_and_descendants.map(&:id))
    end
  end

  scope :with_leads, where("total_leads_count > 0")
  scope :with_lead_request_owner, lambda { |owner| select("DISTINCT(name), categories.*").where("requested_by IS NOT NULL and lead_purchases.owner_id = ?", owner.id).joins("RIGHT JOIN leads on categories.id=leads.category_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
  scope :with_lead_request_requested_by, lambda { |requested_by| select("DISTINCT(name), categories.*").where("lead_purchases.requested_by = ?", requested_by.id).joins("RIGHT JOIN leads on categories.id=leads.category_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
  scope :with_lead_purchase_owner, lambda { |owner| select("DISTINCT(name), categories.*").where("requested_by IS NULL and lead_purchases.owner_id = ? and accessible = ?", owner.id, true).joins("RIGHT JOIN leads on categories.id=leads.category_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
  scope :with_lead_purchase_assignee, lambda { |assignee| select("DISTINCT(name), categories.*").where("lead_purchases.assignee_id = ? and accessible = ?", assignee.id, true).joins("RIGHT JOIN leads on categories.id=leads.category_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }

  before_destroy :check_if_category_is_empty

  accepts_nested_attributes_for :image

  private

  def check_if_category_is_empty
    return true if is_empty?
    errors[:base] << I18n.t("flash.categories.actions.destroy.error")
    false
  end

  def refresh_leads_count_cache!
    Category.find(self_and_ancestors.map(&:id)).each do |c|
      c.update_attribute(:total_leads_count, c.leads.including_subcategories.count)
    end
  end

  public

  def is_empty?
    total_leads_count.zero?
  end

  def to_s
    name
  end

end
