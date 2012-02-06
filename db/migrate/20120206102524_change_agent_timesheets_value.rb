class ChangeAgentTimesheetsValue < ActiveRecord::Migration
  def self.up
    execute %{
        CREATE OR REPLACE VIEW agent_timesheets_value AS
        SELECT
          agent_information.user_id,
          agent_information.campaign_id,
          sum(agent_information.sum) AS value,
          agent_information.created_at
        FROM (
          SELECT
            call_results.creator_id AS user_id,
            SUM(campaigns_results.euro_value) AS sum,
            call_results.created_at::date AS created_at,
            campaigns_results.campaign_id as campaign_id
                FROM
            call_results
                JOIN
            results ON results.id = call_results.result_id
                JOIN
            campaigns_results ON results.id = campaigns_results.result_id
          JOIN
            leads contacts ON call_results.contact_id = contacts.id
          WHERE
            results.final = true AND contacts.type::text = 'Contact'::text AND
            results.upgrades_to_lead IS FALSE AND results.is_reported IS TRUE AND
            campaigns_results.is_dynamic_value IS FALSE
          GROUP BY
            call_results.created_at::date,
            call_results.creator_id,
            campaigns_results.campaign_id

          UNION ALL

          SELECT
            call_results.creator_id AS user_id,
            sum(leads.euro_price) AS sum,
            call_results.created_at::date AS created_at,
            leads.campaign_id as campaign_id
          FROM
            call_results
          JOIN
            results ON results.id = call_results.result_id
          JOIN
            leads contacts ON call_results.contact_id = contacts.id AND contacts.type::text = 'Contact'::text
          JOIN
            leads leads ON leads.id = contacts.lead_id AND leads.type::text = 'Lead'::text
          WHERE
            results.final = true AND contacts.type::text = 'Contact'::text AND results.upgrades_to_lead IS TRUE AND results.is_reported IS TRUE
          GROUP BY
            leads.campaign_id,
            call_results.created_at::date,
            call_results.creator_id

          UNION ALL

          SELECT
            creator_id AS user_id,
            SUM(value * euro_value) AS sum,
            created_at::date AS created_at,
            campaign_id
          FROM
            dynamic_result_values
          GROUP BY
            campaign_id,
            created_at,
            creator_id
        ) agent_information
        GROUP BY
          agent_information.user_id,
          agent_information.created_at,
          agent_information.campaign_id
        HAVING
          SUM(agent_information.sum) > 0
            }
  end

  def self.down
  end
end
