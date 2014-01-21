SELECT call_logs.caller_type AS user_type,
   call_logs.caller_id AS user_id,
   call_logs.campaign_id,
   call_logs.created_at::date AS created_at,
   count(call_logs.call_id) AS calls,
       CASE
           WHEN date_part('dow'::text, call_logs.created_at::date) = 0::double precision THEN 6::double precision
           ELSE date_part('dow'::text, call_logs.created_at::date) - 1::double precision
       END::integer AS dow,
   date_part('week'::text, call_logs.created_at::date)::integer AS week,
   date_part('year'::text, call_logs.created_at::date)::integer AS year
FROM call_logs
WHERE call_logs.state::text = 'RINGING'::text
GROUP BY call_logs.created_at::date, call_logs.caller_type, call_logs.caller_id, call_logs.campaign_id;
