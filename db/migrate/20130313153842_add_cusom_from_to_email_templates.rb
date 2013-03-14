class AddCusomFromToEmailTemplates < ActiveRecord::Migration
  def self.up
    add_column :email_templates, :custom_reply_to, :boolean, :default => false
    execute "UPDATE email_templates SET custom_reply_to = FALSE"
  end

  def self.down
    remove_column :email_templates, :custom_reply_to
  end
end
