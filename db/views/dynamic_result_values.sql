SELECT DISTINCT result_values.id,
                CASE
                    WHEN (result_values.value = ''::text) THEN (0)::double PRECISION
                    WHEN (result_values.value IS NULL) THEN (0)::double PRECISION
                    ELSE (result_values.value)::double PRECISION
                END AS value,
                call_result_fields.dynamic_euro_value AS euro_value,
                call_results.creator_id,
                results.id AS result_id,
                call_results.created_at,
                contacts.campaign_id
FROM (((((((result_values
            JOIN result_fields ON ((result_fields.id = result_values.result_field_id)))
           JOIN results ON ((results.id = result_fields.result_id)))
          JOIN call_results ON ((result_values.call_result_id = call_results.id)))
         JOIN leads contacts ON ((call_results.contact_id = contacts.id)))
        JOIN campaigns_results ON ((campaigns_results.campaign_id = contacts.campaign_id)))
       JOIN campaigns_result_fields ON ((campaigns_result_fields.result_field_id = result_fields.id)))
      JOIN call_result_fields ON ((call_result_fields.campaigns_result_field_id = campaigns_result_fields.id)))
WHERE ((((((((result_values.field_type)::text ~~ '1'::text)
            AND (campaigns_result_fields.is_dynamic_value = TRUE))
           AND (campaigns_results.is_dynamic_value = TRUE))
          AND ((contacts.type)::text = 'Contact'::text))
         AND (results.upgrades_to_lead IS FALSE))
        AND (campaigns_results.is_reported IS TRUE))
       AND (results.final IS TRUE));
