class LeadUsers::LeadEmailsController < LeadUsers::LeadUserController

  def new
    lead_purchase           = LeadPurchase.with_assignee(current_user.id).where(:id => params[:lead_purchase_id]).first
    lead                    = lead_purchase.lead
    @email_template_preview = EmailTemplatePreview.new(:contact_lead_by_email_message, {:lead => lead, :lead_purchase => lead_purchase})
    @email_template_preview.recipients = lead.email_address
  end

  def create
    params[:email_template_preview].tap do |email_params|
      ApplicationMailer.generic_email(email_params[:recipients], email_params[:subject], email_params[:body]).deliver
    end
    flash[:notice] = I18n.t("flash.contact_lead_by_email.create.notice")
    redirect_to lead_users_lead_purchases_path
  end

end