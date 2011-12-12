When /^invoice exists for user "([^"]*)" with role "([^"]*)" with seller "([^"]*)"(?: with attributes "([^"]*)")?$/ do |email,role_name,seller_name, options|
  seller = Seller.find_by_company_name(seller_name)
  user = "User::#{role_name.classify}".constantize.where(:email => email).first
  attrs = options ? Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys.merge(:user => user, :seller => seller) : {:user => user, :seller => seller}
  Invoice.make!(attrs)
end

When /^invoice exists for user "([^"]*)" with role "([^"]*)"(?: with attributes "([^"]*)")?$/ do |email,role_name,options|
  user = "User::#{role_name.classify}".constantize.where(:email => email).first
  attrs = options ? Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys.merge(:user => user) : {:user => user}
  @invoice = Invoice.make!(attrs)
end

When /^invoice is paid$/ do
  @invoice.update_attribute(:paid_at, Time.now)
end

When /^invoice line for first invoice exists for user "([^"]*)" with role "([^"]*)"(?: with attributes "([^"]*)")?$/ do |email,role_name,options|
  user = "User::#{role_name.classify}".constantize.where(:email => email).first
  invoice = user.invoices.first
  attrs = options ? Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys.merge(:invoice => invoice) : {:invoice => invoice}
  InvoiceLine.make!(attrs)
end

When /^first invoice for user "([^"]*)" with role "([^"]*)" exists with attributes "([^"]*)"$/ do |email, role_name, options|
  invoice = "User::#{role_name.classify}".constantize.where(:email => email).first.invoices.first
  invoice.update_attributes(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
  invoice.reload
end

When /^first invoice for user "([^"]*)" with role "([^"]*)" is created at "([^"]*)"$/ do |email, role_name, date|
  invoice = "User::#{role_name.classify}".constantize.where(:email => email).first.invoices.first
  Invoice.update_all(["created_at = :date, sale_date = :date",{:date => date}], ["id=?",invoice.id])
end

When /^first invoice for user "([^"]*)" with role "([^"]*)" is paid$/ do |email,role_name|
  invoice = "User::#{role_name.classify}".constantize.where(:email => email).first.invoices.first
  Invoice.update_all(["paid_at = :date",{:date => Time.now}], ["id=?",invoice.id])
end

When /^first invoice for user "([^"]*)" is not paid$/ do |email|
  invoice = User.where(:email => email).first.invoices.first
  Invoice.update_all(["paid_at = :date",{:date => nil}], ["id=?",invoice.id])
end

Then /^invoice is created for user with email "([^"]*)" and role "([^"]*)"$/ do |email, role|
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  assert customer.invoices.last.created_at.to_date == Date.today
end

Then /^invoice line is created for lead "([^"]*)" and user with email "([^"]*)" and role "([^"]*)"$/ do |header, email, role|
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  lead = Lead.where(:header => header).first
  assert !customer.invoices.last.invoice_lines.detect { |il| il.payable.is_a?(LeadPurchase) and il.payable.lead == lead }.nil?
end

Then /^invoices count for user with email "([^"]*)" and role "([^"]*)" is (\d+)$/ do |email, role, count|
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  assert customer.invoices.size == count.to_i
end

Then /^user with email "([^"]*)" and role "([^"]*)" has invoice generated for all unpaid leads$/ do |email, role|
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  customer.lead_purchases.map{|lp| lp.lead.currency}.uniq.each do |currency|
    invoice = Invoice.create(:user_id => customer.id, :paid_at =>  Time.now, :currency => currency)
    invoice.reload
    ManualTransaction.create(:invoice => invoice, :amount => invoice.total, :paid_at => Time.now)
  end
end

Given /^all invoices for user with email "([^"]*)" and role "([^"]*)" are unpaid$/ do |email, role|
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  Invoice.where("user_id = ?", customer.id).each do |invoice|
    invoice.update_attribute(:paid_at, nil)
  end
end

Then /^user with email "([^"]*)" and role "([^"]*)" has invoice for lead "([^"]*)" and transaction created (by paypal|manually)$/ do |email, role, header, transaction_type|
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  lead = Lead.where(:header => header).first
  lead_purchase = lead.lead_purchases.first
  if transaction_type == "by paypal"
    payment_notification = PaymentNotification.create(:status => "Completed", :buyer_id => customer.id, :transaction_id => "428282", :params => {})
  else
    payment_notification = nil
  end
  invoice = Invoice.create(:user_id => customer.id, :seller => Seller.make!, :paid_at => transaction_type == "by paypal" ? Time.now : nil)
  if transaction_type == "by paypal"
    PaypalTransaction.create(:invoice => invoice, :payment_notification => payment_notification, :amount => lead.price, :paid_at => Time.now)
  else
    ManualTransaction.create(:invoice => invoice, :amount => lead.price, :paid_at => Time.now)
  end
  InvoiceLine.create(:invoice => invoice, :payable => lead_purchase, :name => lead_purchase.lead.header, :netto_price => lead_purchase.lead.price)
end

Then /^invoice lines for last invoice are paid for user with email "([^"]*)" and role "([^"]*)"$/ do |email, role|
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  invoice = customer.invoices.last
  assert !invoice.paid_at.blank?
  assert invoice.invoice_lines.detect { |il| il.paid_at.blank? }.nil?
end

Given /^there are no invoices$/ do
  Invoice.delete_all
end

When /^last invoice for user "([^"]*)" with role "([^"]*)" is credited$/ do |email, role|
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  invoice = customer.invoices.last
  Credit.create(:invoice => invoice)
end

When /^last invoice for user "([^"]*)" with role "([^"]*)" is refunded for lines "([^"]*)"$/ do |email, role, lead_names|
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  invoice = customer.invoices.last
  leads = lead_names.split(",").map { |header| Lead.where(:header => header).first }.map(&:id)
  invoice.invoice_lines.select { |il| leads.include?(il.payable.lead_id) }.each do |invoice_line|
    invoice_line.update_attribute(:is_credited, true)
  end
end

When /^first invoice for user "([^"]*)" with role "([^"]*)" has seller with company name "([^"]*)"$/ do |email, role_name, company_name|
  invoice = "User::#{role_name.classify}".constantize.where(:email => email).first.invoices.first
  assert invoice.seller == Seller.where(:company_name => company_name).first
end

When /^first invoice for user "([^"]*)" with role "([^"]*)" has seller for country "([^"]*)"$/ do |email,role_name, country_name|
  invoice = "User::#{role_name.classify}".constantize.where(:email => email).first.invoices.first
  assert invoice.seller == Seller.for_country(Country.where(:name => country_name).first.id).first
end

Given /^first invoice exists for user "([^"]*)" with the following invoice lines$/ do |email, table|
  user = User.where(:email => email).first.with_role
  invoice = user.invoices.first

  assert invoice.invoice_lines.size == table.hashes.size

  table.hashes.each do |hash|
    assert invoice.invoice_lines.detect { |i| i.name == hash["name"] }.netto_price.to_i == hash["netto_price"].to_i
  end
end