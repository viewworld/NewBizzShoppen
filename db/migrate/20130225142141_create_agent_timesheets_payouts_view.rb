class CreateAgentTimesheetsPayoutsView < ActiveRecord::Migration
  def self.up
    execute %{
            CREATE OR REPLACE VIEW agent_timesheets_payouts AS
               SELECT
                call_results.creator_id AS user_id,
                sum(call_results.euro_payout) AS euro_payout,
                call_results.created_at::date AS created_at,
                contacts.campaign_id
                 FROM call_results
                 LEFT JOIN leads contacts ON contacts.id = call_results.contact_id
                GROUP BY call_results.creator_id, call_results.created_at::date, contacts.campaign_id
               HAVING sum(call_results.euro_payout) > 0::numeric;
    }
  end

  def self.down
    execute %{
            DROP VIEW agent_timesheets_payouts
    }
  end
end
