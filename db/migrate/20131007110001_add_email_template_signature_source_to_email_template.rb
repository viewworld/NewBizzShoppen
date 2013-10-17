class AddEmailTemplateSignatureSourceToEmailTemplate < ActiveRecord::Migration
  def self.up
    add_column :email_templates, :email_template_signature_source_id, :integer
    add_index :email_templates, :email_template_signature_source_id
  end

  def self.down
    remove_index :email_templates, :email_template_signature_source_id
    remove_column :email_templates, :email_template_signature_source_id
  end
end
