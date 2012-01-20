class LeadUsers::LeadEmailsController < LeadUsers::LeadUserController

  def new
    lead_purchase           = LeadPurchase.with_assignee(current_user.id).where(:id => params[:lead_purchase_id]).first
    lead                    = lead_purchase.lead
    @email_template_preview = EmailTemplatePreview.new(:contact_lead_by_email_message, {:lead => lead, :lead_purchase => lead_purchase})
    @email_template_preview.recipients = lead.email_address
  end

  def create
    params[:email_template_preview].tap do |email_params|
      TemplateMailer.delay(:queue => 'emails').new(email_params[:recipients], :blank_template, Country.get_country_from_locale,
                                       {:subject_content => email_params[:subject], :body_content => email_params[:body],
                                        :reply_to => current_user.email, :sender_id => user_signed_in? ? current_user.id : nil,
                                        :email_template_uniq_id => "contact_lead_by_email_message"})
    end
    flash[:notice] = I18n.t("flash.contact_lead_by_email.create.notice")
    redirect_to lead_users_lead_purchases_path
  end

end