class AddDeletedAtToCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :deleted_at, :datetime, :default => nil
  end

  def self.down
    remove_column :campaigns, :deleted_at
  end
end