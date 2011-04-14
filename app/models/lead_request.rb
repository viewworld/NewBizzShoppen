class LeadRequest < LeadPurchaseBase

  belongs_to :requestee, :class_name => "User::LeadUser", :foreign_key => :requested_by

  def accept!
    self.assignee_id = requested_by
    self.requested_by = nil
    self.accessible_from = Time.now if owner.big_buyer?
    self.type = "LeadSinglePurchase"
    self.save
  end

  def reject!
    self.destroy
  end
end