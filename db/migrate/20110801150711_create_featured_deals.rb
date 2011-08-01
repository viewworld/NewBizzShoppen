class CreateFeaturedDeals < ActiveRecord::Migration
  def self.up
    create_table :featured_deals do |t|
      t.string :type
      t.integer :deal_id
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :featured_deals
  end
end
