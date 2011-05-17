class CallCentreAgents::CertificationsController < CallCentreAgents::CallCentreAgentController
  set_tab "created_leads"
  include ::LeadCertificationActions

end