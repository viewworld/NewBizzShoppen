class LeadRequest < LeadPurchaseBase

  belongs_to :requestee, :class_name => "User::LeadUser", :foreign_key => :requested_by

  include ScopedSearch::Model

  default_scope where("requested_by IS NOT NULL")

  scope :with_leads, joins("INNER JOIN leads on leads.id=lead_purchases.lead_id")
  scope :with_keyword, lambda { |q| where("lower(leads.header) like :keyword OR lower(leads.description) like :keyword OR lower(leads.creator_name) like :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :with_category, lambda { |category_id| where("leads.category_id = ?", category_id) }
  scope :with_deal_value_from, lambda { |from| where("leads.purchase_value >= ?", from) }
  scope :with_deal_value_to, lambda { |to| where("leads.purchase_value <= ?", to) }
  scope :with_country, lambda { |country_id| where("leads.country_id = ?", country_id) }
  scope :with_requested_by, lambda { |requested_by| where("requested_by = ?", requested_by) }

  def accept!
    self.assignee_id = requested_by
    self.requested_by = nil
    self.accessible = true if owner.big_buyer?
    self.save
  end

  def reject!
    self.destroy
  end
end