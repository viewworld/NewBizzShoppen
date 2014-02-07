class AddAutoDialerToCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :auto_dialer, :boolean, :default => false
  end

  def self.down
    remove_column :campaigns, :auto_dialer
  end
end
