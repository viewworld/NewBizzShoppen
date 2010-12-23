Given /^paypal payment for user with email "([^"]*)" and role "([^"]*)"$/ do |email, role|
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  rack_test_session_wrapper = Capybara.current_session.driver
  rack_test_session_wrapper.process(:post, "/payment_notifications", :txn_id => "irek", :payment_status => "Completed", :secret => APP_CONFIG[:paypal_secret], :receiver_email => APP_CONFIG[:paypal_email], :mc_gross => customer.cart.total.to_s, :invoice => customer.cart.id)
end

Then /^I should be redirected to paypal page$/ do
  assert current_path.include?("testpaypalurl")
end

Then /^last payment notification is marked as "([^"]*)"$/ do |status|
  assert PaymentNotification.last.status == status
end

Then /^last payment notification is linked to invoice$/ do
  assert PaymentNotification.last.payment_transaction.invoice.present? == true
end