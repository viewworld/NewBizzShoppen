And /^an user with role (.+) and email (.+) belongs to call centre (.+)$/ do |role, agent_email, call_centre_email|
  call_centre = User::CallCentre.first(:conditions => { :email => call_centre_email })
  if call_centre.nil?
    call_centre = User::CallCentre.make!(:email => call_centre_email, :password => 'secret', :password_confirmation => 'secret')
  end

  sub_user = "User::#{role.camelize}".constantize.first(:conditions => { :email => agent_email })

  if sub_user.nil?
    sub_user = "User::#{role.camelize}".constantize.make!(:email => agent_email, :password => 'secret', :password_confirmation => 'secret', :parent_id => call_centre.id)
  else
    sub_user.update_attribute(:parent_id, call_centre.id)
  end
  sub_user.confirm!
end