class AddFieldsToPayoutsView < ActiveRecord::Migration
  def self.up
    execute %{
            DROP VIEW agent_timesheets_cost
    }
    execute %{
            DROP VIEW agent_timesheets_payouts
    }
    execute %{
            CREATE OR REPLACE VIEW agent_timesheets_payouts AS
               SELECT
                call_results.creator_id AS user_id,
                sum(call_results.euro_payout) AS payout,
                call_results.created_at::date AS created_at,
                contacts.campaign_id,
                CASE
                            WHEN date_part('dow'::text, call_results.created_at::date) = 0::double precision THEN 6::double precision
                            ELSE date_part('dow'::text, call_results.created_at::date) - 1::double precision
                        END::integer AS dow, date_part('week'::text, call_results.created_at::date)::integer AS week, date_part('year'::text, call_results.created_at::date)::integer AS year
                 FROM call_results
                 LEFT JOIN leads contacts ON contacts.id = call_results.contact_id
                GROUP BY call_results.creator_id, call_results.created_at::date, contacts.campaign_id
               HAVING sum(call_results.euro_payout) > 0::numeric;
    }
    execute %{
      CREATE OR REPLACE VIEW agent_timesheets_cost AS
        SELECT user_session_logs.user_id, user_session_logs.campaign_id, user_session_logs.end_date AS created_at,
                CASE
                    WHEN date_part('dow'::text, user_session_logs.end_date) = 0::double precision THEN 6::double precision
                    ELSE date_part('dow'::text, user_session_logs.end_date) - 1::double precision
                END::integer AS dow, date_part('week'::text, user_session_logs.end_date)::integer AS week, date_part('year'::text, user_session_logs.end_date)::integer AS year, round(
                CASE
                    WHEN campaigns.cost_type = 0 THEN sum(user_session_logs.hours_count * campaign_average_hourly_rate.cost::double precision)
                    WHEN campaigns.cost_type = 1 THEN sum(user_session_logs.hours_count * user_session_logs.euro_billing_rate)
                    WHEN campaigns.cost_type = 2 THEN sum(user_session_logs.hours_count * campaigns.euro_fixed_cost_value)
                    WHEN campaigns.cost_type = 3 THEN 0::double precision
                    WHEN campaigns.cost_type = 4 THEN (( SELECT sum(agent_timesheets_payouts.payout) AS sum
                       FROM agent_timesheets_payouts
                      WHERE agent_timesheets_payouts.user_id = user_session_logs.user_id AND agent_timesheets_payouts.created_at = user_session_logs.end_date AND agent_timesheets_payouts.campaign_id = user_session_logs.campaign_id))::double precision
                    ELSE NULL::double precision
                END::numeric, 2) AS cost
           FROM user_session_logs
           JOIN campaigns ON campaigns.id = user_session_logs.campaign_id
           LEFT JOIN campaign_average_hourly_rate ON campaign_average_hourly_rate.campaign_id = campaigns.id
          WHERE user_session_logs.campaign_id IS NOT NULL
          GROUP BY user_session_logs.user_id, user_session_logs.end_date, user_session_logs.campaign_id, campaigns.cost_type
         HAVING sum(user_session_logs.hours_count) > 0::double precision
      }
  end

  def self.down
  end
end
