class AddTranslationsToEmailTemplates < ActiveRecord::Migration
  def self.up
    EmailTemplate.create_translation_table! :subject => :string, :body => :text
  end

  def self.down
    EmailTemplate.drop_translation_table!
  end
end
