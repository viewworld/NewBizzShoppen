xml.instruct! :xml, :version => "1.0"
xml.root do
  if @user and @user.phone_enabled?
    xml.registered "True"
    xml.login @user.sip_username
    xml.authenticationName (@user.sip_authentication_name || @user.sip_username)
    xml.password @user.sip_password
    xml.domain @user.sip_domain
    xml.outboundProxy (@user.sip_outbound_proxy || @user.sip_domain)
    xml.port @user.sip_port || 5060
    xml.visibleName @user.full_name
  else
    xml.registered "False"
  end
end