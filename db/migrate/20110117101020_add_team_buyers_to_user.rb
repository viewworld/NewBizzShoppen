class AddTeamBuyersToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :team_buyers, :boolean, :default => false
    execute "UPDATE users SET team_buyers = FALSE"
  end

  def self.down
    remove_column :users, :team_buyers
  end
end
