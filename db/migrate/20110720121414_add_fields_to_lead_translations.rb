class AddFieldsToLeadTranslations < ActiveRecord::Migration
  def self.up
    add_column :lead_translations, :fine_print, :text
    add_column :lead_translations, :company_description, :text
  end

  def self.down
    remove_column :lead_translations, :fine_print
    remove_column :lead_translations, :company_description
  end
end
