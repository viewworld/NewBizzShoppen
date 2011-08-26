class CreateDealCertificationRequests < ActiveRecord::Migration
  def self.up
    create_table :deal_certification_requests do |t|
      t.integer :deal_id
      t.integer :state
      t.string :token
      t.datetime :last_visit_date
      t.datetime :last_email_sent_at
      t.string :email
      t.timestamps
    end
    add_index :deal_certification_requests, :deal_id

  end

  def self.down
    drop_table :deal_certification_requests
  end
end
