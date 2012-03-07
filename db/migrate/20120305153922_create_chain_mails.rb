class CreateChainMails < ActiveRecord::Migration
  def self.up
    create_table :chain_mails do |t|
      t.string :name
      t.integer :first_execution_delay
      t.integer :cycle_time
      t.time :execution_time
      t.text :execution_conditions
      t.timestamps
    end
  end

  def self.down
    drop_table :chain_mails
  end
end
