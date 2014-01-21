SELECT call_logs.caller_type AS user_type,
       call_logs.caller_id AS user_id,
       call_logs.campaign_id,
       (call_logs.created_at)::date AS created_at,
       sum((date_part('epoch'::text, (finish.created_at - call_logs.created_at)))::integer) AS time_on_phone,
       (CASE
            WHEN (date_part('dow'::text, (call_logs.created_at)::date) = (0)::double PRECISION) THEN (6)::double PRECISION
            ELSE (date_part('dow'::text, (call_logs.created_at)::date) - (1)::double PRECISION)
        END)::integer AS dow,
       (date_part('week'::text, (call_logs.created_at)::date))::integer AS week,
       (date_part('year'::text, (call_logs.created_at)::date))::integer AS YEAR
FROM (call_logs
      JOIN call_logs finish ON ((((finish.call_id)::text = (call_logs.call_id)::text)
                                 AND ((finish.state)::text = 'FINISH'::text))))
WHERE ((call_logs.state)::text = 'RINGING'::text)
GROUP BY (call_logs.created_at)::date,
         call_logs.caller_type,
         call_logs.caller_id,
         call_logs.campaign_id;
