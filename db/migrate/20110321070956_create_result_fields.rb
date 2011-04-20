class CreateResultFields < ActiveRecord::Migration
  def self.up
    create_table :result_fields do |t|
      t.integer :result_id
      t.string :name
      t.string :field_type
      t.boolean :is_mandatory, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :result_fields
  end  
end
