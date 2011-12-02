class CreateArchivedPaypalResponses < ActiveRecord::Migration
  def self.up
    create_table :archived_paypal_responses do |t|
      t.integer :user_id
      t.integer :subscription_id
      t.integer :subscription_type
      t.string :response_type
      t.boolean :has_errors, :default => false
      t.text :response_details
      t.timestamps
    end
  end

  def self.down
    drop_table :archived_paypal_responses
  end
end
