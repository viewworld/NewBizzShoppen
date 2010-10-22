class ::User::LeadUser < ::User

  before_create :set_role

  def set_role
    self.roles = [:lead_user]
  end
end