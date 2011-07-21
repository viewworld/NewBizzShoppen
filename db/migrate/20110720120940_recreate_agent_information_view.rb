class RecreateAgentInformationView < ActiveRecord::Migration
  def self.up
    execute "DROP VIEW agent_information"
    execute "DROP VIEW agent_information_not_upgraded_results"
    execute "DROP VIEW agent_information_upgraded_results"
    execute %{
        CREATE OR REPLACE VIEW agent_information AS
          SELECT agent_information.user_id, sum(agent_information.sum) AS sum, agent_information.created_at
          FROM (
            SELECT call_results.creator_id AS user_id, sum(campaigns_results.euro_value) AS sum, call_results.created_at::date AS created_at
              FROM call_results
              JOIN results ON results.id = call_results.result_id
              JOIN campaigns_results ON results.id = campaigns_results.result_id
              JOIN leads contacts ON call_results.contact_id = contacts.id
              WHERE results.final = true AND contacts.type::text = 'Contact'::text AND results.upgrades_to_lead IS FALSE AND results.is_reported IS TRUE
              GROUP BY call_results.created_at::date, call_results.creator_id
            UNION ALL
            SELECT call_results.creator_id AS user_id, sum(leads.euro_price) AS sum, call_results.created_at::date AS created_at
              FROM call_results
              JOIN results ON results.id = call_results.result_id
              JOIN leads contacts ON call_results.contact_id = contacts.id AND contacts.type::text = 'Contact'::text
              JOIN leads leads ON leads.id = contacts.lead_id AND leads.type::text = 'Lead'::text
              WHERE results.final = true AND contacts.type::text = 'Contact'::text AND results.upgrades_to_lead IS TRUE AND results.is_reported IS TRUE
              GROUP BY call_results.created_at::date, call_results.creator_id
          ) agent_information
          GROUP BY agent_information.user_id, agent_information.created_at;
  }
  end

  def self.down
  end
end
