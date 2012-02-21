class TimesheetChanges < ActiveRecord::Migration
  def self.up
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
                  ELSE NULL::double precision
              END::numeric, 2) AS cost
         FROM user_session_logs
         JOIN campaigns ON campaigns.id = user_session_logs.campaign_id
         LEFT JOIN campaign_average_hourly_rate ON campaign_average_hourly_rate.campaign_id = campaigns.id
        WHERE user_session_logs.campaign_id IS NOT NULL
        GROUP BY user_session_logs.user_id, user_session_logs.end_date, user_session_logs.campaign_id, campaigns.cost_type
       HAVING sum(user_session_logs.hours_count) > 0::double precision;
    }
    execute %{
      CREATE OR REPLACE VIEW agent_timesheets_hours AS
       SELECT user_session_logs.campaign_id, user_session_logs.user_id, sum(user_session_logs.hours_count) AS hours, user_session_logs.end_date AS created_at,
              CASE
                  WHEN date_part('dow'::text, user_session_logs.end_date) = 0::double precision THEN 6::double precision
                  ELSE date_part('dow'::text, user_session_logs.end_date) - 1::double precision
              END::integer AS dow, date_part('week'::text, user_session_logs.end_date)::integer AS week, date_part('year'::text, user_session_logs.end_date)::integer AS year
         FROM user_session_logs
        WHERE user_session_logs.log_type = 1 AND user_session_logs.campaign_id IS NOT NULL
        GROUP BY user_session_logs.campaign_id, user_session_logs.user_id, user_session_logs.end_date;
    }
    execute %{
      CREATE OR REPLACE VIEW agent_timesheets_results AS
       SELECT contacts.campaign_id, call_results.creator_id AS user_id, count(*) AS results, call_results.created_at::date AS created_at,
              CASE
                  WHEN date_part('dow'::text, call_results.created_at::date) = 0::double precision THEN 6::double precision
                  ELSE date_part('dow'::text, call_results.created_at::date) - 1::double precision
              END::integer AS dow, date_part('week'::text, call_results.created_at::date)::integer AS week, date_part('year'::text, call_results.created_at::date)::integer AS year
         FROM call_results
         JOIN leads contacts ON contacts.id = call_results.contact_id
        GROUP BY contacts.campaign_id, call_results.created_at::date, call_results.creator_id;    }
    execute %{
      CREATE OR REPLACE VIEW agent_timesheets_stats AS
       SELECT user_session_logs.campaign_id, user_session_logs.user_id, round((date_part('epoch'::text, max(user_session_logs.end_time) - min(user_session_logs.start_time)) / 3600::double precision - sum(user_session_logs.hours_count))::numeric, 2) AS log_out_time, min(user_session_logs.start_time) AS log_in, max(user_session_logs.end_time) AS log_out,
              CASE
                  WHEN date_part('dow'::text, user_session_logs.end_time) = 0::double precision THEN 6::double precision
                  ELSE date_part('dow'::text, user_session_logs.end_time) - 1::double precision
              END::integer AS dow, user_session_logs.end_date AS created_at, date_part('week'::text, user_session_logs.end_time)::integer AS week, date_part('year'::text, user_session_logs.end_date)::integer AS year
         FROM user_session_logs
        WHERE user_session_logs.campaign_id IS NOT NULL
        GROUP BY user_session_logs.user_id, user_session_logs.end_date, date_part('dow'::text, user_session_logs.end_time), date_part('week'::text, user_session_logs.end_time), user_session_logs.campaign_id
       HAVING sum(user_session_logs.hours_count) > 0::double precision;    }
    execute %{
      CREATE OR REPLACE VIEW agent_timesheets_value AS
       SELECT agent_information.user_id, agent_information.campaign_id, sum(agent_information.sum) AS value, agent_information.created_at,
              CASE
                  WHEN date_part('dow'::text, agent_information.created_at) = 0::double precision THEN 6::double precision
                  ELSE date_part('dow'::text, agent_information.created_at) - 1::double precision
              END::integer AS dow, date_part('week'::text, agent_information.created_at)::integer AS week, date_part('year'::text, agent_information.created_at)::integer AS year
         FROM (        (         SELECT call_results.creator_id AS user_id, sum(campaigns_results.euro_value) AS sum, call_results.created_at::date AS created_at, campaigns_results.campaign_id
                                    FROM call_results
                               JOIN results ON results.id = call_results.result_id
                          JOIN leads contacts ON call_results.contact_id = contacts.id
                     JOIN campaigns_results ON results.id = campaigns_results.result_id
                    WHERE results.final = true AND contacts.type::text = 'Contact'::text AND results.upgrades_to_lead IS FALSE AND results.is_reported IS TRUE AND campaigns_results.is_dynamic_value IS FALSE AND contacts.campaign_id = campaigns_results.campaign_id
                    GROUP BY call_results.created_at::date, call_results.creator_id, campaigns_results.campaign_id
                   HAVING sum(campaigns_results.euro_value) > 0::double precision
                      UNION ALL
                               SELECT call_results.creator_id AS user_id, sum(leads.euro_price) AS sum, call_results.created_at::date AS created_at, leads.campaign_id
                                 FROM call_results
                            JOIN results ON results.id = call_results.result_id
                       JOIN leads contacts ON call_results.contact_id = contacts.id AND contacts.type::text = 'Contact'::text
                  JOIN leads leads ON leads.id = contacts.lead_id AND leads.type::text = 'Lead'::text
                 WHERE results.final = true AND contacts.type::text = 'Contact'::text AND results.upgrades_to_lead IS TRUE AND results.is_reported IS TRUE
                 GROUP BY leads.campaign_id, call_results.created_at::date, call_results.creator_id)
              UNION ALL
                       SELECT dynamic_result_values.creator_id AS user_id, sum(dynamic_result_values.value * dynamic_result_values.euro_value) AS sum, dynamic_result_values.created_at::date AS created_at, dynamic_result_values.campaign_id
                         FROM dynamic_result_values
                        GROUP BY dynamic_result_values.campaign_id, dynamic_result_values.created_at, dynamic_result_values.creator_id) agent_information
        GROUP BY agent_information.user_id, agent_information.created_at, agent_information.campaign_id
       HAVING sum(agent_information.sum) > 0::double precision;
  }
    execute %{
      DROP VIEW agent_timesheets
            }
  end

  def self.down
  end
end
