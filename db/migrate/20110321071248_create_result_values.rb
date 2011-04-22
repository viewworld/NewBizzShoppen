class CreateResultValues < ActiveRecord::Migration
  def self.up
    create_table :result_values do |t|
      t.integer :result_field_id
      t.integer :call_result_id
      t.string :field_type
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :result_values
  end  
end
