class Country < ActiveRecord::Base
  has_many :country_interest
  has_many :leads
  has_one :default_bank_account, :class_name => 'BankAccount', :foreign_key => :country_id, :primary_key => :id, :conditions => {:country_default => true}

  validates_uniqueness_of :name

  scope :with_leads, select("DISTINCT(name), countries.*").joins("RIGHT JOIN leads on countries.id=leads.country_id")
  scope :with_lead_request_owner, lambda { |owner| select("DISTINCT(name), countries.*").where("requested_by IS NOT NULL and lead_purchases.owner_id = ?", owner.id).joins("RIGHT JOIN leads on countries.id=leads.country_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
  scope :with_lead_request_requested_by, lambda { |requested_by| select("DISTINCT(name), countries.*").where("lead_purchases.requested_by = ?", requested_by.id).joins("RIGHT JOIN leads on countries.id=leads.country_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
  scope :with_lead_purchase_owner, lambda { |owner| select("DISTINCT(name), countries.*").where("requested_by IS NULL and lead_purchases.owner_id = ? and accessible_from IS NOT NULL", owner.id).joins("RIGHT JOIN leads on countries.id=leads.country_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
  scope :with_lead_purchase_assignee, lambda { |assignee| select("DISTINCT(name), countries.*").where("lead_purchases.assignee_id = ? and accessible_from IS NOT NULL", assignee.id).joins("RIGHT JOIN leads on countries.id=leads.country_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
  scope :within_accessible_categories, lambda { |customer| where("leads.category_id NOT IN (?)", customer.accessible_categories_ids) }

end
