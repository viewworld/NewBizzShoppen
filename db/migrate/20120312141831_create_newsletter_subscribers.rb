class CreateNewsletterSubscribers < ActiveRecord::Migration
  def self.up
    create_table :newsletter_subscribers do |t|
      t.string :email
      t.string :name
      t.integer :subscribable_id
      t.string :subscribable_type
      t.timestamps
    end

    create_table :newsletter_sources_newsletter_subscribers, :id => false do |t|
      t.integer :newsletter_subscriber_id
      t.integer :newsletter_source_id
    end
  end

  def self.down
    drop_table :newsletter_subscribers
    drop_table :newsletter_sources_newsletter_subscribers
  end
end
