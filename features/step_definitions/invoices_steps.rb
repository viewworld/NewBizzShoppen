When /^invoice exists for user "([^"]*)"$/ do |email|
  Invoice.make!(:user => User.where(:email => email).first)
end

Then /^invoice is created for user with email "([^"]*)" and role "([^"]*)"$/ do |email, role|
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  assert customer.invoices.last.created_at.to_date == Date.today
end

Then /^invoice line is created for lead "([^"]*)" and user with email "([^"]*)" and role "([^"]*)"$/ do |header, email, role|
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  lead = Lead.find_by_header(header).first
  assert !customer.invoices.last.invoice_lines.detect { |il| il.payable.lead == lead }.nil?
end

Then /^invoices count for user with email "([^"]*)" and role "([^"]*)" is (\d+)$/ do |email, role, count|
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  assert customer.invoices.size == count.to_i
end

Then /^user with email "([^"]*)" and role "([^"]*)" has invoice for lead "([^"]*)" and transaction created (by paypal|manually)$/ do |email, role, header, transaction_type|
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  lead = Lead.find_by_header(header).first
  lead_purchase = lead.lead_purchases.first
  if transaction_type == "by paypal"
    payment_notification = PaymentNotification.create(:status => "Completed", :buyer_id => customer.id, :transaction_id => "428282", :params => {})
  else
    payment_notification = nil
  end
  invoice = Invoice.create(:user_id => customer.id, :paid_at => Time.now)
  if transaction_type == "by paypal"
    PaypalTransaction.create(:invoice => invoice, :payment_notification => payment_notification, :amount => lead.price, :paid_at => Time.now)
  else
    ManualTransaction.create(:invoice => invoice, :amount => lead.price, :paid_at => Time.now)
  end
  InvoiceLine.create(:invoice => invoice, :payable => lead_purchase, :name => lead_purchase.lead.header, :netto_price => lead_purchase.lead.price)
end