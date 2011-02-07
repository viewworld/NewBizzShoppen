class AddIsMandatoryToLeadTemplateFields < ActiveRecord::Migration
  def self.up
    add_column :lead_template_fields, :is_mandatory, :boolean, :default => false
  end

  def self.down
    remove_column :lead_template_fields, :is_mandatory
  end
end
