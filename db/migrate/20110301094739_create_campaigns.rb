class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.integer :id
      t.string :name
      t.integer :category_id
      t.integer :country_id
      t.date :start_date
      t.date :end_date
      t.integer :max_contact_number
    end
  end

  def self.down
    drop_table :campaigns
  end
end
