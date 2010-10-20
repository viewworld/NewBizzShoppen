class Lead < ActiveRecord::Base
  translates :header, :description, :hidden_description

  validates_presence_of :company_name, :lead_name, :phone_number
end
