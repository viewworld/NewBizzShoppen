class AddIndexes3 < ActiveRecord::Migration
  def self.up
    execute "CREATE INDEX index_call_results_on_created_at_date ON call_results USING btree ((created_at::DATE));"
    execute "CREATE INDEX index_call_logs_on_created_at_date ON call_logs USING btree ((created_at::DATE));"
    add_index :call_result_fields, :campaigns_result_field_id
    add_index :campaigns_result_fields, :campaign_id
    add_index :campaigns_result_fields, :result_field_id
    add_index :leads, :requested_during_upgrade_to_member
  end

  def self.down
    execute "DROP INDEX index_call_results_on_created_at_date"
    execute "DROP INDEX index_call_logs_on_created_at_date"
    remove_index :call_result_fields, :campaigns_result_field_id
    remove_index :campaigns_result_fields, :campaign_id
    remove_index :campaigns_result_fields, :result_field_id
    remove_index :leads, :requested_during_upgrade_to_member
  end
end
