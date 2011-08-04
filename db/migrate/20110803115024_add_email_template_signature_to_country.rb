class AddEmailTemplateSignatureToCountry < ActiveRecord::Migration
  def self.up
    add_column :countries, :email_template_signature, :text
  end

  def self.down
    remove_column :countries, :email_template_signature
  end
end
