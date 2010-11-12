class Lead < ActiveRecord::Base
  translates :header, :description, :hidden_description

  include ScopedSearch::Model

  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  belongs_to :category
  has_many :lead_translations
  has_many :lead_purchases

  scope :with_keyword, lambda { |q| where("lower(header) like :keyword OR lower(description) like :keyword OR lower(creator_name) like :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :deal_value_from, lambda { |q| where(["purchase_value >= ?", q]) }
  scope :deal_value_to, lambda { |q| where(["purchase_value <= ?", q]) }
  scope :with_category, lambda { |q| where(:category_id => Category.find_by_id(q).self_and_descendants.map(&:id)) }
  scope :with_ids_not_in, lambda { |q| where(["id NOT IN (?)", q]) }

  validates_presence_of :company_name, :lead_name, :phone_number, :sale_limit, :category_id
  validates_inclusion_of :sale_limit, :in => 0..10


  accepts_nested_attributes_for :lead_translations

  after_create :cache_creator_name

  private

  def cache_creator_name
    update_attribute(:creator_name, creator.name) unless creator_name
  end

  def novelty_ratio
    (Date.today - created_at.to_date).to_i
  end

  def hotness_ratio
    (purchase_decision_date - Date.today).to_i.tap do |result|
      result < 0 ? 0 : result
    end
  end

  def certification_level_ratio
    Lead.joins(:lead_purchases).where(:creator_id => creator_id, :creator_type => creator_type).count
  end

  public

  def buyable?
    true #Some more complex logic here...
  end
end