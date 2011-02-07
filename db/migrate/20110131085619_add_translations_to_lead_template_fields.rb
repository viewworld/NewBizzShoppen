class AddTranslationsToLeadTemplateFields < ActiveRecord::Migration
  def self.up
    LeadTemplateField.create_translation_table! :name => :string
  end

  def self.down
    LeadTemplateField.drop_translation_table!
  end
end
