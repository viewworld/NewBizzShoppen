class CreateAgentTimesheetCallsView < ActiveRecord::Migration
  def self.up
    execute %{
      CREATE VIEW agent_timesheets_calls AS
        SELECT caller_type as user_type, caller_id as user_id, campaign_id, created_at::DATE, count(call_id) as calls,
        CASE
                    WHEN date_part('dow'::text, call_logs.created_at::date) = 0::double precision THEN 6::double precision
                    ELSE date_part('dow'::text, call_logs.created_at::date) - 1::double precision
                END::integer AS dow, date_part('week'::text, call_logs.created_at::date)::integer AS week, date_part('year'::text, call_logs.created_at::date)::integer AS year
        FROM call_logs
        WHERE state = 'RINGING'
        GROUP BY created_at::DATE, caller_type, caller_id, campaign_id;
            }
  end

  def self.down
    execute %{ DROP VIEW agent_timesheets_calls }
  end
end
