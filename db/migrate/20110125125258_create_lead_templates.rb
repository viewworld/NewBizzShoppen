class CreateLeadTemplates < ActiveRecord::Migration
  def self.up
    create_table :lead_templates do |t|
      t.integer :category_id
      t.string :name
      t.boolean :is_active, :default => true
      t.boolean :is_mandatory, :default => false
      t.integer :creator_id
      t.string :creator_type

      t.timestamps
    end
  end

  def self.down
    drop_table :lead_templates
  end
end
