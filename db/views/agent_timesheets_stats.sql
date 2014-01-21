SELECT user_session_logs.campaign_id,
   user_session_logs.user_id,
   round((date_part('epoch'::text, max(user_session_logs.end_time) - min(user_session_logs.start_time)) / 3600::double precision - sum(user_session_logs.hours_count))::numeric, 2) AS log_out_time,
   min(user_session_logs.start_time) AS log_in,
   max(user_session_logs.end_time) AS log_out,
       CASE
           WHEN date_part('dow'::text, user_session_logs.end_time) = 0::double precision THEN 6::double precision
           ELSE date_part('dow'::text, user_session_logs.end_time) - 1::double precision
       END::integer AS dow,
   user_session_logs.end_date AS created_at,
   date_part('week'::text, user_session_logs.end_time)::integer AS week,
   date_part('year'::text, user_session_logs.end_date)::integer AS year
FROM user_session_logs
WHERE user_session_logs.campaign_id IS NOT NULL
GROUP BY user_session_logs.user_id, user_session_logs.end_date, date_part('dow'::text, user_session_logs.end_time), date_part('week'::text, user_session_logs.end_time), user_session_logs.campaign_id
HAVING sum(user_session_logs.hours_count) > 0::double precision;
