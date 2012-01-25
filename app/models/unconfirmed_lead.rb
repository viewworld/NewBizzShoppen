class UnconfirmedLead < AbstractLead

  def process_for_lead_information?
    false
  end

  def confirm!
    unless voucher_confirmed_at
      lead = Lead.new
      self.attributes.keys.except(["id", "type"]).each do |method|
        lead.send("#{method}=".to_sym, self.send(method.to_sym))
      end
      lead.save
      update_attribute(:voucher_confirmed_at, Time.now)
    end
  end

  def cancel!
    update_attribute(:voucher_cancelled_at, Time.now)
  end
end