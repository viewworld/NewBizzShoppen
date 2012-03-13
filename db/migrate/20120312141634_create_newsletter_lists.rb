class CreateNewsletterLists < ActiveRecord::Migration
  def self.up
    create_table :newsletter_lists do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :newsletter_lists
  end
end
