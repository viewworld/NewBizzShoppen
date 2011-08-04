class AddTranslationsToLeads < ActiveRecord::Migration
  def self.up
    Lead.create_translation_table! :header => :string, :description => :text, :hidden_description => :text, :fine_print => :text, :company_description => :text
  end

  def self.down
    Lead.drop_translation_table!
  end
end
