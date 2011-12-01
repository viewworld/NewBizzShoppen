class ChangeDebtorsView < ActiveRecord::Migration
  def self.up
    execute %{ DROP VIEW debtors }
    execute %{
              CREATE VIEW debtors as
              SELECT lead_purchases.owner_id, users.email as owner_email, leads.currency_id, lead_purchases.assigned_at, leads.header, leads.contact_name, leads.company_name, leads.price, lead_purchases.quantity, lead_purchases.euro_price
              FROM lead_purchases
              JOIN leads ON leads.id = lead_purchases.lead_id
              JOIN users ON users.id = lead_purchases.owner_id
              LEFT JOIN invoice_lines ON lead_purchases.id = invoice_lines.payable_id
              WHERE (lead_purchases.type::text = 'LeadPurchase'::text OR lead_purchases.type::text = 'LeadPrimaryPurchase'::text OR lead_purchases.type::text = 'LeadSinglePurchase'::text OR lead_purchases.type::text = 'LeadBuyout'::text OR lead_purchases.type::text = 'LeadAdditionalBuyout'::text) AND invoice_lines.payable_id IS NULL

              UNION

              SELECT subscriptions.user_id AS owner_id, users.email as owner_email, subscriptions.currency_id, NULL::unknown AS assigned_at, NULL::unknown AS header, NULL::unknown AS contact_name, NULL::unknown AS company_name, subscriptions.billing_price AS price, 1 AS quantity, subscriptions.euro_billing_price AS euro_price
              FROM subscriptions
              JOIN users on users.id = subscriptions.user_id
              WHERE subscriptions.billing_cycle > 0 AND subscriptions.billing_date IS NOT NULL AND subscriptions.billing_date <= 'now'::text::date AND subscriptions.invoiced_at IS NULL;
             }
  end

  def self.down
  end
end
