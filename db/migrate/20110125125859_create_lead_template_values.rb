class CreateLeadTemplateValues < ActiveRecord::Migration
  def self.up
    create_table :lead_template_values do |t|
      t.integer :lead_template_field_id
      t.integer :lead_id
      t.string :field_type
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :lead_template_values
  end
end
