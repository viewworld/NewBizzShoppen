class Buyers::BulkLeadShareByEmailController < Buyers::BuyerController
  def new
    leads                   = current_user.lead_purchases.where(:id => params[:lead_purchase_ids]).includes(:lead).map(&:lead)
    @email_template_preview = EmailTemplatePreview.new(:share_leads_by_email_message, {:leads => leads})
  end

  def create
    params[:email_template_preview].tap do |email_params|
      ApplicationMailer.deliver_generic_email(email_params[:recipients], email_params[:subject], email_params[:body])
    end
    flash[:notice] = I18n.t("flash.bulk_lead_share_by_email.actions.create.notice")
    redirect_to buyers_lead_purchases_path
  end
end