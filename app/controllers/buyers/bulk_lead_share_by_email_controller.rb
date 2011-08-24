class Buyers::BulkLeadShareByEmailController < Buyers::BuyerController
  def new
    leads                   = current_user.lead_purchases.where(:id => params[:lead_purchase_ids]).includes(:lead).map(&:lead)
    @email_template_preview = EmailTemplatePreview.new(:share_leads_by_email_message, {:leads => leads, :country => Country.get_country_from_locale})
  end

  def create
    @email_template_preview = EmailTemplatePreview.new(:share_leads_by_email_message)
    params[:email_template_preview].tap do |email_params|
      ApplicationMailer.delay.generic_email(email_params[:recipients], email_params[:subject], email_params[:body], nil, [], @email_template_preview.cc, @email_template_preview.bcc)
    end
    flash[:notice] = I18n.t("flash.bulk_lead_share_by_email.create.notice")
    redirect_to buyers_lead_purchases_path
  end
end