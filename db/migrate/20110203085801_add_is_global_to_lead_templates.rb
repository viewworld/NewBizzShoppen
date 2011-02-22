class AddIsGlobalToLeadTemplates < ActiveRecord::Migration
  def self.up
    add_column :lead_templates, :is_global, :boolean, :default => false
  end

  def self.down
    remove_column :lead_templates, :is_global
  end
end
