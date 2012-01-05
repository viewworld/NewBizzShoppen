class RemoveBigBuyerFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :team_buyers
  end

  def self.down
  end
end
