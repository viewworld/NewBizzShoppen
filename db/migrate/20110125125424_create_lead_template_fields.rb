class CreateLeadTemplateFields < ActiveRecord::Migration
  def self.up
    create_table :lead_template_fields do |t|
      t.integer :lead_template_id
      t.string :name
      t.string :field_type
      t.boolean :is_hidden, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :lead_template_fields
  end
end
