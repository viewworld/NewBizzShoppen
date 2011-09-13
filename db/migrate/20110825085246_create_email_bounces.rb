class CreateEmailBounces < ActiveRecord::Migration
  def self.up
    create_table :email_bounces do |t|
      t.string :subject
      t.string :name
      t.boolean :inactive
      t.text :content
      t.string :tag
      t.string :message_id
      t.text :details
      t.integer :postmark_id
      t.boolean :can_activate
      t.datetime :bounced_at
      t.text :description
      t.string :email
      t.integer :type_code
      t.integer :bounce_type
      t.boolean :dump_available
    end
  end

  def self.down
    drop_table :email_bounces
  end
end
