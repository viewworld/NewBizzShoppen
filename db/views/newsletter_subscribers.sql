((((
      (SELECT newsletter_sources.id AS newsletter_source_id,
              newsletter_sources.newsletter_list_id,
              'Contact'::text AS subscriber_type,
              leads.id AS subscriber_id,
              leads.email_address,
              leads.contact_name AS name,
              leads.company_name,
              leads.zip_code,
              leads.company_ean_number,
              NULL::text AS company_vat_no,
              NULL::text AS contact_title,
              leads.address_line_1,
              leads.address_line_2,
              leads.address_line_3,
              leads.direct_phone_number,
              NULL::text AS phone,
              leads.region_id,
              leads.country_id,
              leads.pnumber,
              leads.nnmid,
              leads.custom_1,
              leads.custom_2,
              leads.custom_3,
              leads.custom_4,
              leads.custom_5
       FROM (newsletter_sources
             JOIN leads ON ((leads.campaign_id = newsletter_sources.sourceable_id)))
       WHERE ((((newsletter_sources.source_type = 0)
                AND ((leads.type)::text = 'Contact'::text))
               AND ((leads.email_address)::text <> ''::text))
              AND ((leads.contact_name)::text <> ''::text))

       UNION ALL SELECT newsletter_sources.id AS newsletter_source_id,
                        newsletter_sources.newsletter_list_id,
                        'Lead'::text AS subscriber_type,
                        leads.id AS subscriber_id,
                        leads.email_address,
                        leads.contact_name AS name,
                        leads.company_name,
                        leads.zip_code,
                        leads.company_ean_number,
                        NULL::text AS company_vat_no,
                        NULL::text AS contact_title,
                        leads.address_line_1,
                        leads.address_line_2,
                        leads.address_line_3,
                        leads.direct_phone_number,
                        NULL::text AS phone,
                        leads.region_id,
                        leads.country_id,
                        leads.pnumber,
                        leads.nnmid,
                        leads.custom_1,
                        leads.custom_2,
                        leads.custom_3,
                        leads.custom_4,
                        leads.custom_5
       FROM ((newsletter_sources
              JOIN categories parent_category ON ((parent_category.id = newsletter_sources.sourceable_id)))
             JOIN leads ON ((leads.category_id IN
                               (SELECT categories.id
                                FROM categories
                                WHERE ((categories.lft >= parent_category.lft)
                                       AND (categories.rgt <= parent_category.rgt))))))
       WHERE ((((newsletter_sources.source_type = 1)
                AND ((leads.type)::text = 'Lead'::text))
               AND ((leads.email_address)::text <> ''::text))
              AND ((leads.contact_name)::text <> ''::text)))

    UNION ALL

    SELECT newsletter_sources.id AS newsletter_source_id,
           newsletter_sources.newsletter_list_id,
           'User'::text AS subscriber_type,
           users.id AS subscriber_id,
           users.email AS email_address,
           (((users.first_name)::text || ' '::text) || (users.last_name)::text) AS name,
           users.company_name,
           addresses.zip_code,
           users.company_ean_number,
           users.vat_number AS company_vat_no,
           users.title AS contact_title,
           addresses.address_line_1,
           addresses.address_line_2,
           addresses.address_line_3,
           users.direct_phone_number,
           users.phone,
           addresses.region_id,
           addresses.country_id,
           users.pnumber,
           users.nnmid,
           users.custom_1,
           users.custom_2,
           users.custom_3,
           users.custom_4,
           users.custom_5
    FROM (((newsletter_sources
            JOIN subscriptions ON ((subscriptions.subscription_plan_id = newsletter_sources.sourceable_id)))
           JOIN users ON ((users.id = subscriptions.user_id)))
          LEFT JOIN addresses ON (((addresses.addressable_id = users.id)
                                   AND ((addresses.addressable_type)::text ~ 'User'::text))))
    WHERE (((newsletter_sources.source_type = 3)
            AND ((((users.first_name)::text || ' '::text) || (users.last_name)::text) <> ''::text))
           AND ((users.email)::text <> ''::text)))

   UNION ALL

   SELECT newsletter_sources.id AS newsletter_source_id,
          newsletter_sources.newsletter_list_id,
          'User'::text AS subscriber_type,
          users.id AS subscriber_id,
          users.email AS email_address,
          (((users.first_name)::text || ' '::text) || (users.last_name)::text) AS name,
          users.company_name,
          addresses.zip_code,
          users.company_ean_number,
          users.vat_number AS company_vat_no,
          users.title AS contact_title,
          addresses.address_line_1,
          addresses.address_line_2,
          addresses.address_line_3,
          users.direct_phone_number,
          users.phone,
          addresses.region_id,
          addresses.country_id,
          users.pnumber,
          users.nnmid,
          users.custom_1,
          users.custom_2,
          users.custom_3,
          users.custom_4,
          users.custom_5
   FROM ((newsletter_sources
          JOIN users ON (((((users.roles_mask)::bit(32) & ((((2)::double PRECISION ^ (newsletter_sources.sourceable_id)::double PRECISION))::integer)::bit(32)))::integer <> 0)))
         LEFT JOIN addresses ON (((addresses.addressable_id = users.id)
                                  AND ((addresses.addressable_type)::text ~ 'User'::text))))
   WHERE (((newsletter_sources.source_type = 2)
           AND ((((users.first_name)::text || ' '::text) || (users.last_name)::text) <> ''::text))
          AND ((users.email)::text <> ''::text)))

  UNION ALL

  SELECT newsletter_sources.id AS newsletter_source_id,
         newsletter_sources.newsletter_list_id,
         newsletter_sources.sourceable_type AS subscriber_type,
         newsletter_sources.sourceable_id AS subscriber_id,
         leads.email_address,
         leads.contact_name AS name,
         leads.company_name,
         leads.zip_code,
         leads.company_ean_number,
         NULL::text AS company_vat_no,
         NULL::text AS contact_title,
         leads.address_line_1,
         leads.address_line_2,
         leads.address_line_3,
         leads.direct_phone_number,
         NULL::text AS phone,
         leads.region_id,
         leads.country_id,
         leads.pnumber,
         leads.nnmid,
         leads.custom_1,
         leads.custom_2,
         leads.custom_3,
         leads.custom_4,
         leads.custom_5
  FROM (newsletter_sources
        JOIN leads ON ((leads.id = newsletter_sources.sourceable_id)))
  WHERE ((((newsletter_sources.source_type = 5)
           AND ((newsletter_sources.sourceable_type)::text = 'AbstractLead'::text))
          AND ((leads.email_address)::text <> ''::text))
         AND ((leads.contact_name)::text <> ''::text)))

 UNION ALL

 SELECT newsletter_sources.id AS newsletter_source_id,
        newsletter_sources.newsletter_list_id,
        newsletter_sources.sourceable_type AS subscriber_type,
        newsletter_sources.sourceable_id AS subscriber_id,
        users.email AS email_address,
        (((users.first_name)::text || ' '::text) || (users.last_name)::text) AS name,
        users.company_name,
        addresses.zip_code,
        users.company_ean_number,
        users.vat_number AS company_vat_no,
        users.title AS contact_title,
        addresses.address_line_1,
        addresses.address_line_2,
        addresses.address_line_3,
        users.direct_phone_number,
        users.phone,
        addresses.region_id,
        addresses.country_id,
        users.pnumber,
        users.nnmid,
        users.custom_1,
        users.custom_2,
        users.custom_3,
        users.custom_4,
        users.custom_5
 FROM ((newsletter_sources
        JOIN users ON ((users.id = newsletter_sources.sourceable_id)))
       LEFT JOIN addresses ON (((addresses.addressable_id = users.id)
                                AND ((addresses.addressable_type)::text ~ 'User'::text))))
 WHERE ((((newsletter_sources.source_type = 5)
          AND ((newsletter_sources.sourceable_type)::text = 'User'::text))
         AND ((((users.first_name)::text || ' '::text) || (users.last_name)::text) <> ''::text))
        AND ((users.email)::text <> ''::text)))

