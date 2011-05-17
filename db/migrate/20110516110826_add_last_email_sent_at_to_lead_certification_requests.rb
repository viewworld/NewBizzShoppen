class AddLastEmailSentAtToLeadCertificationRequests < ActiveRecord::Migration
  def self.up
    add_column :lead_certification_requests, :last_email_sent_at, :datetime
  end

  def self.down
    remove_column :lead_certification_requests, :last_email_sent_at
  end
end
