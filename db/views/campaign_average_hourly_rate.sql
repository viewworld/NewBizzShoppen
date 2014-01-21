SELECT campaigns.id AS campaign_id,
   round((
       CASE
           WHEN (( SELECT count(*) AS count
              FROM leads
             WHERE leads.campaign_id = campaigns.id AND leads.type::text = 'Contact'::text AND leads.completed IS TRUE)) > 0 THEN (( SELECT count(*) AS count
              FROM leads
             WHERE leads.campaign_id = campaigns.id AND leads.type::text = 'Contact'::text AND leads.completed IS TRUE))::numeric / (( SELECT count(*) AS count
              FROM leads
             WHERE leads.campaign_id = campaigns.id AND leads.type::text = 'Contact'::text))::numeric
           ELSE 0::numeric
       END::double precision * campaigns.euro_fixed_cost_value /
       CASE
           WHEN sum(user_session_logs.hours_count) > 0::double precision THEN sum(user_session_logs.hours_count)
           ELSE 1::double precision
       END)::numeric, 2) AS cost
FROM campaigns
  JOIN user_session_logs ON user_session_logs.campaign_id = campaigns.id
WHERE campaigns.cost_type = 0
GROUP BY campaigns.id, campaigns.euro_fixed_cost_value;
