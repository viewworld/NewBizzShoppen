class Buyers::LeadEmailsController < Buyers::BuyerController

  def new
    lead_purchase           = current_user.lead_purchases.where(:id => params[:lead_purchase_id]).first
    lead                    = lead_purchase.lead
    @email_template_preview = EmailTemplatePreview.new(:contact_lead_by_email_message, {:lead => lead, :lead_purchase => lead_purchase})
    @email_template_preview.recipients = lead.email_address
  end

  def create
    params[:email_template_preview].tap do |email_params|
      ApplicationMailer.generic_email(email_params[:recipients], email_params[:subject], email_params[:body]).deliver
    end
    flash[:notice] = I18n.t("flash.contact_lead_by_email.create.notice")
    redirect_to buyers_lead_purchases_path
  end

end