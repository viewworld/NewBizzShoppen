class CreateLeadCertificationRequests < ActiveRecord::Migration
  def self.up
    create_table :lead_certification_requests do |t|
      t.integer :lead_id
      t.integer :state
      t.string :token
      t.timestamps
    end

  end

  def self.down
    drop_table :lead_certification_requests
  end
end
