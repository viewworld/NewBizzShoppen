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
