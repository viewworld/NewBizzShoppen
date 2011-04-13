class LeadPurchaseBase < ActiveRecord::Base
  set_table_name "lead_purchases"

  STATUSES = %w(not_contacted contacted meeting signed).freeze

  belongs_to :lead
  belongs_to :owner, :class_name => "User::Customer", :foreign_key => "owner_id"

  include ScopedSearch::Model
  scope :accessible, where("accessible_from IS NOT NULL")
  scope :with_owner, lambda { |owner_id| where("owner_id = ?", owner_id) }
  scope :with_assignee, lambda { |assignee_id| where("assignee_id = ?", assignee_id) }
  scope :with_leads, joins("INNER JOIN leads on leads.id=lead_purchases.lead_id")
  scope :with_keyword, lambda { |q| where("lower(leads.header) like :keyword OR lower(leads.description) like :keyword OR lower(leads.creator_name) like :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :with_category, lambda { |category_id| where("leads.category_id = ?", category_id) }
  scope :with_deal_value_from, lambda { |from| where("leads.purchase_value >= ?", from) }
  scope :with_deal_value_to, lambda { |to| where("leads.purchase_value <= ?", to) }
  scope :with_country, lambda { |country_id| where("leads.country_id = ?", country_id) }
  scope :with_zip_code, lambda { |zip_code| where("leads.zip_code = ?", zip_code) }
  scope :with_requested_by, lambda { |requested_by| where("requested_by = ?", requested_by) }

  validates_presence_of :lead_id

  delegate :header, :hidden_description, :description, :purchase_value, :category, :country, :clicks_count, :exposures_count, :sale_limit, :novelty_level, :hotness_level, :certification_level, :price, :to => :lead

  public

  def self.statuses_for_select
    STATUSES.to_enum(:each_with_index).map { |code, i| [I18n.t("lead_purchases.statuses.#{code}"), i] }
  end
end