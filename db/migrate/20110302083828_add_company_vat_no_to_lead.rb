class AddCompanyVatNoToLead < ActiveRecord::Migration
  def self.up
    add_column :leads, :company_vat_no, :string
  end

  def self.down
    remove_column :leads, :company_vat_no
  end
end