UNION ALL

SELECT newsletter_sources.id AS newsletter_source_id,
       newsletter_sources.newsletter_list_id,
       newsletter_tag_subscribers.subscriber_type,
       newsletter_tag_subscribers.subscriber_id,
       newsletter_tag_subscribers.email_address,
       newsletter_tag_subscribers.name,
       newsletter_tag_subscribers.company_name,
       newsletter_tag_subscribers.zip_code,
       u.company_ean_number,
       u.vat_number AS company_vat_no,
       u.title AS contact_title,
       a.address_line_1,
       a.address_line_2,
       a.address_line_3,
       u.direct_phone_number,
       u.phone,
       a.region_id,
       a.country_id,
       u.pnumber,
       u.nnmid,
       u.custom_1,
       u.custom_2,
       u.custom_3,
       u.custom_4,
       u.custom_5
FROM (((newsletter_sources
        JOIN newsletter_tag_subscribers ON ((newsletter_tag_subscribers.newsletter_source_id = newsletter_sources.id)))
       JOIN users u ON (((newsletter_tag_subscribers.subscriber_id = u.id)
                         AND (newsletter_tag_subscribers.subscriber_type = 'User'::text))))
      LEFT JOIN addresses a ON (((a.addressable_id = u.id)
                                 AND ((a.addressable_type)::text ~ 'User'::text))))
WHERE (((newsletter_sources.source_type = 4)
        AND ((newsletter_tag_subscribers.email_address)::text <> ''::text))
       AND (newsletter_tag_subscribers.name <> ''::text));
