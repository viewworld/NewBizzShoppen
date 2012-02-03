class CreateDynamicResultValues < ActiveRecord::Migration
  def self.up
    execute %{ DROP VIEW IF EXISTS dynamic_result_values }
    execute %{
              CREATE VIEW dynamic_result_values AS
              SELECT distinct(result_values.id) AS id,
              result_values.value AS VALUE,
              campaigns_result_fields.dynamic_euro_value AS euro_value,
              call_results.creator_id,
              results.id AS result_id,
              call_results.created_at,
              contacts.campaign_id
              FROM result_values
              INNER JOIN result_fields ON result_fields.id=result_values.result_field_id
              INNER JOIN results ON results.id=result_fields.result_id
              INNER JOIN call_results ON result_values.call_result_id=call_results.id
              INNER JOIN leads as contacts ON call_results.contact_id=contacts.id
              INNER JOIN campaigns_results ON campaigns_results.campaign_id=contacts.campaign_id
              INNER JOIN campaigns_result_fields ON campaigns_result_fields.result_field_id=result_fields.id
              WHERE
              result_values.field_type like '1' AND campaigns_result_fields.is_dynamic_value = 't' AND campaigns_results.is_dynamic_value = 't'
              AND contacts.type = 'Contact' AND (results.upgrades_to_lead is false) AND (results.is_reported is true)
             }
  end

  def self.down
    execute %{ DROP VIEW dynamic_result_values }
  end
end
