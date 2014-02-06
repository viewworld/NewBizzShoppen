def without_invoice_email_template!
  allow_any_instance_of(SubscriptionPlan).to receive(:invoice_email_template).and_return(true)
end
