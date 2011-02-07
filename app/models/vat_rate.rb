class VatRate < ActiveRecord::Base

  belongs_to :country

  validates_presence_of :country, :rate
  validates_uniqueness_of :country_id

end
