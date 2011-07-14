class AddIndexes < ActiveRecord::Migration
  def self.up
    add_index :addresses, :region_id
    add_index :articles, :key
    add_index :articles, [:resource_type,:resource_id]
    add_index :articles, :created_at
    add_index :articles, :published_date
    add_index :articles, :views_count
    add_index :article_translations, :title
    add_index :blocked_conversations, :agent_id
    add_index :blocked_conversations, :buyer_id
    add_index :blocked_conversations, :lead_id
    add_index :call_results, :contact_id
    add_index :call_results, :result_id
    add_index :call_results, :created_at
    add_index :call_results, [:creator_id,:creator_type]
    add_index :campaigns, :category_id
    add_index :campaigns, :country_id
    add_index :campaigns, [:creator_id,:creator_type]
#    add_index :campaigns, :currency_id
    add_index :campaigns, :start_date
    add_index :campaigns, :end_date
    add_index :campaigns_results, :campaign_id
    add_index :campaigns_results, :result_id
    add_index :campaigns_users, :campaign_id
    add_index :campaigns_users, :user_id
    add_index :categories, :name
    add_index :comment_readers, :user_id
    add_index :comment_readers, :comment_id
    add_index :comments, [:commentable_id,:commentable_type]
    add_index :comments, :parent_id
    add_index :comments, :last_thread_created_at
    add_index :comments, :created_at
    add_index :countries, :name
    add_index :currencies, [:active,:symbol]
    add_index :invoices, :number
    add_index :invoices, :creation_date
    add_index :invoices, :sale_date
    add_index :invoices, :seller_name
    add_index :invoices, :paid_at
    add_index :lead_certification_requests, :lead_id
    add_index :lead_purchases, :created_at
    add_index :lead_purchases, :accessible_from
    add_index :leads, :created_at
#    add_index :leads, :lead_id
    add_index :leads, :position
    add_index :leads, :lead_purchases_counter
    add_index :leads, :purchase_value
    add_index :leads, :price
    add_index :leads, :sale_limit
    add_index :leads, :has_unsatisfactory_rating
    add_index :lead_templates, :name
    add_index :payment_notifications, :transaction_id
    add_index :result_fields, :result_id
    add_index :result_values, :result_field_id
    add_index :result_values, :call_result_id
    add_index :results, [:creator_id,:creator_type]
    add_index :results, :name
    add_index :translations, :key
    add_index :user_session_logs, :user_id
    #add_index :user_session_logs, :campaign_id
    #add_index :users, :currency_id
    add_index :users, :contact_id
    add_index :users, :bank_account_id
    add_index :users, :parent_id
    add_index :users, :screen_name
    add_index :users, :roles_mask
    add_index :users, :leads_purchased_counter
    add_index :users, :unpaid_leads_counter
    add_index :users, :leads_created_counter
    add_index :users, :leads_volume_sold_counter
    add_index :users, :leads_revenue_counter
    add_index :users, :payout
    add_index :users, :first_name
    add_index :users, :last_name
    add_index :users, :mobile_phone
    add_index :users, :leads_purchased_month_ago_counter
    add_index :users, :leads_purchased_year_ago_counter
    add_index :users, :leads_rated_bad_counter
    add_index :users, :leads_rated_good_counter
    add_index :users, :leads_not_rated_counter
    add_index :users, :leads_rating_avg
    add_index :users, :certification_level
    add_index :users, :department
    add_index :users, :completed_leads_counter
    add_index :users, :leads_requested_counter
    add_index :users, :leads_assigned_month_ago_counter
    add_index :users, :leads_assigned_year_ago_counter
    add_index :users, :total_leads_assigned_counter
  end

  def self.down
  end
end
