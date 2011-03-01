class AddCompanyNameToSeller < ActiveRecord::Migration
  def self.up
    add_column :sellers, :company_name, :string
  end

  def self.down
    remove_column :sellers, :company_name
  end
end
