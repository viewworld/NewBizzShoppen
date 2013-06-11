xml.instruct! :xml, :version => "1.0"
if @user and @user.phone_enabled?
  xml.root :registered => "True",
           :login => @user.sip_username,
           :authenticationName => @user.sip_authentication_name || @user.sip_username,
           :password => @user.sip_password,
           :domain => @user.softphone_server.sip_domain,
           :outboundProxy => @user.softphone_server.sip_domain,
           :port => @user.softphone_server.sip_port || 5060,
           :visibleName => @user.full_name
else
  xml.root :registered => "False"
end
