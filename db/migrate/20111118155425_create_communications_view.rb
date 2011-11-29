class CreateCommunicationsView < ActiveRecord::Migration
  def self.up
    execute %{ DROP VIEW IF EXISTS communications }
    execute %{
    CREATE VIEW communications as
    SELECT title, leads.creator_id AS user_id, 'Comment'::VARCHAR AS communication_type, NULL AS email, NULL AS status,
    commentable_id AS related_id, commentable_type as related_type, comments.created_at
    FROM comments
    INNER JOIN leads ON leads.id = comments.commentable_id

    UNION

    SELECT subject AS title, sender_id AS user_id, 'ArchivedEmail'::VARCHAR AS communication_type,
    archived_emails.to AS email, status, related_id, related_type, created_at
    FROM archived_emails
    WHERE related_type = 'CallResult'

    }
  end

  def self.down
  end
end
