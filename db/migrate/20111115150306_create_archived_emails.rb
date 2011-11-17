class CreateArchivedEmails < ActiveRecord::Migration
  def self.up
    create_table :archived_emails do |t|
      t.string :email_template_uniq_id
      t.string :to
      t.string :bcc
      t.string :cc
      t.string :reply_to
      t.integer :sender_id
      t.string :subject
      t.text :body
      t.string :message_id
      t.string :error_code
      t.integer :status, :default => 0
      t.integer :related_id
      t.string :related_type
      t.text :bounce_details
      t.datetime :bounced_at

      t.timestamps
    end
  end

  def self.down
    drop_table :archived_emails
  end
end
