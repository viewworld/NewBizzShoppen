SELECT comments.title,
       leads.creator_id AS user_id,
       'Comment'::character varying AS communication_type,
       comments.id AS communication_id,
       NULL::character varying AS email,
       NULL::integer AS status,
       comments.commentable_id AS related_id,
       comments.commentable_type AS related_type,
       comments.created_at
FROM (comments
      JOIN leads ON ((leads.id = comments.commentable_id)))

UNION

SELECT archived_emails.subject AS title,
       archived_emails.sender_id AS user_id,
       'ArchivedEmail'::character varying AS communication_type,
       archived_emails.id AS communication_id,
       archived_emails."to" AS email,
       archived_emails.status,
       archived_emails.related_id,
       archived_emails.related_type,
       archived_emails.created_at
FROM archived_emails
WHERE ((archived_emails.related_type)::text = 'CallResult'::text);
