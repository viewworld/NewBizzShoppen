class LeadRequest < LeadPurchaseBase

  belongs_to :requestee, :class_name => "User::LeadUser", :foreign_key => :requested_by

  default_scope where("requested_by IS NOT NULL")

  def accept!
    self.assignee_id = requested_by
    self.requested_by = nil
    self.accessible = Time.now if owner.big_buyer?
    self.save
  end

  def reject!
    self.destroy
  end
end