def without_lead_notification!
  allow_any_instance_of(Lead).to receive(:notify_suppliers_about_changes).and_return(true)
  allow_any_instance_of(LeadPurchase).to receive(:deliver_bought_notification).and_return(true)
end
