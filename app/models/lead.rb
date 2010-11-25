class Lead < ActiveRecord::Base
  INFINITY             = 1.0/0
  NOVELTY_LEVEL_RANGES = [(0..8), (9..30), (31..INFINITY)]
  HOTNESS_LEVEL_RANGES = [(29..INFINITY), (7..28), (-INFINITY..6)]  

  translates :header, :description, :hidden_description

  include ScopedSearch::Model

  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  belongs_to :category
  belongs_to :country
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
  #====================
  scope :bestsellers, order("lead_purchases_counter DESC")
  scope :latest, order("created_at DESC")
  scope :featured, where(:featured => true)
  scope :purchased, where("lead_purchases_counter > 0")

  validates_presence_of :header, :description, :hidden_description, :purchase_value, :price, :company_name, :contact_name, :phone_number, :sale_limit, :category_id, :address, :purchase_decision_date, :country_id
  validates_inclusion_of :sale_limit, :in => 0..10
  

  liquid_methods :header, :description, :company_name, :contact_name, :phone_number, :email_address, :address, :www_address

  accepts_nested_attributes_for :lead_translations, :allow_destroy => true

  scoped_order :id, :header, :sale_limit, :price, :lead_purchases_counter, :published

  attr_accessor :notify_buyers_after_update
  after_create :cache_creator_name
  before_destroy :can_be_removed?
  after_find :set_buyers_notification

  private

  def cache_creator_name
    update_attribute(:creator_name, creator.name) unless creator_name
  end

  def novelty_ratio
    (Date.today - created_at.to_date).to_i
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

  def certification_level_ratio
    Lead.joins(:lead_purchases).where(:creator_id => creator_id, :creator_type => creator_type).count
  end

    def can_be_removed?
    lead_purchases.empty?
    end

  def set_buyers_notification
    self.notify_buyers_after_update = true
  end

  public

  def hotness_level
    HOTNESS_LEVEL_RANGES.each_with_index { |range, i| return i if range.include?(hotness_ratio) }
  end

  def novelty_level
    NOVELTY_LEVEL_RANGES.each_with_index { |range, i| return i if range.include?(novelty_ratio) }
  end

  def certification_level
    if certification_level_ratio >= Settings.certification_level_2.to_i
      2
    elsif certification_level_ratio >= Settings.certification_level_1.to_i
      1
    else
      0
    end
  end

  def buyable?
    true #Some more complex logic here...
  end
end