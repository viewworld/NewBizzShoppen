class AddContactPoolTypeToCampaign < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :contact_pool_type, :integer, :default => 1
    execute "UPDATE campaigns SET contact_pool_type = 0"
  end
end
