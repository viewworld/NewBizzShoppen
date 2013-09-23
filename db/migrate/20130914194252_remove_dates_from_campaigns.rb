class RemoveDatesFromCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :state, :string
    execute "UPDATE campaigns SET state = 'inactive'"
    execute "UPDATE campaigns SET state = 'active' WHERE '#{Date.today}' BETWEEN start_date AND end_date"
    remove_columns :campaigns, :start_date, :end_date
  end

  def self.down
  end
end
