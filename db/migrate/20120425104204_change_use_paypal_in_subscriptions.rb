class ChangeUsePaypalInSubscriptions < ActiveRecord::Migration
  def self.up
    rename_column :subscription_plans, :use_paypal, :use_online_payment
    rename_column :subscription_plans, :paypal_billing_at_start, :payment_billing_at_start
    rename_column :subscription_plans, :paypal_retries, :payment_retries


    rename_column :subscriptions, :use_paypal, :use_online_payment
    rename_column :subscriptions, :cancelled_in_paypal, :cancelled_in_payment_gateway
    rename_column :subscriptions, :paypal_billing_at_start, :payment_billing_at_start
    rename_column :subscriptions, :paypal_invoice_id, :payment_invoice_id
    rename_column :subscriptions, :paypal_profile_id, :payment_profile_id
    rename_column :subscriptions, :paypal_retries, :payment_retries
    rename_column :subscriptions, :paypal_retries_counter, :payment_retries_counter
    add_column :subscriptions, :payment_type, :integer, :default => 0
    add_column :voucher_numbers, :payment_type, :integer, :default => 1

    rename_column :subscription_sub_periods, :paypal_paid_auto, :payment_paid_auto
    rename_column :subscription_sub_periods, :paypal_paid_manual, :payment_paid_manual
    rename_column :subscription_sub_periods, :paypal_payment_id, :payment_id
    rename_column :subscription_sub_periods, :paypal_retries, :payment_retries
    rename_column :subscription_sub_periods, :paypal_txn_id, :payment_txn_id

    add_column :lead_purchases, :payment_type, :integer, :default => 0

    Subscription.all.each do |s|
      s.update_attributes(:payment_type => s.use_online_payment? ? Subscription::PAYPAL_PAYMENT_TYPE : Subscription::MANUAL_PAYMENT_TYPE)
    end

    execute "UPDATE voucher_numbers SET payment_type = 1 WHERE payment_type is NULL"

    execute %{
              CREATE OR REPLACE VIEW debtors as
              SELECT lead_purchases.owner_id, users.email as owner_email, leads.currency_id, lead_purchases.assigned_at, leads.header, leads.contact_name, leads.company_name, leads.price, lead_purchases.quantity, lead_purchases.euro_price
              FROM lead_purchases
              JOIN leads ON leads.id = lead_purchases.lead_id
              JOIN users ON users.id = lead_purchases.owner_id
              LEFT JOIN invoice_lines ON lead_purchases.id = invoice_lines.payable_id
              WHERE (lead_purchases.type::text = 'LeadPurchase'::text OR lead_purchases.type::text = 'LeadPrimaryPurchase'::text OR lead_purchases.type::text = 'LeadSinglePurchase'::text OR lead_purchases.type::text = 'LeadBuyout'::text OR lead_purchases.type::text = 'LeadAdditionalBuyout'::text) AND invoice_lines.payable_id IS NULL

              UNION

              SELECT subscriptions.user_id AS owner_id, users.email AS owner_email, subscriptions.currency_id, NULL::unknown AS assigned_at, NULL::unknown AS header, NULL::unknown AS contact_name, NULL::unknown AS company_name, subscription_sub_periods.billing_price AS price, 1 AS quantity, subscription_sub_periods.euro_billing_price AS euro_price
              FROM subscription_sub_periods
              JOIN subscriptions ON subscriptions.id = subscription_sub_periods.subscription_id
              JOIN users ON users.id = subscriptions.user_id
              WHERE subscriptions.billing_cycle > 0 AND subscription_sub_periods.billing_date IS NOT NULL AND subscription_sub_periods.billing_date <= 'now'::text::date AND subscription_sub_periods.invoice_id IS NULL AND subscriptions.use_online_payment IS NOT TRUE;
             }
  end

  def self.down
  end
end
