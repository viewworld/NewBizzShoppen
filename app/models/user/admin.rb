class ::User::Admin < ::User
  ROLES = [:admin]

  def can_publish_leads?
    true
  end
end