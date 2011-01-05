class ::User::LeadUser < ::User
  ROLES = [:lead_user]

  include User::Subaccounts

  has_many :lead_requests,
           :foreign_key => :requested_by,
           :after_add => :set_owner

  has_many :lead_purchases,
           :foreign_key => :assignee_id,
           :conditions => "accessible_from IS NOT NULL",
           :include => :lead

  private

  def set_owner(lead_request)
    lead_request.update_attribute(:owner_id, parent_id || id)
  end

end
