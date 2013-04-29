class CreateAgentTimesheetTimeOnPhoneView < ActiveRecord::Migration
  def self.up
    execute %{
      CREATE VIEW agent_timesheets_time_on_phone AS
        SELECT call_logs.caller_type as user_type, call_logs.caller_id as user_id, call_logs.campaign_id, call_logs.created_at::DATE,
          SUM(EXTRACT(EPOCH FROM finish.created_at-call_logs.created_at)::INTEGER) as time_on_phone,
                CASE
                            WHEN date_part('dow'::text, call_logs.created_at::date) = 0::double precision THEN 6::double precision
                            ELSE date_part('dow'::text, call_logs.created_at::date) - 1::double precision
                        END::integer AS dow, date_part('week'::text, call_logs.created_at::date)::integer AS week, date_part('year'::text, call_logs.created_at::date)::integer AS year
        FROM call_logs
        INNER JOIN call_logs finish ON finish.call_id = call_logs.call_id AND finish.state = 'FINISH'
        WHERE call_logs.state = 'RINGING'
        GROUP BY call_logs.created_at::DATE, call_logs.caller_type, call_logs.caller_id, call_logs.campaign_id;
            }
  end

  def self.down
    execute %{ DROP VIEW agent_timesheets_time_on_phone }
  end
end
