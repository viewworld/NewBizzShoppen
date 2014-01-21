SELECT newsletter_sources.id AS newsletter_source_id,
   newsletter_sources.newsletter_list_id,
       CASE
           WHEN taggings.taggable_type::text ~ 'User'::text THEN 'User'::text
           WHEN taggings.taggable_type::text ~ 'AbstractLead|Lead|Contact'::text THEN 'AbstractLead'::text
           ELSE NULL::text
       END AS subscriber_type,
   taggings.taggable_id AS subscriber_id,
       CASE
           WHEN taggings.taggable_type::text ~ 'User'::text THEN users.email
           WHEN taggings.taggable_type::text ~ 'AbstractLead|Lead|Deal|Contact'::text THEN leads.email_address
           ELSE NULL::character varying
       END AS email_address,
       CASE
           WHEN taggings.taggable_type::text ~ 'User'::text THEN (users.first_name::text || ' '::text) || users.last_name::text
           WHEN taggings.taggable_type::text ~ 'AbstractLead|Lead|Contact'::text THEN leads.contact_name::text
           ELSE NULL::text
       END AS name,
       CASE
           WHEN taggings.taggable_type::text ~ 'User'::text THEN users.company_name
           WHEN taggings.taggable_type::text ~ 'AbstractLead|Lead|Contact'::text THEN leads.company_name
           ELSE NULL::character varying
       END AS company_name,
       CASE
           WHEN taggings.taggable_type::text ~ 'User'::text THEN addresses.zip_code
           WHEN taggings.taggable_type::text ~ 'AbstractLead|Lead|Contact'::text THEN leads.zip_code
           ELSE NULL::character varying
       END AS zip_code,
       CASE
           WHEN taggings.taggable_type::text ~ 'User'::text THEN users.login_key
           WHEN taggings.taggable_type::text ~ 'AbstractLead|Lead|Contact'::text THEN NULL::character varying
           ELSE NULL::character varying
       END AS login_key
FROM newsletter_sources
  JOIN tag_groups ON tag_groups.id = newsletter_sources.sourceable_id
  JOIN taggings tag_group ON tag_group.taggable_id = tag_groups.id AND tag_group.taggable_type::text = 'TagGroup'::text
  JOIN taggings ON taggings.tag_id = tag_group.tag_id
  LEFT JOIN users ON users.id = taggings.taggable_id
  LEFT JOIN addresses ON addresses.addressable_id = users.id AND addresses.addressable_type::text = taggings.taggable_type::text
  LEFT JOIN campaigns ON campaigns.id = taggings.taggable_id
  LEFT JOIN leads ON leads.id = taggings.taggable_id
WHERE taggings.taggable_type::text <> 'TagGroup'::text AND taggings.taggable_type::text <> 'SurveyOption'::text AND newsletter_sources.source_type = 4 AND tag_groups.match_all IS FALSE
GROUP BY newsletter_sources.id, newsletter_sources.newsletter_list_id, taggings.taggable_type, taggings.taggable_id, users.email, leads.email_address, users.first_name, users.last_name, leads.contact_name, leads.company_name, users.company_name, addresses.zip_code, leads.zip_code, users.login_key

UNION ALL

SELECT newsletter_sources.id AS newsletter_source_id,
   newsletter_sources.newsletter_list_id,
       CASE
           WHEN taggings.taggable_type::text ~ 'User'::text THEN 'User'::text
           WHEN taggings.taggable_type::text ~ 'AbstractLead|Lead|Contact'::text THEN 'AbstractLead'::text
           ELSE NULL::text
       END AS subscriber_type,
   taggings.taggable_id AS subscriber_id,
       CASE
           WHEN taggings.taggable_type::text ~ 'User'::text THEN users.email
           WHEN taggings.taggable_type::text ~ 'AbstractLead|Lead|Deal|Contact'::text THEN leads.email_address
           ELSE NULL::character varying
       END AS email_address,
       CASE
           WHEN taggings.taggable_type::text ~ 'User'::text THEN (users.first_name::text || ' '::text) || users.last_name::text
           WHEN taggings.taggable_type::text ~ 'AbstractLead|Lead|Contact'::text THEN leads.contact_name::text
           ELSE NULL::text
       END AS name,
       CASE
           WHEN taggings.taggable_type::text ~ 'User'::text THEN users.company_name
           WHEN taggings.taggable_type::text ~ 'AbstractLead|Lead|Contact'::text THEN leads.company_name
           ELSE NULL::character varying
       END AS company_name,
       CASE
           WHEN taggings.taggable_type::text ~ 'User'::text THEN addresses.zip_code
           WHEN taggings.taggable_type::text ~ 'AbstractLead|Lead|Contact'::text THEN leads.zip_code
           ELSE NULL::character varying
       END AS zip_code,
       CASE
           WHEN taggings.taggable_type::text ~ 'User'::text THEN users.login_key
           WHEN taggings.taggable_type::text ~ 'AbstractLead|Lead|Contact'::text THEN NULL::character varying
           ELSE NULL::character varying
       END AS login_key
FROM newsletter_sources
  JOIN tag_groups ON tag_groups.id = newsletter_sources.sourceable_id
  JOIN taggings tag_group ON tag_group.taggable_id = tag_groups.id AND tag_group.taggable_type::text = 'TagGroup'::text
  JOIN taggings ON taggings.tag_id = tag_group.tag_id
  LEFT JOIN users ON users.id = taggings.taggable_id
  LEFT JOIN addresses ON addresses.addressable_id = users.id AND addresses.addressable_type::text = taggings.taggable_type::text
  LEFT JOIN campaigns ON campaigns.id = taggings.taggable_id
  LEFT JOIN leads ON leads.id = taggings.taggable_id
WHERE taggings.taggable_type::text <> 'TagGroup'::text AND taggings.taggable_type::text <> 'SurveyOption'::text AND newsletter_sources.source_type = 4 AND tag_groups.match_all IS TRUE
GROUP BY newsletter_sources.id, newsletter_sources.newsletter_list_id, newsletter_sources.sourceable_id, taggings.taggable_type, taggings.taggable_id, users.email, leads.email_address, users.first_name, users.last_name, leads.contact_name, users.company_name, leads.company_name, addresses.zip_code, leads.zip_code, users.login_key
HAVING count(*) = (( SELECT count(*) AS count
  FROM taggings taggings_1
 WHERE taggings_1.taggable_type::text = 'TagGroup'::text AND taggings_1.taggable_id = newsletter_sources.sourceable_id));
