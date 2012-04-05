class CreateCampaignMonitorResponses < ActiveRecord::Migration
  def self.up
    create_table :campaign_monitor_responses do |t|
      t.integer :code
      t.text :response
      t.integer :resource_id
      t.string :resource_type
      t.timestamps
    end
  end

  def self.down
    drop_table :campaign_monitor_responses
  end
end
