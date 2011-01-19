class ::User::CallCentreAgent < ::User
  ROLES = [:call_centre_agent]

  include User::CommonAgent

  def can_publish_leads?
    true
  end
end