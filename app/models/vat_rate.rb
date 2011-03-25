class VatRate < ActiveRecord::Base

  belongs_to :country

  validates_presence_of :country, :rate
  validates_uniqueness_of :country_id
  validates_numericality_of :rate

  accepts_nested_attributes_for :country

end
