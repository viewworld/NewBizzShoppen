SELECT campaigns.id AS campaign_id,
round(((((CASE WHEN (
            (SELECT count(*) AS COUNT
              FROM leads
              WHERE (((leads.campaign_id = campaigns.id)
                  AND ((leads.type)::text = 'Contact'::text))
                AND (leads.completed IS TRUE))) > 0) THEN ((
              (SELECT COUNT(*) AS COUNT
                FROM leads
                WHERE (((leads.campaign_id = campaigns.id)
                    AND ((leads.type)::text = 'Contact'::text))
                  AND (leads.completed IS TRUE))))::numeric / (
              (SELECT COUNT(*) AS COUNT
                FROM leads
                WHERE ((leads.campaign_id = campaigns.id)
                  AND ((leads.type)::text = 'Contact'::text))))::numeric) ELSE (0)::numeric END)::double PRECISION * campaigns.euro_fixed_cost_value) / CASE WHEN (sum(user_session_logs.hours_count) > (0)::double PRECISION) THEN sum(user_session_logs.hours_count) ELSE (1)::double PRECISION END))::numeric, 2) AS cost
FROM (campaigns
  JOIN user_session_logs ON ((user_session_logs.campaign_id = campaigns.id)))
WHERE (campaigns.cost_type = 0)
GROUP BY campaigns.id,
campaigns.euro_fixed_cost_value;
