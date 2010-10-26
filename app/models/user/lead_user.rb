class ::User::LeadUser < ::User
  ROLES = [:lead_user]

  has_many :lead_requests, :foreign_key => :requested_by, :after_add => :set_owner

  private

  def set_owner(lead_request)
    lead_request.update_attribute(:owner_id, parent_id || id)
  end

end
