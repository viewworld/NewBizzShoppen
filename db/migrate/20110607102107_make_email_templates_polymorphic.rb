class MakeEmailTemplatesPolymorphic < ActiveRecord::Migration
  def self.up
    add_column :email_templates, :resource_type, :string
    add_column :email_templates, :resource_id, :integer
  end

  def self.down
    remove_column :email_templates, :resource_type
    remove_column :email_templates, :resource_id
  end
end
