class CreateCampaignAverageHourlyRate < ActiveRecord::Migration
  def self.up
    execute %{
      CREATE VIEW campaign_average_hourly_rate AS
      SELECT
        campaigns.id AS campaign_id,
        round(((CASE
          WHEN (SELECT count(*) FROM leads WHERE leads.campaign_id = campaigns.id AND type = 'Contact' AND leads.completed IS TRUE) > 0 THEN ((SELECT count(*) FROM leads WHERE leads.campaign_id = campaigns.id AND type = 'Contact' AND leads.completed IS TRUE)::numeric / (SELECT count(*) FROM leads WHERE leads.campaign_id = campaigns.id AND type = 'Contact'))
          ELSE 0
        END * campaigns.euro_fixed_cost_value) / (CASE WHEN sum(user_session_logs.hours_count) > 0 THEN sum(user_session_logs.hours_count) ELSE 1 END))::numeric, 2) AS cost
      FROM
        campaigns
      JOIN
        user_session_logs ON user_session_logs.campaign_id = campaigns.id
      WHERE
        campaigns.cost_type = 0
      GROUP BY
        campaigns.id, campaigns.euro_fixed_cost_value
    }
    execute %{ DROP VIEW agent_timesheets }
    execute %{
      CREATE VIEW agent_timesheets AS
      SELECT users.id AS user_id, round((date_part('epoch'::text, max(user_session_logs.end_time) - min(user_session_logs.start_time)) / 3600::double precision - sum(user_session_logs.hours_count))::numeric, 2) AS log_out_time, user_session_logs.end_date AS date,
        CASE
            WHEN date_part('dow'::text, user_session_logs.end_time) = 0::double precision THEN 6::double precision
            ELSE date_part('dow'::text, user_session_logs.end_time) - 1::double precision
        END::integer AS dow, date_part('week'::text, user_session_logs.end_time)::integer AS week, date_part('year'::text, user_session_logs.end_date)::integer AS year, user_session_logs.campaign_id,
        sum(user_session_logs.hours_count) AS hours,
        round(CASE
    	    WHEN campaigns.cost_type = 0 THEN sum(user_session_logs.hours_count * campaign_average_hourly_rate.cost)
	        WHEN campaigns.cost_type = 1 THEN sum(user_session_logs.hours_count * user_session_logs.euro_billing_rate)
	        WHEN campaigns.cost_type = 2 THEN sum(user_session_logs.hours_count * campaigns.euro_fixed_cost_value)
	        WHEN campaigns.cost_type = 3 THEN 0
	      END::numeric, 2) as cost,
        ( SELECT count(*) AS count
          FROM call_results
	        LEFT JOIN campaigns_results ON campaigns_results.result_id = call_results.result_id
          WHERE call_results.creator_id = users.id AND call_results.created_at::date = user_session_logs.end_date AND campaigns_results.campaign_id = user_session_logs.campaign_id) AS results,
        ( SELECT sum(agent_timesheets_value.value) AS sum
          FROM agent_timesheets_value
          WHERE agent_timesheets_value.user_id = users.id AND agent_timesheets_value.created_at = user_session_logs.end_date AND agent_timesheets_value.campaign_id = user_session_logs.campaign_id) AS value, min(user_session_logs.start_time) AS log_in, max(user_session_logs.end_time) AS log_out
      FROM users
      LEFT JOIN user_session_logs ON user_session_logs.user_id = users.id
      RIGHT JOIN campaigns ON campaigns.id = user_session_logs.campaign_id
      LEFT JOIN campaign_average_hourly_rate ON campaign_average_hourly_rate.campaign_id = campaigns.id
      WHERE user_session_logs.campaign_id IS NOT NULL
      GROUP BY users.id, user_session_logs.end_date, date_part('dow'::text, user_session_logs.end_time), date_part('week'::text, user_session_logs.end_time), user_session_logs.campaign_id, campaigns.cost_type
      HAVING sum(user_session_logs.hours_count) > 0::double precision;
    }
  end

  def self.down
  end
end
