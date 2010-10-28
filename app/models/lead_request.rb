class LeadRequest < LeadPurchaseBase

  default_scope where("requested_by IS NOT NULL")

  def accept!
    self.assignee_id = requested_by
    self.requested_by = nil
    self.accessible = true if owner.big_buyer?
    self.save
  end

  def reject!
    self.destroy
  end
end