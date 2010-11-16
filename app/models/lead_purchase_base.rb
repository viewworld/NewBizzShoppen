class LeadPurchaseBase < ActiveRecord::Base
  set_table_name "lead_purchases"

  STATUSES = %w(not_contacted contacted meeting signed).freeze

  belongs_to :lead
  belongs_to :owner, :class_name => "User::Customer", :foreign_key => "owner_id"

  validates_presence_of :lead_id

  delegate :header, :description, :purchase_value, :category, :country, :clicks_count, :exposures_count, :sale_limit, :novelty_level, :hotness_level, :certification_level, :price, :to => :lead

  public

  def self.statuses_for_select
    STATUSES.to_enum(:each_with_index).map { |code, i| [I18n.t("lead_purchases.statuses.#{code}"), i] }
  end
end