class ::User::LeadBuyer < ::User
  before_create :set_role

  def set_role
    self.roles = [:lead_buyer, :lead_user]
  end
end