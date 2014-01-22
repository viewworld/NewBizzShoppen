SELECT agent_information.user_id,
   agent_information.campaign_id,
   sum(agent_information.sum) AS value,
   agent_information.created_at,
       CASE
           WHEN date_part('dow'::text, agent_information.created_at) = 0::double precision THEN 6::double precision
           ELSE date_part('dow'::text, agent_information.created_at) - 1::double precision
       END::integer AS dow,
   date_part('week'::text, agent_information.created_at)::integer AS week,
   date_part('year'::text, agent_information.created_at)::integer AS year
FROM (        (        (         SELECT call_results.creator_id AS user_id,
                                   sum(call_results.euro_value) AS sum,
                                   call_results.created_at::date AS created_at,
                                   campaigns_results.campaign_id
                                  FROM call_results
                             JOIN results ON results.id = call_results.result_id
                        JOIN leads contacts ON call_results.contact_id = contacts.id
                   JOIN campaigns_results ON results.id = campaigns_results.result_id
                  WHERE results.final = true AND contacts.type::text = 'Contact'::text AND results.upgrades_to_lead IS FALSE AND campaigns_results.is_reported IS TRUE AND campaigns_results.is_dynamic_value IS FALSE AND contacts.campaign_id = campaigns_results.campaign_id
                  GROUP BY call_results.created_at::date, call_results.creator_id, campaigns_results.campaign_id
                 HAVING sum(call_results.euro_value) > 0::double precision
                       UNION ALL
                                SELECT call_results.creator_id AS user_id,
                                   sum(leads.euro_price) AS sum,
                                   call_results.created_at::date AS created_at,
                                   leads.campaign_id
                                  FROM call_results
                             JOIN results ON results.id = call_results.result_id
                        JOIN leads contacts ON call_results.contact_id = contacts.id AND contacts.type::text = 'Contact'::text
                   JOIN leads leads ON leads.contact_id = contacts.id AND leads.type::text = 'Lead'::text
              JOIN campaigns_results ON results.id = campaigns_results.result_id
             WHERE results.final = true AND contacts.type::text = 'Contact'::text AND results.upgrades_to_lead IS TRUE AND campaigns_results.is_reported IS TRUE AND campaigns_results.campaign_id = leads.campaign_id
             GROUP BY leads.campaign_id, call_results.created_at::date, call_results.creator_id)
               UNION ALL
                        SELECT dynamic_result_values.creator_id AS user_id,
                           sum(dynamic_result_values.value * dynamic_result_values.euro_value) AS sum,
                           dynamic_result_values.created_at::date AS created_at,
                           dynamic_result_values.campaign_id
                          FROM dynamic_result_values
                         GROUP BY dynamic_result_values.campaign_id, dynamic_result_values.created_at, dynamic_result_values.creator_id)
       UNION ALL
                SELECT call_results.creator_id AS user_id,
                   sum(generated_leads.euro_price) AS sum,
                   call_results.created_at::date AS created_at,
                   campaigns_results.campaign_id
                  FROM call_results
             JOIN results ON results.id = call_results.result_id
        JOIN campaigns_results ON results.id = campaigns_results.result_id
   JOIN leads contacts ON call_results.contact_id = contacts.id
  JOIN users members ON members.contact_id = contacts.id AND (members.roles_mask & 128) > 0
  JOIN leads generated_leads ON members.id = generated_leads.requested_by AND generated_leads.requested_during_upgrade_to_member IS TRUE
WHERE results.final = true AND contacts.type::text = 'Contact'::text AND results.name::text = 'Upgrade to member'::text AND results.generic IS TRUE AND campaigns_results.is_reported IS TRUE AND campaigns_results.campaign_id = contacts.campaign_id
GROUP BY campaigns_results.campaign_id, call_results.created_at::date, call_results.creator_id) agent_information
GROUP BY agent_information.user_id, agent_information.created_at, agent_information.campaign_id
HAVING sum(agent_information.sum) > 0::double precision;