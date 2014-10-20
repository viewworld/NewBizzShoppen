class Agents::CertificationsController < Agents::AgentController
  set_tab "created_leads"
  include ::Controllers::LeadCertificationActions

  def model_name
   "leads"
  end

end
