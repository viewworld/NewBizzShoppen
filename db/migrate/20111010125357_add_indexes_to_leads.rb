class AddIndexesToLeads < ActiveRecord::Migration
  def self.up
    add_index :leads, [:position, :pending, :type, :campaign_id, :agent_id], :name => 'leads_for_agent_work_screen'
  end

  def self.down
  end
end
