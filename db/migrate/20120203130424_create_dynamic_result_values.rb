class CreateDynamicResultValues < ActiveRecord::Migration
  def self.up
    execute %{
              CREATE VIEW dynamic_result_values as
select distinct(result_values.id), result_values.value, campaigns_result_fields.dynamic_euro_value AS euro_value, result_fields.name, call_results.creator_id, results.id, call_results.created_at
from result_values
inner join result_fields on result_fields.id=result_values.result_field_id
inner join results on results.id=result_fields.result_id
inner join call_results on result_values.call_result_id=call_results.id
INNER JOIN leads as contacts ON call_results.contact_id=contacts.id
inner join campaigns_results on campaigns_results.campaign_id=contacts.campaign_id
INNER JOIN campaigns_result_fields ON campaigns_result_fields.result_field_id=result_fields.id
WHERE
result_values.field_type like '1' and campaigns_results.is_dynamic_value
and campaigns_result_fields.is_dynamic_value = 't' and campaigns_results.is_dynamic_value = 't'
and (campaigns_results.campaign_id = 3 and contacts.type = 'Contact' and contacts.campaign_id = 3)
AND (results.upgrades_to_lead is false and call_results.created_at::DATE BETWEEN '2012-01-30' AND '2012-02-05') AND (results.is_reported is true)
             }
  end

  def self.down
    execute %{ DROP VIEW dynamic_result_values }
  end
end
