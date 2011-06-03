class AddEmailToLeadCertificationRequests < ActiveRecord::Migration
  def self.up
    add_column :lead_certification_requests, :email, :string
  end

  def self.down
    remove_column :lead_certification_requests, :email
  end
end
