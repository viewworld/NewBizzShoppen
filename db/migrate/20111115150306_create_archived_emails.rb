class CreateArchivedEmails < ActiveRecord::Migration
  def self.up
    create_table :archived_emails do |t|
      t.integer :email_template_uniq_id
      t.string :to_recipients
      t.string :bcc_recipients
      t.string :cc_recipients
      t.string :reply_to
      t.integer :sender_id
      t.string :subject
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :archived_emails
  end
end
