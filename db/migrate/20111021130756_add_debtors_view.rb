class AddDebtorsView < ActiveRecord::Migration
  def self.up
    execute %{
              CREATE VIEW debtors as
              SELECT lead_purchases.owner_id,
              leads.currency_id,
              lead_purchases.assigned_at,
              leads.header,
              leads.contact_name,
              leads.company_name,
              leads.price,
              lead_purchases.quantity,
              lead_purchases.euro_price
              FROM "lead_purchases" inner join leads on leads.id=lead_purchases.lead_id inner join users on users.id=lead_purchases.owner_id
              left outer join invoice_lines on lead_purchases.id=invoice_lines.payable_id
              WHERE ((((("lead_purchases"."type" = 'LeadPurchase' OR "lead_purchases"."type" = 'LeadPrimaryPurchase')
              OR "lead_purchases"."type" = 'LeadSinglePurchase') OR "lead_purchases"."type" = 'LeadBuyout')
              OR "lead_purchases"."type" = 'LeadAdditionalBuyout')) AND (invoice_lines.payable_id is NULL)


              UNION

              SELECT subscriptions.user_id as owner_id,
              subscriptions.currency_id,
              NULL as assigned_at,
              NULL as header,
              NULL as contact_name,
              NULL as company_name,
              billing_price as price,
              1 as quantity,
              euro_billing_price as euro_price
              FROM subscriptions
              WHERE billing_cycle > 0 AND subscriptions.billing_date IS NOT NULL AND subscriptions.billing_date <= current_date
              AND subscriptions.invoiced_at IS NULL
             }
  end

  def self.down
  end
end
