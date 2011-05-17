class Agents::CertificationsController < Agents::AgentController
  set_tab "created_leads"
  include ::LeadCertificationActions

end
