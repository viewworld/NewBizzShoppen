class Address < ActiveRecord::Base

  belongs_to :addressable, :polymorphic => true
  belongs_to :country

  validates_presence_of :address_line_1, :address_line_2, :zip_code, :country

  def to_s
    "#{address_line_1}, #{zip_code} #{address_line_2}, #{address_line_3}"
  end

end

class Address::InvoiceCustomer < Address
end

class Address::InvoiceSeller < Address
end
