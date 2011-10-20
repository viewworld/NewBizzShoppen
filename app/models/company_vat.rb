class CompanyVat < ActiveRecord::Base

  validates_presence_of :vat_number
end
