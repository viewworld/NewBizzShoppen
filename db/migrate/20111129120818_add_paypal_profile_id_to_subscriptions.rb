class AddPaypalProfileIdToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :paypal_profile_id, :string
  end

  def self.down
    remove_column :subscriptions, :paypal_profile_id
  end
end
