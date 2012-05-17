Given /^quickpay payment for user with email "([^"]*)" and role "([^"]*)"$/ do |email, role|
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  rack_test_session_wrapper = Capybara.current_driver == :selenium ? self : Capybara.current_session.driver

  params = { :transaction => "irek", :qpstat => "000",
    :merchantemail => APP_CONFIG[:quickpay_email],
    :amount => "#{customer.cart.total_in_cents}", :ordernumber => customer.cart.id,
    :msgtype => "capture", :merchant => "John Merchant"}

  params[:md5check] = ActiveMerchantCartPaymentNotification.new.calculate_md5_check(params, :window_response)

  rack_test_session_wrapper.post("/active_merchant_payment_notifications", params)
end

Given /^quickpay voucher payment (succeeded|failed) for deal "([^"]*)" and user with email "([^"]*)" and role "([^"]*)"$/ do |status, deal, email, role|
  deal = Deal.where(:header => deal).first
  voucher_number = deal.voucher_numbers.first
  voucher_number.state.should == "new"
  voucher_number.reserved_until.blank?.should == false
  member = "User::#{role.camelize}".constantize.find_by_email(email)
  rack_test_session_wrapper = Capybara.current_driver == :selenium ? self : Capybara.current_session.driver

  params = { :transaction => "irek", :qpstat => status == "succeeded" ? "000" : "003",
    :merchantemail => APP_CONFIG[:quickpay_email],
    :amount => "#{deal.brutto_discounted_price(member) * 100}",
    :ordernumber => "v_#{voucher_number.deal_unique_id}_#{voucher_number.number}_#{voucher_number.user_id}",
    :msgtype => "capture", :merchant => "John Merchant"}

  params[:md5check] = ActiveMerchantVoucherPaymentNotification.new.calculate_md5_check(params, :window_response)

  rack_test_session_wrapper.post("/active_merchant_payment_notifications", params)

  if status == "succeeded"
    voucher_number.reload.state.should == "active"
    invoice = member.invoices.last
    invoice.invoice_lines.detect { |il| il.payable.is_a?(VoucherNumber) }.payable.should == voucher_number
    invoice.paid?.should == true
  else
    voucher_number.reload
    voucher_number.state.should == "new"
    voucher_number.reserved_until.should be_nil
    voucher_number.user_id.should be_nil
  end
end

Then /^I should be redirected to quickpay page$/ do
  assert current_path.include?("test/quickpay/url")
end