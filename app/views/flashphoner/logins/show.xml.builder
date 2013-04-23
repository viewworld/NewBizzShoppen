xml.instruct! :xml, :version => "1.0"
if @user and @user.phone_enabled?
  xml.root :registered => "True",
           :login => @user.sip_username,
           :authenticationName => @user.sip_authentication_name || @user.sip_username,
           :password => @user.sip_password,
           :domain => @user.sip_domain,
           :outboundProxy => @user.sip_outbound_proxy || @user.sip_domain,
           :port => @user.sip_port || 5060,
           :visibleName => @user.full_name
else
  xml.root :registered => "False"
end
