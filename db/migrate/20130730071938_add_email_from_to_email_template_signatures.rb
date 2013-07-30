class AddEmailFromToEmailTemplateSignatures < ActiveRecord::Migration
  def self.up
    add_column :email_template_signatures, :email_from, :string
  end

  def self.down
    remove_column :email_template_signatures, :email_from
  end
end
