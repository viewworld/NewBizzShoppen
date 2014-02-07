class AddNewsletterManager < ActiveRecord::Migration
  def self.up
    add_column :subscription_plans, :newsletter_manager, :boolean, :default => false
    add_column :subscriptions, :newsletter_manager, :boolean, :default => false
    add_column :users, :newsletter_manager, :boolean, :default => false
  end

  def self.down
    remove_column :subscription_plans, :newsletter_manager
    remove_column :subscriptions, :newsletter_manager
    remove_column :users, :newsletter_manager
  end
end
