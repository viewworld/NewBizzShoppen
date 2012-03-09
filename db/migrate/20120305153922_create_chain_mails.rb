class CreateChainMails < ActiveRecord::Migration
  def self.up
    create_table :chain_mail_types do |t|
      t.string :name
      t.integer :first_execution_delay
      t.integer :cycle_time
      t.time :execution_time
      t.text :execution_conditions
      t.timestamps
    end
    create_table :chain_mails do |t|
      t.string :chain_mailable_type
      t.integer :chain_mailable_id
      t.integer :chain_mail_type_id
      t.datetime :last_mail_sent_at
      t.integer :last_mail_position
      t.text :execution_conditions
      t.timestamps
    end
  end

  def self.down
    drop_table :chain_mail_types
    drop_table :chain_mails
  end
end
