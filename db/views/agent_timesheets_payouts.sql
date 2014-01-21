SELECT call_results.creator_id AS user_id,
   sum(call_results.euro_payout) AS payout,
   call_results.created_at::date AS created_at,
   contacts.campaign_id,
       CASE
           WHEN date_part('dow'::text, call_results.created_at::date) = 0::double precision THEN 6::double precision
           ELSE date_part('dow'::text, call_results.created_at::date) - 1::double precision
       END::integer AS dow,
   date_part('week'::text, call_results.created_at::date)::integer AS week,
   date_part('year'::text, call_results.created_at::date)::integer AS year
FROM call_results
  LEFT JOIN leads contacts ON contacts.id = call_results.contact_id
  JOIN campaigns_results ON campaigns_results.campaign_id = contacts.campaign_id AND campaigns_results.result_id = call_results.result_id
WHERE campaigns_results.is_reported IS TRUE
GROUP BY call_results.creator_id, call_results.created_at::date, contacts.campaign_id
HAVING sum(call_results.euro_payout) > 0::numeric;
