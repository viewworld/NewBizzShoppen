class CreateCallResults < ActiveRecord::Migration
  def self.up
    create_table :results do |t|
      t.string :name
      t.boolean :final, :default => false
      t.boolean :generic, :default => false
      t.boolean :upgrades_to_lead, :default => false
      t.integer :creator_id
      t.string :creator_type
      t.timestamps
    end

    create_table :call_results do |t|
      t.integer :contact_id
      t.integer :result_id
      t.integer :agent_id
      t.string  :note
      t.timestamps
    end

  end

  def self.down
    drop_table :call_results
    drop_table :results
  end

end