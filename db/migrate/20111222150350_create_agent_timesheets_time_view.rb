class CreateAgentTimesheetsTimeView < ActiveRecord::Migration
  def self.up
    execute %{
      CREATE VIEW agent_timesheets_time AS
        SELECT
          users.id as user_id,
          SUM(user_session_logs.hours_count) as hours,
          user_session_logs.end_time::DATE as date,
          CASE
            WHEN EXTRACT(DOW FROM user_session_logs.end_time) = 0 THEN 6
            ELSE EXTRACT(DOW FROM user_session_logs.end_time) - 1
          END::INTEGER as dow,
          EXTRACT(WEEK FROM user_session_logs.end_time)::INTEGER as week,
          user_session_logs.campaign_id
        FROM
          users
        RIGHT JOIN
          user_session_logs ON user_session_logs.user_id = users.id
        WHERE
          user_session_logs.campaign_id IS NOT NULL
        GROUP BY
          users.id, user_session_logs.end_time::DATE,
          EXTRACT(DOW FROM user_session_logs.end_time),
          EXTRACT(WEEK FROM user_session_logs.end_time),
          user_session_logs.campaign_id
        HAVING
          SUM(user_session_logs.hours_count) > 0
            }
  end

  def self.down
    execute %{
      DROP VIEW agent_timesheets_time
            }
  end
end
