class Category < ActiveRecord::Base
  translates :name, :description
  include ScopedSearch::Model

  attr_accessor :remove_image

  acts_as_nested_set
  has_many :lead_templates
  has_many :category_translations
  has_one :image,
          :class_name => "Asset::CategoryImage",
          :as => :resource,
          :conditions => "asset_type = 'Asset::CategoryImage'",
          :dependent => :destroy
  has_many :category_interests
  has_many :supplier_subscribers, :through => :category_interests, :source => :user
  has_many :news, :as => :resource, :class_name => "Article::News::CategoryHome", :dependent => :destroy
  has_one :blurb, :as => :resource, :class_name => "Article::Cms::InterfaceContentText", :dependent => :destroy
  has_one :email_template, :as => :resource

  after_save :set_cached_slug
  before_save :handle_locking_for_descendants, :handle_auto_buy, :handle_image_removal
  after_create :generate_blurb

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => [:type, :parent_id]

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

  has_many :deals do
    def including_subcategories
      Deal.where(:category_id => proxy_owner.self_and_descendants.map(&:id))
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
  has_many :campaigns

  check_associations_before_destroy :customers, :agents, :countries, :leads, :deals, :campaigns, :lead_templates, :supplier_subscribers, :buying_users

  scope :without_locked_and_not_published, where("is_locked = ? or (is_locked = ? and published_leads_count > 0)", false, true)
  scope :within_accessible, lambda { |supplier| where("categories.id IN (?)", supplier.accessible_categories_ids) }
  scope :without_locked, where("is_locked = ?", false).order("name")
  scope :with_leads, where("total_leads_count > 0").order("name")
  scope :with_lead_request_owner, lambda { |owner| select("DISTINCT(name), categories.*").where("lead_purchases.requested_by IS NOT NULL and lead_purchases.owner_id = ?", owner.id).joins("RIGHT JOIN leads on categories.id=leads.category_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
  scope :with_lead_request_requested_by, lambda { |requested_by| select("DISTINCT(name), categories.*").where("lead_purchases.requested_by = ?", requested_by.id).joins("RIGHT JOIN leads on categories.id=leads.category_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
  scope :with_lead_purchase_owner, lambda { |owner| select("DISTINCT(name), categories.*").where("lead_purchases.requested_by IS NULL and lead_purchases.owner_id = ? and accessible_from IS NOT NULL", owner.id).joins("RIGHT JOIN leads on categories.id=leads.category_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
  scope :with_lead_purchase_assignee, lambda { |assignee| select("DISTINCT(name), categories.*").where("lead_purchases.assignee_id = ? and accessible_from IS NOT NULL", assignee.id).joins("RIGHT JOIN leads on categories.id=leads.category_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
  scope :with_lead_templates_created_by, lambda { |creator| select("DISTINCT(categories.name), categories.*").where("lead_templates.creator_id = ?", creator.id).joins(:lead_templates) }
  scope :without_unique, where("is_customer_unique = ? and is_agent_unique = ?", false, false)
  scope :with_all_supplier_unique, where("is_customer_unique = ?", true)
  scope :without_supplier_unique, where("is_customer_unique = ?", false)
  scope :with_all_agent_unique, where("is_agent_unique = ?", true)
  scope :with_supplier_unique, lambda { |supplier| where("(is_customer_unique = ? and category_customers.user_id is NULL) or (is_customer_unique = ? and category_customers.user_id = ?)", false, true, supplier.id).joins("LEFT JOIN category_customers ON categories.id=category_customers.category_id") }
  scope :with_agent_unique, lambda { |agent| select("DISTINCT(categories.id), categories.*").where("(is_agent_unique = ? and category_agents.user_id is NULL) or (is_agent_unique = ? and category_agents.user_id = ?)#{' or (is_agent_unique = \'t\' and category_agents.user_id = ' + agent.parent_id.to_s + ')' if agent.has_role?(:call_centre_agent)}", false, true, agent.id).joins("LEFT JOIN category_agents ON categories.id=category_agents.category_id") }
  scope :with_buying, lambda { |user| joins(:buying_users).where(:users => {:id => user.id}) }
  scope :with_call_centre_unique, lambda { |call_centre| where("(is_agent_unique = ? and category_agents.user_id is NULL) or (is_agent_unique = ? and category_agents.user_id IN (?))", false, true, [call_centre]+call_centre.subaccounts.map(&:id)).joins("LEFT JOIN category_agents ON categories.id=category_agents.category_id") }
  scope :category_supplier_accessible_categories, lambda { |user| select("DISTINCT(categories.id), categories.*").joins("
    LEFT JOIN categories_users ON categories.id = categories_users.category_id
    LEFT JOIN users ON users.id = categories_users.user_id
    LEFT JOIN category_customers ON categories.id = category_customers.category_id
  ").where("(categories.is_customer_unique = 't' and category_customers.user_id = :user_id) OR (categories_users.user_id = :user_id)", {:user_id => user.id}) }
  scope :with_comment_threads, select("DISTINCT(categories.id), categories.*").joins("INNER JOIN leads ON leads.category_id=categories.id INNER JOIN comments ON comments.commentable_id=leads.id")
  scope :without_auto_buy, where(:auto_buy => false)
  scope :with_keyword, lambda { |keyword| where("lower(name) like ?", "%#{keyword.to_s.downcase}%") }
  scope :with_unique, where("is_customer_unique IS true or is_agent_unique IS true")
  scope :with_locked, where("is_locked IS true")
  scope :with_public, where("auto_buy IS false")
  before_destroy :check_if_category_is_empty
  before_destroy :mark_articles_to_destroy

  accepts_nested_attributes_for :image

  private

  def handle_image_removal
    if remove_image == "1"
      self.image = nil
    end
    true
  end

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
    news.each { |n| n.force_destroy=true }
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
      c.update_attribute(:published_leads_count, c.published_leads.including_subcategories.without_inactive.count)
    end
  end

  def handle_auto_buy
    if auto_buy_changed? and auto_buy? and !customers.first.nil?
      user_category_interest = customers.first.with_role.category_interests.where(:category_id => self.id).first
      if user_category_interest and customers.first.deal_category_id != self.id
        user_category_interest.destroy
      elsif !user_category_interest and customers.first.deal_category_id == self.id
        user = customers.first.with_role
        user.categories << self
      end
      Lead.without_bought_and_requested_by(customers.first).published_only.without_inactive.where(:category_id => self.id).each do |lead|
        customers.first.cart.add_lead(lead)
      end
    end
  end


  public

  def move_leads_to_subcategory
    if parent and parent.root? and parent.descendants.size == 1 and parent.leads.present?
      parent.leads.each do |lead|
        lead.update_attributes(:notify_suppliers_after_update => false, :category => self)
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
    if user and user.has_any_role?(:lead_supplier, :lead_user) and user.parent.present? and (no_prices_for_team_members? or user.hide_lead_prices?)
      return false
    end
    true
  end

  def can_publish_leads?
    !root? or (root? and children.size == 0)
  end

  def deals_count_for_user(user)
    deals.including_subcategories.without_inactive.published_only.not_blocked_by_sold_out_vouchers.count
  end

  def leads_count_for_user(user)
    leads_scope = leads.including_subcategories.published_only.without_inactive.scoped
    if user
      if user.supplier? and (user.all_requested_lead_ids.any? or user.all_purchased_lead_ids.any?)
        leads_scope = leads_scope.with_ids_not_in(user.all_requested_lead_ids + user.all_purchased_lead_ids)
      end
      if user.has_any_role?(:supplier, :lead_supplier, :lead_user)
        leads_scope = leads_scope.with_supplier_unique_categories(user.parent ? user.parent_id : user.id)
      elsif user.agent?
        leads_scope = leads_scope.with_agent_unique_categories(user.id)
      end
    else
      leads_scope = leads_scope.without_unique_categories
    end
    leads_scope.count
  end

  def is_company_unique?
    if new_record?
      false
    else
      User.where(:deal_category_id => id).first.present?
    end
  end

  def self.roots_for(user)
    root_categories = if user
                        if user.admin?
                          where("parent_id IS NULL")
                        elsif user.has_role?(:category_supplier) and is_a?(LeadCategory)
                          user.parent_accessible_categories_without_auto_buy and  is_a?(LeadCategory)
                        elsif user.has_any_role?(:supplier, :lead_supplier, :lead_user)
                          where("parent_id IS NULL").with_supplier_unique(user.parent ? user.parent.with_role : user)
                        else
                          where("parent_id IS NULL").with_agent_unique(user)
                        end
                      else
                        where("parent_id IS NULL").without_unique
                      end

    root_categories = root_categories.without_locked_and_not_published unless user and user.admin?
    root_categories
  end

  def children_for(user)
    if user
      if user.admin?
         children_categories = children
      elsif user.has_any_role?(:supplier, :lead_supplier, :lead_user) and is_a?(LeadCategory)
        children_categories = children.with_supplier_unique(user.parent ? user.parent.with_role : user)
      else
        children_categories = children.with_agent_unique(user)
      end
    else
      children_categories = children.without_unique
    end

    children_categories = children_categories.without_locked_and_not_published unless user and user.admin?
    children_categories
  end

########################################################################################################################
#
#   IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT    IMPORT
#
########################################################################################################################

  include AdvancedImport

  def advanced_import_leads_from_xls(options)
    return false unless advanced_import_field_blank_validation(options[:lead_fields], options[:spreadsheet_fields])
    lead_fields, spreadsheet_fields = options[:lead_fields].split(","), options[:spreadsheet_fields].split(",")
    return false unless advanced_import_field_size_validation(lead_fields, spreadsheet_fields)

    headers, spreadsheet = advanced_import_headers(options[:spreadsheet])
    merged_fields = advanced_import_merged_fields(headers, lead_fields, spreadsheet_fields)
    counter, errors, publish_hash = 0, [], {}

    ActiveRecord::Base.transaction do
      2.upto(spreadsheet.last_row) do |line|
        lead = Lead.new
        import_fields.each { |field| lead = assign_field(lead, field, spreadsheet.cell(line, merged_fields[field]), spreadsheet.celltype(line, merged_fields[field])) }
        lead = assign_current_user(lead, options[:current_user])
        temp_published = lead.published
        lead.published = false
        if lead.save
          publish_hash[lead.id] = temp_published
          counter += 1
        else
          errors << "[line: #{line}] #{lead.errors.map { |k, v| "#{k} #{v}" }.*(", ")}"
          counter = 0
          raise ActiveRecord::Rollback
        end
      end
    end

    if counter > 0
      Lead.find(publish_hash.keys).each { |lead| lead.update_attribute(:published, publish_hash[lead.id]) }
    end

    {:counter => "#{counter} / #{spreadsheet.last_row-1}", :errors => errors.*("<br/>")}
  end

  def import_fields
    Lead::CSV_ATTRS + import_lead_templates_fields
  end

  def required_import_fields
    Lead::REQUIRED_FIELDS + import_lead_templates_fields.map { |field| field if field.split("|").last == "true" }.compact
  end

  private

  def assign_current_user(lead, current_user)
    lead.creator_id = current_user.id
    lead.creator_type = current_user.with_role.class.to_s
    lead.category_id = id
    lead.creator_name = current_user
    lead
  end

########################################################################################################################

end
