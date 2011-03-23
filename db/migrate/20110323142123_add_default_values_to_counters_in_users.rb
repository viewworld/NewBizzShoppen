class AddDefaultValuesToCountersInUsers < ActiveRecord::Migration
  def self.up
    %w{unpaid_leads_counter leads_purchased_counter payout}.each do |user_field|
      execute "ALTER TABLE users ALTER COLUMN #{user_field} SET DEFAULT 0"
      execute "UPDATE users SET #{user_field} = 0 WHERE #{user_field} IS NULL"
    end
  end

  def self.down
  end
end
