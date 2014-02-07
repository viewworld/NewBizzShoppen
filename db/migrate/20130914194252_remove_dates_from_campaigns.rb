class RemoveDatesFromCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :state, :string
    remove_columns :campaigns, :start_date, :end_date
  end

  def self.down
  end
end
