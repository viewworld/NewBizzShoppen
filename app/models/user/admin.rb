class ::User::Admin < ::User
  ROLES = [:admin]

  include Addresses

  def can_publish_leads?
    true
  end
end