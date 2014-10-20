class CallCentreAgents::CertificationsController < CallCentreAgents::CallCentreAgentController
  set_tab "created_leads"
  include ::Controllers::LeadCertificationActions

  def model_name
   "leads"
  end

end