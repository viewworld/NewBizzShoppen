class CreateNewsletterLists < ActiveRecord::Migration
  def self.up
    create_table :newsletter_lists do |t|
      t.string :name
      t.integer :owner_id
      t.integer :creator_id
      t.string :creator_type
      t.timestamps
    end
  end

  def self.down
    drop_table :newsletter_lists
  end
end
