class DynamicResultValue < ActiveRecord::Base
  set_table_name "dynamic_result_values"

  scope :for_campaign, lambda { |campaign| where("campaign_id = ?", campaign.id) }
  scope :between_dates, lambda { |date_from, date_to| where("created_at::DATE BETWEEN ? AND ?", date_from, date_to) }
end
