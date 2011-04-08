class CreateCampaignsResults < ActiveRecord::Migration
  def self.up
    create_table :campaigns_results, :id => false do |t|
      t.integer :campaign_id
      t.integer :result_id
    end
  end

  def self.down
    drop_table :campaigns_results
  end
end
