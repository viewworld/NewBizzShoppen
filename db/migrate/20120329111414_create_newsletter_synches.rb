class CreateNewsletterSynches < ActiveRecord::Migration
  def self.up
    create_table :newsletter_synches do |t|
      t.integer :newsletter_list_id
      t.timestamps
    end
  end

  def self.down
    drop_table :newsletter_synches
  end
end
