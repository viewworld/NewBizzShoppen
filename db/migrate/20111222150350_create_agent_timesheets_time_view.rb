class CreateAgentTimesheetsTimeView < ActiveRecord::Migration
  def self.up
    ActiveRecord::Base.transaction do
      add_column :user_session_logs, :end_date, :date
      execute "UPDATE user_session_logs SET end_date = end_time::DATE"
      execute "CREATE LANGUAGE PLPGSQL"
      execute %{
        CREATE FUNCTION set_user_session_logs_end_date() RETURNS trigger
        AS $set_user_session_logs_end_date$
        BEGIN
        NEW.end_date := NEW.end_time::DATE;
        RETURN NEW;
        END;
        $set_user_session_logs_end_date$ LANGUAGE PLPGSQL
      }
      execute %{
        CREATE TRIGGER user_session_logs_end_date_trigger
        BEFORE INSERT OR UPDATE ON user_session_logs
        FOR EACH ROW EXECUTE PROCEDURE set_user_session_logs_end_date()
      }
      execute %{
        CREATE VIEW agent_timesheets_value AS
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
            results.upgrades_to_lead IS FALSE AND results.is_reported IS TRUE
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
            call_results.creator_id) agent_information
        GROUP BY
          agent_information.user_id,
          agent_information.created_at,
          agent_information.campaign_id
        HAVING
          SUM(agent_information.sum) > 0
      }
      execute "DROP VIEW agent_information"
      execute %{
        CREATE VIEW agent_information AS
        SELECT
          agent_timesheets_value.user_id,
          SUM(agent_timesheets_value.value),
          agent_timesheets_value.created_at
        FROM
          agent_timesheets_value
        GROUP BY
          agent_timesheets_value.user_id,
          agent_timesheets_value.created_at
      }
      execute %{
        CREATE VIEW agent_timesheets AS
        SELECT
          users.id as user_id,
          user_session_logs.end_date as date,
          CASE
            WHEN EXTRACT(DOW FROM user_session_logs.end_time) = 0 THEN 6
            ELSE EXTRACT(DOW FROM user_session_logs.end_time) - 1
          END::INTEGER as dow,
          EXTRACT(WEEK FROM user_session_logs.end_time)::INTEGER as week,
        	EXTRACT(YEAR FROM user_session_logs.end_date) as year,
          user_session_logs.campaign_id,
          SUM(user_session_logs.hours_count) as hours,
          (
          SELECT
            COUNT(*)
          FROM
            call_results
          LEFT JOIN
            campaigns_results ON campaigns_results.result_id = call_results.result_id
          WHERE
            call_results.creator_id = users.id AND
            call_results.created_at::DATE = user_session_logs.end_date AND
            campaigns_results.campaign_id = user_session_logs.campaign_id
          ) as results,
          (
          SELECT
            SUM(agent_timesheets_value.value)
          FROM
            agent_timesheets_value
          WHERE
            agent_timesheets_value.user_id = users.id AND
            agent_timesheets_value.created_at = user_session_logs.end_date AND
            agent_timesheets_value.campaign_id = user_session_logs.campaign_id
          ) as value
        FROM
          users
        LEFT JOIN
          user_session_logs ON user_session_logs.user_id = users.id
        WHERE
          user_session_logs.campaign_id IS NOT NULL
        GROUP BY
          users.id,
          user_session_logs.end_date,
          EXTRACT(DOW FROM user_session_logs.end_time),
          EXTRACT(WEEK FROM user_session_logs.end_time),
          user_session_logs.campaign_id
        HAVING
          SUM(user_session_logs.hours_count) > 0
      }
      execute %{
        CREATE VIEW agent_timesheets_overview AS
        SELECT
          agent_timesheets.date,
          agent_timesheets.year,
          agent_timesheets.dow,
          agent_timesheets.week,
          agent_timesheets.campaign_id,
          SUM(agent_timesheets.hours) as hours,
          SUM(agent_timesheets.results) as results,
          SUM(agent_timesheets.value) as value
        FROM
          agent_timesheets
        GROUP BY
          agent_timesheets.date,
          agent_timesheets.year,
          agent_timesheets.dow,
          agent_timesheets.week,
          agent_timesheets.campaign_id
      }
    end
  end

  def self.down
    ActiveRecord::Base.transaction do
      execute "DROP VIEW agent_timesheets"
      execute "DROP VIEW agent_information"
      execute "DROP VIEW agent_timesheets_value"
      execute "DROP VIEW agent_timesheets_overview"
      execute "DROP TRIGGER user_session_logs_end_date_trigger ON user_session_logs"
      execute "DROP FUNCTION set_user_session_logs_end_date()"
      execute "DROP LANGUAGE PLPGSQL"
      remove_column :user_session_logs, :end_date
    end
  end
end
