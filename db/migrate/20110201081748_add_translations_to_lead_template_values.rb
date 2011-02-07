class AddTranslationsToLeadTemplateValues < ActiveRecord::Migration
  def self.up
    LeadTemplateValue.create_translation_table! :value => :string
  end

  def self.down
    LeadTemplateValue.drop_translation_table!
  end
end
