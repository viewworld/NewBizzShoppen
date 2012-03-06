class Suppliers::BulkLeadShareByEmailController < Suppliers::BasicSupplierController
  def new
    leads                   = current_user.lead_purchases.where(:id => params[:lead_purchase_ids]).includes(:lead).map(&:lead)
    @email_template_preview = EmailTemplatePreview.new(:share_leads_by_email_message, {:leads => leads, :country => Country.get_country_from_locale})
  end

  def create
    @email_template_preview = EmailTemplatePreview.new(:share_leads_by_email_message)
    params[:email_template_preview].tap do |email_params|
      TemplateMailer.new(email_params[:recipients], :blank_template, Country.get_country_from_locale,
                                       {:subject_content => email_params[:subject], :body_content => email_params[:body],
                                        :bcc_recipients => @email_template_preview.bcc, :cc_recipients => @email_template_preview.cc,
                                        :sender_id => user_signed_in? ? current_user.id : nil, :email_template_uniq_id => "share_leads_by_email_message",
                                        :email_template_id => @email_template_preview.email_template_id}).deliver!
    end
    flash[:notice] = I18n.t("flash.bulk_lead_share_by_email.create.notice")
    redirect_to suppliers_lead_purchases_path
  end
end