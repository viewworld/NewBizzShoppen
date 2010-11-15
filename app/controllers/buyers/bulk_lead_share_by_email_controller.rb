class Buyers::BulkLeadShareByEmailController < Buyers::BuyerController

  def new
    leads                   = current_user.lead_purchases.where(:id => params[:lead_purchase_ids]).includes(:lead).map(&:lead)
    @email_template_preview = EmailTemplatePreview.new(:share_leads_by_email_message, {:leads => leads})
  end

  def create

  end
end