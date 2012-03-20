class AddChainMailTypeToCampaignsResults < ActiveRecord::Migration
  def self.up
    add_column :campaigns_results, :chain_mail_type_id, :integer
  end

  def self.down
    remove_column :campaigns_results, :chain_mail_type_id
  end
end
