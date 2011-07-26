class AddTranslationsToLeadTemplates < ActiveRecord::Migration
  def self.up
    #LeadTemplate.create_translation_table! :name => :string
    ActiveRecord::Migration.execute %{CREATE TABLE "lead_template_translations" ("id" serial primary key, "lead_template_id" integer, "locale" character varying(255), "name" character varying(255), "created_at" timestamp, "updated_at" timestamp)}
  end

  def self.down
     LeadTemplate.drop_translation_table!
  end
end
