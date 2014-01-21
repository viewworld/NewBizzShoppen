SELECT user_session_logs.campaign_id,
   user_session_logs.user_id,
   sum(user_session_logs.hours_count) AS hours,
   user_session_logs.end_date AS created_at,
       CASE
           WHEN date_part('dow'::text, user_session_logs.end_date) = 0::double precision THEN 6::double precision
           ELSE date_part('dow'::text, user_session_logs.end_date) - 1::double precision
       END::integer AS dow,
   date_part('week'::text, user_session_logs.end_date)::integer AS week,
   date_part('year'::text, user_session_logs.end_date)::integer AS year
FROM user_session_logs
WHERE user_session_logs.log_type = 1 AND user_session_logs.campaign_id IS NOT NULL
GROUP BY user_session_logs.campaign_id, user_session_logs.user_id, user_session_logs.end_date;
