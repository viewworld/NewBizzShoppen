class ::User::Admin < ::User

  before_create :set_role

  def set_role
    self.roles = [:admin]
  end
end