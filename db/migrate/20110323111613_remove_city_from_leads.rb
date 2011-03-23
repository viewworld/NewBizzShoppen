class RemoveCityFromLeads < ActiveRecord::Migration
  def self.up
    Lead.all.each do |lead|
      lead.update_attribute(:address_line_3, lead.city)
    end

    remove_column :leads, :city
  end

  def self.down
    add_column :leads, :city, :string
  end
end
