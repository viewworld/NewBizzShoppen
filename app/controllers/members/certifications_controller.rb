class Members::CertificationsController < Members::MemberController
  before_filter :map_lead_to_tender

  set_tab "tenders"
  include ::Controllers::LeadCertificationActions

  def model_name
   "tenders"
  end

  private

  def map_lead_to_tender
    params[:lead_id] = params[:tender_id]
  end

end