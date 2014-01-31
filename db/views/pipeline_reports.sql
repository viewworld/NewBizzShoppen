 SELECT lp.owner_id, lp.euro_value, lp.estimate, lp.euro_pipeline_value, lp.state,
        lp.decision_date,
        date_part('week'::text, decision_date)::integer AS week,
        date_part('month'::text, decision_date)::integer AS month,
        date_part('year'::text, decision_date)::integer AS year,
        l.header, l.company_name, l.contact_name
FROM lead_purchases as lp
INNER JOIN leads as l on l.id = lp.lead_id
WHERE lp.accessible_from IS NOT NULL AND lp.decision_date IS NOT NULL
