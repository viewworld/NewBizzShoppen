Given /^paypal payment for user with email "([^"]*)" and role "([^"]*)"$/ do |email, role|
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  rack_test_session_wrapper = Capybara.current_session.driver
  rack_test_session_wrapper.post("/payment_notifications", :txn_type => "cart", :txn_id => "irek", :payment_status => "Completed", :secret => APP_CONFIG[:paypal_secret], :receiver_email => APP_CONFIG[:paypal_email], :mc_gross => BigDecimal(customer.cart.total.to_s).to_s, :invoice => customer.cart.id)
end

Then /^I should be redirected to paypal page$/ do
  assert current_path.include?("test/paypal/url")
end

Then /^last payment notification is marked as "([^"]*)"$/ do |status|
  assert PaymentNotification.last.status == status
end

Then /^last payment notification is linked to invoice$/ do
  assert CartPaymentNotification.last.payment_transaction.invoice.present? == true
end

Then /^cart for user "([^"]*)" has VAT included in total value$/ do |email|
  u = User.where(:email => email).first.with_role
  u.cart.total.should == (u.cart.total_netto + u.cart.total_vat_value)
end

Then /^cart for user "([^"]*)" has additional line for VAT$/ do |email|
  u = User.where(:email => email).first.with_role
  u.cart.hash_for_paypal(nil,nil).values.should include I18n.t("cart.vat_line_title", :percentage => "#{u.country_vat_rate}%")
  u.cart.hash_for_paypal(nil,nil).values.map(&:to_s).should include u.cart.total_vat_value.to_s
end

