class Country < ActiveRecord::Base
  has_many :country_interest
  has_many :leads
  scope :with_leads, select("DISTINCT(name), countries.*").joins("RIGHT JOIN leads on countries.id=leads.country_id")
end
