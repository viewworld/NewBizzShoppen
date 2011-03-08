class ChangeLeadTemplateValuesFieldValueTypeToText < ActiveRecord::Migration
  def self.up
    remove_column :lead_template_values, :value
    add_column :lead_template_values, :value, :text
    remove_column :lead_template_value_translations, :value
    add_column :lead_template_value_translations, :value, :text
  end

  def self.down
  end
end
