class CreateEmailTemplateSignatures < ActiveRecord::Migration
  def self.up
    create_table :email_template_signatures do |t|
      t.integer :related_id
      t.string :related_type
      t.text :body
      t.timestamps
    end

    EmailTemplateSignature.create_translation_table! :body => :text
  end

  def self.down
    drop_table :email_template_signatures
    EmailTemplateSignature.drop_translation_table!
  end
end
