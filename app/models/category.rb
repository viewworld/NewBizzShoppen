class Category < ActiveRecord::Base
  translates :name, :description

  acts_as_nested_set
  has_many :lead_templates
  has_many :category_translations
  has_one :image,
          :class_name => "Asset::CategoryImage",
          :as         => :resource,
          :conditions => "asset_type = 'Asset::CategoryImage'",
          :dependent  => :destroy
  has_many :category_interests
  has_many :news, :as => :resource, :class_name => "Article::News::CategoryHome", :dependent => :destroy
  has_one :blurb, :as => :resource, :class_name => "Article::Cms::InterfaceContentText", :dependent => :destroy

  after_save :set_cached_slug
  before_save :handle_locking_for_descendants
  after_create :generate_blurb

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :parent_id

  has_many :leads do
    def including_subcategories
      Lead.where(:category_id => proxy_owner.self_and_descendants.map(&:id))
    end
  end

  has_many :published_leads, :class_name => 'Lead', :conditions => ["published = ?", true] do
    def including_subcategories
      Lead.where(:category_id => proxy_owner.self_and_descendants.map(&:id)).published_only
    end
  end

  has_many :category_customers
  has_many :category_agents
  has_many :customers, :through => :category_customers, :source => :user
  has_many :agents, :through => :category_agents, :source => :user
  has_many :categories_users
  has_many :buying_users, :through => :categories_users, :source => :user

  has_many :category_countries
  has_many :countries, :through => :category_countries, :source => :country

  scope :without_locked_and_not_published, where("is_locked = ? or (is_locked = ? and published_leads_count > 0)", false, true)
  scope :within_accessible, lambda { |customer| where("categories.id IN (?)", customer.accessible_categories_ids) }
  scope :without_locked, where("is_locked = ?", false)
  scope :with_leads, where("total_leads_count > 0")
  scope :with_lead_request_owner, lambda { |owner| select("DISTINCT(name), categories.*").where("requested_by IS NOT NULL and lead_purchases.owner_id = ?", owner.id).joins("RIGHT JOIN leads on categories.id=leads.category_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
  scope :with_lead_request_requested_by, lambda { |requested_by| select("DISTINCT(name), categories.*").where("lead_purchases.requested_by = ?", requested_by.id).joins("RIGHT JOIN leads on categories.id=leads.category_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
  scope :with_lead_purchase_owner, lambda { |owner| select("DISTINCT(name), categories.*").where("requested_by IS NULL and lead_purchases.owner_id = ? and accessible_from IS NOT NULL", owner.id).joins("RIGHT JOIN leads on categories.id=leads.category_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
  scope :with_lead_purchase_assignee, lambda { |assignee| select("DISTINCT(name), categories.*").where("lead_purchases.assignee_id = ? and accessible_from IS NOT NULL", assignee.id).joins("RIGHT JOIN leads on categories.id=leads.category_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
  scope :with_lead_templates_created_by, lambda { |creator| select("DISTINCT(categories.name), categories.*").where("lead_templates.creator_id = ?", creator.id).joins(:lead_templates) }
  scope :without_unique, where("is_customer_unique = ? and is_agent_unique = ?", false, false)
  scope :with_all_customer_unique, where("is_customer_unique = ?", true)
  scope :with_all_agent_unique, where("is_agent_unique = ?", true)
  scope :with_customer_unique, lambda { |customer| where("(is_customer_unique = ? and category_customers.user_id is NULL) or (is_customer_unique = ? and category_customers.user_id = ?)", false, true, customer.id).joins("LEFT JOIN category_customers ON categories.id=category_customers.category_id") }
  scope :with_agent_unique, lambda { |agent| select("DISTINCT(categories.id), categories.*").where("(is_agent_unique = ? and category_agents.user_id is NULL) or (is_agent_unique = ? and category_agents.user_id = ?)#{' or (is_agent_unique = \'t\' and category_agents.user_id = ' + agent.parent_id.to_s + ')' if agent.has_role?(:call_centre_agent)}", false, true, agent.id).joins("LEFT JOIN category_agents ON categories.id=category_agents.category_id") }
  scope :with_buying, lambda { |user| joins(:buying_users).where(:users => {:id => user.id}) }
  scope :with_call_centre_unique, lambda { |call_centre| where("(is_agent_unique = ? and category_agents.user_id is NULL) or (is_agent_unique = ? and category_agents.user_id IN (?))", false, true, [call_centre]+call_centre.subaccounts.map(&:id)).joins("LEFT JOIN category_agents ON categories.id=category_agents.category_id") }
  scope :category_buyer_accessible_categories, lambda { |user| joins("
    LEFT JOIN categories_users ON categories.id = categories_users.category_id
    LEFT JOIN users ON users.id = categories_users.user_id
    LEFT JOIN category_customers ON categories.id = category_customers.category_id
  ").where("(categories.is_customer_unique = 't' and category_customers.user_id = :user_id) OR (categories_users.user_id = :user_id)", {:user_id => user.id})}
  scope :with_comment_threads, select("DISTINCT(categories.id), categories.*").joins("INNER JOIN leads ON leads.category_id=categories.id INNER JOIN comments ON comments.commentable_id=leads.id")
  before_destroy :check_if_category_is_empty
  before_destroy :mark_articles_to_destroy

  accepts_nested_attributes_for :image

  private

  def generate_blurb
    create_blurb(:title => "blurb_category_home_page_#{seo_name.underscore}".humanize,
                 :key => "blurb_category_home_page_#{id}").publish!
  end

  def seo_name(add_id = false)
    name_en = CategoryTranslation.first(:conditions => ["category_id = ? and locale = ?", self.id, "en"])
    "#{add_id ? id : ''} #{name_en.blank? ? name : name_en.name}".to_url
  end

  def seo_name_with_id
    seo_name(true)
  end

  def set_cached_slug
    if cached_slug.blank? or cached_slug != seo_name
      self.cached_slug = seo_name
      self.save unless seo_name.blank?
    end
  end

  def check_if_category_is_empty
    return true if is_empty?
    errors[:base] << I18n.t("flash.categories.destroy.error")
    false
  end

  def mark_articles_to_destroy
    blurb.force_destroy=true if blurb
    news.each{|n| n.force_destroy=true}
  end

  def refresh_leads_count_cache!
    Category.find(self_and_ancestors.map(&:id)).each do |c|
      c.update_attribute(:total_leads_count, c.leads.including_subcategories.count)
    end
  end
  

  
  def handle_locking_for_descendants
    if is_locked_changed?
      (self_and_descendants - [self]).each do |category|
        category.update_attribute(:is_locked, is_locked)
      end
    end
  end 

  def refresh_published_leads_count_cache!
    Category.find(self_and_ancestors.map(&:id)).each do |c|
      c.update_attribute(:published_leads_count, c.published_leads.including_subcategories.count)
    end
  end


  public

  def move_leads_to_subcategory
    if parent and parent.descendants.size == 1 and parent.leads.present?
      parent.leads.each do |lead|
        lead.update_attributes(:notify_buyers_after_update => false, :category => self)
      end
    end
  end

  def is_empty?
    total_leads_count.zero?
  end

  def to_s
    name
  end

  def price_visible_for?(user)
    if user and user.has_any_role?(:lead_buyer, :lead_user) and user.parent.present? and (no_prices_for_team_members? or user.hide_lead_prices?)
      return false
    end
    true
  end

  def can_publish_leads?
    !root? or (root? and children.size == 0)
  end

end
