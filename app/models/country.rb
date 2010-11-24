class Country < ActiveRecord::Base
  has_many :country_interest
  has_many :leads
  scope :with_leads, select("DISTINCT(name), countries.*").joins("RIGHT JOIN leads on countries.id=leads.country_id")
  scope :with_lead_request_owner, lambda { |owner| select("DISTINCT(name), countries.*").where("requested_by IS NOT NULL and lead_purchases.owner_id = ?", owner.id).joins("RIGHT JOIN leads on countries.id=leads.country_id").joins("RIGHT JOIN lead_purchases on lead_purchases.lead_id=leads.id") }
end
