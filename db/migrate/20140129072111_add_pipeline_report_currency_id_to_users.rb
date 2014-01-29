class AddPipelineReportCurrencyIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :pipeline_report_currency_id, :integer
  end

  def self.down
    remove_column :users, :pipeline_report_currency_id
  end
end
