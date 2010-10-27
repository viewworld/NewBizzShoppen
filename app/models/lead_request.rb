class LeadRequest < ActiveRecord::Base
  set_table_name "lead_purchases"
  default_scope where("requested_by IS NOT NULL")

  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"

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