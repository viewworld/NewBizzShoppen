class CreateCallResultsChainMails < ActiveRecord::Migration
  def self.up
    create_table :call_results_chain_mails, :id => false do |t|
      t.integer :call_result_id
      t.integer :chain_mail_id
      t.boolean :active, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :call_results_chain_mails
  end
end
