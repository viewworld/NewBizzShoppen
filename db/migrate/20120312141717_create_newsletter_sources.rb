class CreateNewsletterSources < ActiveRecord::Migration
  def self.up
    create_table :newsletter_sources do |t|
      t.integer :source_type
      t.integer :newsletter_list_id
      t.integer :sourceable_id
      t.string :sourceable_type
      t.timestamps
    end
  end

  def self.down
    drop_table :newsletter_sources
  end
end
