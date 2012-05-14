class ChangeArchivedPaypalResponses < ActiveRecord::Migration
  def self.up
    rename_table :archived_paypal_responses, :archived_payment_responses
    add_column :archived_payment_responses, :type, :string

    execute "UPDATE archived_payment_responses SET type = 'ArchivedPaypalResponse' WHERE type is NULL"
  end

  def self.down
    rename_table :archived_payment_responses, :archived_paypal_responses
  end
end
