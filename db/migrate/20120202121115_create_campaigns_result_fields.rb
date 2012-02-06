class CreateCampaignsResultFields < ActiveRecord::Migration
  def self.up
    create_table :campaigns_result_fields do |t|
      t.integer :campaign_id
      t.integer :result_field_id
      t.boolean :is_dynamic_value, :default => false
      t.float :dynamic_euro_value
      t.timestamps
    end
  end

  def self.down
    drop_table :campaigns_result_fields
  end
end
