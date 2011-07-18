class Deal < AbstractLead


  scope :without_inactive, where("purchase_decision_date >= ?", Date.today)

  private

  def process_for_lead_information?
    false
  end

end