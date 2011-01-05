class ::User::CallCentreAgent < ::User
  ROLES = [:call_centre_agent]

  include User::CommonAgent
end