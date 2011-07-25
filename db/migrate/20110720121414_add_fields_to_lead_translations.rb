class AddFieldsToLeadTranslations < ActiveRecord::Migration
  def self.up
    unless LeadTranslation.columns_hash.has_key?("fine_print")
      add_column :lead_translations, :fine_print, :text
    end

    unless LeadTranslation.columns_hash.has_key?("company_description")
      add_column :lead_translations, :company_description, :text
    end
  end

  def self.down
    remove_column :lead_translations, :fine_print
    remove_column :lead_translations, :company_description
  end
end
