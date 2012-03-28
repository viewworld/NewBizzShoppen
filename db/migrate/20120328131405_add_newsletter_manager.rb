class AddNewsletterManager < ActiveRecord::Migration
  def self.up
    add_column :subscription_plans, :newsletter_manager, :boolean, :default => false
    add_column :subscriptions, :newsletter_manager, :boolean, :default => false
    add_column :users, :newsletter_manager, :boolean, :default => false

    execute "UPDATE users SET newsletter_manager = FALSE"
    execute "UPDATE subscription_plans SET newsletter_manager = FALSE"
    execute "UPDATE subscriptions SET newsletter_manager = FALSE"
  end

  def self.down
    remove_column :subscription_plans, :newsletter_manager
    remove_column :subscriptions, :newsletter_manager
    remove_column :users, :newsletter_manager
  end
end
