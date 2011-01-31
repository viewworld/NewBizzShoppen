class Lead < ActiveRecord::Base
  INFINITY             = 1.0/0
  NOVELTY_LEVEL_RANGES = [(0..8), (9..30), (31..INFINITY)]
  HOTNESS_LEVEL_RANGES = [(29..INFINITY), (7..28), (-INFINITY..6)]
  BLACK_LISTED_ATTRIBUTES = [:published]

  translates :header, :description, :hidden_description

  include ScopedSearch::Model

  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  belongs_to :category
  belongs_to :country
  belongs_to :currency
  has_many :lead_translations, :dependent => :destroy
  has_many :lead_purchases

  scope :with_keyword, lambda { |q| where("lower(header) like :keyword OR lower(description) like :keyword OR lower(creator_name) like :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :deal_value_from, lambda { |q| where(["purchase_value >= ?", q]) }
  scope :deal_value_to, lambda { |q| where(["purchase_value <= ?", q]) }
  scope :price_from, lambda { |q| where(["price >= ?", q]) }
  scope :price_to, lambda { |q| where(["price <= ?", q]) }
  scope :lead_purchases_counter_from, lambda { |q| where(["lead_purchases_counter >= ?", q]) }
  scope :lead_purchases_counter_to, lambda { |q| where(["lead_purchases_counter <= ?", q]) }
  scope :purchase_value_from, lambda { |q| where(["purchase_value >= ?", q]) }
  scope :purchase_value_to, lambda { |q| where(["purchase_value <= ?", q]) }
  scope :with_category, lambda { |q| where(:category_id => Category.find_by_id(q).self_and_descendants.map(&:id)) }
  scope :with_country, lambda { |country_id| where(:country_id => country_id) }
  scope :with_ids_not_in, lambda { |q| where(["leads.id NOT IN (?)", q]) }
  scope :without_inactive, where("lead_purchases_counter < sale_limit")
  scope :without_outdated, lambda { where("purchase_decision_date >= ?", Date.today.to_s ) }
  scope :without_locked_users, joins("INNER JOIN users ON users.id=leads.creator_id").where("users.locked_at is NULL")
  scope :with_status, lambda { |q| where(["leads.published = ?", q]) }
  scope :published_only, where(:published => true)
  scope :with_creator_type, lambda {|creator_type| where(["leads.creator_type = ?", "User::#{creator_type}"]) }
  scope :within_accessible_categories, lambda { |accessible_categories_ids| where("category_id IN (?)", accessible_categories_ids) }
  scope :with_call_centre, lambda { |call_centre_id| where(["users.parent_id = ?", call_centre_id]).joins("INNER JOIN users ON leads.creator_id=users.id") }
  #====================
  scope :featured, where(:featured => true)
  scope :purchased, where("lead_purchases_counter > 0")
  scope :without_bought_and_requested_by, lambda {|u| joins("LEFT JOIN lead_purchases lp ON lp.lead_id = leads.id").where(["(lp.owner_id <> ? OR lp.owner_id IS NULL) AND (lp.assignee_id <> ? OR lp.assignee_id IS NULL) AND (lp.requested_by <> ? OR lp.requested_by IS NULL)", u.id, u.id, u.id]) if u}
  scope :bestsellers, order("lead_purchases_counter DESC")
  scope :latest, order("created_at DESC")

  scope :joins_on_lead_purchases , joins("INNER JOIN lead_purchases ON lead_purchases.lead_id=leads.id")
  scope :with_created_by, lambda { |agent_id| where("creator_id = ?", agent_id) }
  scope :with_revenue_by, lambda { |agent| select("sum(price) as id").where("creator_id = ? and requested_by IS NULL", agent.id).joins_on_lead_purchases }
  scope :with_rated_good_by, lambda { |agent| where("creator_id = ? and lead_purchases.rating_level > -1 and lead_purchases.rating_level <= ? and requested_by IS NULL", agent.id, LeadPurchase::RATING_SATISFACTORY).joins_on_lead_purchases }
  scope :with_rated_bad_by, lambda { |agent| where("creator_id = ? and lead_purchases.rating_level > ? and requested_by IS NULL", agent.id, LeadPurchase::RATING_SATISFACTORY).joins_on_lead_purchases }
  scope :with_not_rated_by, lambda { |agent| where("creator_id = ? and (lead_purchases.rating_level = -1 or lead_purchases.rating_level is NULL) and requested_by IS NULL", agent.id).joins_on_lead_purchases }

  validates_presence_of :header, :description, :purchase_value, :price, :company_name, :contact_name, :phone_number, :sale_limit, :category_id, :purchase_decision_date, :country_id, :currency, :address_line_1, :city, :zip_code
  validates_presence_of :hidden_description, :unless => Proc.new{|l| l.created_by?('PurchaseManager')}
  validates_inclusion_of :sale_limit, :in => 0..10


  liquid_methods :header, :description, :company_name, :contact_name, :phone_number, :email_address, :address, :www_address
  #TODO ???
  liquid :header

  delegate :certification_level, :to => :creator

  accepts_nested_attributes_for :lead_translations, :allow_destroy => true

  scoped_order :id, :header, :sale_limit, :price, :lead_purchases_counter, :published, :has_unsatisfactory_rating, :purchase_value

  attr_protected :published

  attr_accessor :current_user
  attr_accessor :notify_buyers_after_update
  after_create :cache_creator_name
  before_destroy :can_be_removed?
  after_find :set_buyers_notification
  before_update :notify_buyers_about_changes
  before_save :set_published_at

  private

  def mass_assignment_authorizer
    if self.current_user and current_user.can_publish_leads?
      self.class.protected_attributes.reject! { |a| BLACK_LISTED_ATTRIBUTES.include?(a.to_sym)  }
      self.class.protected_attributes
    else
      super
    end
  end

  def cache_creator_name
    update_attribute(:creator_name, creator.name) unless creator_name
  end

  def novelty_ratio
    (Date.today - published_at.to_date).to_i
  end

  def hotness_ratio
    if purchase_decision_date
      (purchase_decision_date - Date.today).to_i.tap do |result|
        return result < 0 ? 0 : result
      end
    else
      INFINITY
    end
  end

  def set_published_at
    if published_changed?
      self.published_at = published ? Time.now : nil
    end
  end

    def can_be_removed?
    lead_purchases.empty?
    end

  def set_buyers_notification
    self.notify_buyers_after_update = true
  end

  def notify_buyers_about_changes
    if ActiveRecord::ConnectionAdapters::Column.value_to_boolean(notify_buyers_after_update) and lead_purchases.present?
      lead_purchases.map(&:owner).uniq.each { |buyer| deliver_notify_buyers_about_changes(buyer.email) }
    end
  end

  def deliver_notify_buyers_about_changes(email)
    deliver_email_template(email, "notify_buyers_about_lead_update")
  end

  def deliver_email_template(email, uniq_id)
    ApplicationMailer.email_template(email, EmailTemplate.find_by_uniq_id(uniq_id), {:lead => self}).deliver
  end

  public

  def hotness_level
    HOTNESS_LEVEL_RANGES.each_with_index { |range, i| return i if range.include?(hotness_ratio) }
  end

  def novelty_level
    NOVELTY_LEVEL_RANGES.each_with_index { |range, i| return i if range.include?(novelty_ratio) }
  end

  def buyable?
    true #Some more complex logic here...
  end

  def calculate_average_rating
    ratings_percentage = lead_purchases.map(&:rating_as_percentage).select { |rp| rp >= 0 }
    unless ratings_percentage.empty?
      self.average_rating = ((ratings_percentage.sum.to_f / ratings_percentage.size.to_f) * 100).round
    else
      self.average_rating = -1
    end
  end

  def average_rating_as_text
    "#{average_rating}%"
  end

  def created_by?(creator_type)
    self.creator_type == "User::#{creator_type}"
  end

  def address
    [address_line_1, address_line_2, address_line_3, zip_code, city, county].join(" ")
  end

  def duplicate_fields(lead)
    if lead
      ["company_name", "company_phone_number", "company_website", "address_line_1", "address_line_2", "address_line_3", "zip_code",
      "county", "country_id", "company_ean_number", "contact_name", "direct_phone_number", "phone_number", "email_address", "linkedin_url", "facebook_url"].each do |field|
        self.send("#{field}=".to_sym, lead.send(field.to_sym))
      end
    end
  end
end