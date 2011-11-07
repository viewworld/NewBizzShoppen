class Address < ActiveRecord::Base

  belongs_to :addressable, :polymorphic => true
  belongs_to :country
  belongs_to :region

  validates_presence_of :address_line_1, :address_line_3, :zip_code, :country_id, :unless => Proc.new { |a| ActiveRecord::ConnectionAdapters::Column.value_to_boolean(a.disabled_validations) == true  }

  attr_accessor :disabled_validations

  def to_s
    "#{address_line_1}, #{zip_code} #{address_line_2}, #{address_line_3}"
  end

end

class Address::InvoiceSupplier < Address
end

class Address::InvoiceSeller < Address
end

class Address::Bank < Address
end
