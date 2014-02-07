class AddNoPricesForTeamMembersToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :no_prices_for_team_members, :boolean, :default => false
  end

  def self.down
    remove_column :categories, :no_prices_for_team_members
  end
end
