class AddTranslationsToLeadTemplates < ActiveRecord::Migration
  def self.up
    LeadTemplate.create_translation_table! :name => :string
  end

  def self.down
     LeadTemplate.drop_translation_table!
  end
end
