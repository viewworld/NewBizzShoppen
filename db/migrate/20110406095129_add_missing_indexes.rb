class AddMissingIndexes < ActiveRecord::Migration
  def self.up
    
    # These indexes were found by searching for AR::Base finds on your application
    # It is strongly recommanded that you will consult a professional DBA about your infrastucture and implemntation before
    # changing your database in that matter.
    # There is a possibility that some of the indexes offered below is not required and can be removed and not added, if you require
    # further assistance with your rails application, database infrastructure or any other problem, visit:
    #
    # http://www.railsmentors.org
    # http://www.railstutor.org
    # http://guides.rubyonrails.org

    
    add_index :sellers, :bank_account_id
    add_index :regions, :country_id
    add_index :lead_templates, :category_id
    add_index :lead_templates, [:creator_id, :creator_type]
    add_index :leads, :currency_id
    add_index :leads, [:creator_id, :creator_type]
    add_index :leads, :region_id
    add_index :addresses, :country_id
    add_index :addresses, [:addressable_id, :addressable_type]
    add_index :country_interests, :user_id
    add_index :country_interests, :country_id
    add_index :invoice_lines, :payable_id
    add_index :invoice_lines, :invoice_id
    add_index :invoice_lines, [:payable_id, :payable_type]
    add_index :category_customers, :category_id
    add_index :category_customers, :user_id
    add_index :payment_transactions, [:id, :type]
    add_index :payment_transactions, :payment_notification_id
    add_index :payment_transactions, :invoice_id
    add_index :assets, :user_id
    add_index :assets, [:resource_id, :resource_type]
    add_index :assets, [:id, :type]
    add_index :lead_purchases, :owner_id
    add_index :lead_purchases, :lead_id
    add_index :lead_purchases, :assignee_id
    add_index :lead_purchases, :purchased_by
    add_index :lead_purchases, :requested_by
    add_index :lead_template_fields, :lead_template_id
    add_index :categories_users, :category_id
    add_index :categories_users, :user_id
    add_index :payment_notifications, :buyer_id
    add_index :lead_template_values, :lead_template_field_id
    add_index :lead_template_values, :lead_id
    add_index :category_interests, :category_id
    add_index :category_interests, :user_id
    add_index :categories, :parent_id
    add_index :credit_notes, :invoice_id
    add_index :vat_rates, :country_id
    add_index :category_countries, :category_id
    add_index :category_countries, :country_id
    add_index :invoices, :currency_id
    add_index :invoices, :user_id
    add_index :invoices, :bank_account_id
    add_index :invoices, :seller_id
    add_index :category_agents, :category_id
    add_index :category_agents, :user_id
  end
  
  def self.down
    remove_index :sellers, :bank_account_id
    remove_index :regions, :country_id
    remove_index :lead_templates, :category_id
    remove_index :lead_templates, :column => [:creator_id, :creator_type]
    remove_index :leads, :currency_id
    remove_index :leads, :column => [:creator_id, :creator_type]
    remove_index :leads, :region_id
    remove_index :addresses, :country_id
    remove_index :addresses, :column => [:addressable_id, :addressable_type]
    remove_index :country_interests, :user_id
    remove_index :country_interests, :country_id
    remove_index :invoice_lines, :payable_id
    remove_index :invoice_lines, :invoice_id
    remove_index :invoice_lines, :column => [:payable_id, :payable_type]
    remove_index :category_customers, :category_id
    remove_index :category_customers, :user_id
    remove_index :payment_transactions, :column => [:id, :type]
    remove_index :payment_transactions, :payment_notification_id
    remove_index :payment_transactions, :invoice_id
    remove_index :assets, :user_id
    remove_index :assets, :column => [:resource_id, :resource_type]
    remove_index :assets, :column => [:id, :type]
    remove_index :lead_purchases, :owner_id
    remove_index :lead_purchases, :lead_id
    remove_index :lead_purchases, :assignee_id
    remove_index :lead_purchases, :purchased_by
    remove_index :lead_purchases, :requested_by
    remove_index :lead_template_fields, :lead_template_id
    remove_index :categories_users, :category_id
    remove_index :categories_users, :user_id
    remove_index :payment_notifications, :buyer_id
    remove_index :lead_template_values, :lead_template_field_id
    remove_index :lead_template_values, :lead_id
    remove_index :category_interests, :category_id
    remove_index :category_interests, :user_id
    remove_index :categories, :parent_id
    remove_index :credit_notes, :invoice_id
    remove_index :vat_rates, :country_id
    remove_index :category_countries, :category_id
    remove_index :category_countries, :country_id
    remove_index :invoices, :currency_id
    remove_index :invoices, :user_id
    remove_index :invoices, :bank_account_id
    remove_index :invoices, :seller_id
    remove_index :category_agents, :category_id
    remove_index :category_agents, :user_id
  end
end
