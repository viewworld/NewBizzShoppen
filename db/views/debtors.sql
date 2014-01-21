SELECT lead_purchases.owner_id,
       users.email AS owner_email,
       leads.currency_id,
       lead_purchases.assigned_at,
       leads.header,
       leads.contact_name,
       leads.company_name,
       leads.price,
       lead_purchases.quantity,
       lead_purchases.euro_price
FROM (((lead_purchases
        JOIN leads ON ((leads.id = lead_purchases.lead_id)))
       JOIN users ON ((users.id = lead_purchases.owner_id)))
      LEFT JOIN invoice_lines ON ((lead_purchases.id = invoice_lines.payable_id)))
WHERE (((((((lead_purchases.type)::text = 'LeadPurchase'::text)
           OR ((lead_purchases.type)::text = 'LeadPrimaryPurchase'::text))
          OR ((lead_purchases.type)::text = 'LeadSinglePurchase'::text))
         OR ((lead_purchases.type)::text = 'LeadBuyout'::text))
        OR ((lead_purchases.type)::text = 'LeadAdditionalBuyout'::text))
       AND (invoice_lines.payable_id IS NULL))

UNION

SELECT subscriptions.user_id AS owner_id,
       users.email AS owner_email,
       subscriptions.currency_id,
       NULL::TIMESTAMP WITHOUT time ZONE AS assigned_at,
                                            NULL::character varying AS header,
                                            NULL::character varying AS contact_name,
                                            NULL::character varying AS company_name,
                                            subscription_sub_periods.billing_price AS price,
                                            1 AS quantity,
                                            subscription_sub_periods.euro_billing_price AS euro_price
FROM ((subscription_sub_periods
       JOIN subscriptions ON ((subscriptions.id = subscription_sub_periods.subscription_id)))
      JOIN users ON ((users.id = subscriptions.user_id)))
WHERE (((((subscriptions.billing_cycle > 0)
          AND (subscription_sub_periods.billing_date IS NOT NULL))
         AND (subscription_sub_periods.billing_date <= ('now'::text)::date))
        AND (subscription_sub_periods.invoice_id IS NULL))
       AND (subscriptions.use_paypal IS NOT TRUE));
