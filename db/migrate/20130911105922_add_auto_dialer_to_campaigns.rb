class AddAutoDialerToCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :auto_dialer, :boolean, :default => false
    execute "UPDATE campaigns SET auto_dialer = FALSE"
  end

  def self.down
    remove_column :campaigns, :auto_dialer
  end
end
