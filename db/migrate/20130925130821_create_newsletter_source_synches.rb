class CreateNewsletterSourceSynches < ActiveRecord::Migration
  def self.up
    create_table :newsletter_source_synches do |t|
      t.integer :newsletter_list_id
      t.boolean :campaign_monitor_synch, :default => false
      t.integer :notificable_id
      t.string :notificable_type
      t.timestamps
    end
  end

  def self.down
    drop_table :newsletter_source_synches
  end
end
