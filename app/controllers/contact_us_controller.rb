class ContactUsController < ApplicationController

  def new
    @email_template_preview = ContactUsTemplatePreview.new(:contact_us, user_signed_in? ? current_user.email : "")
  end

  def create
    params[:email_template_preview].tap do |email_params|
      @email_template_preview = ContactUsTemplatePreview.new(:contact_us, email_params[:email_from])
      @email_template_preview.subject = email_params[:subject]
      @email_template_preview.body = email_params[:body]
    end

      if @email_template_preview.valid?
        flash[:notice] = I18n.t("contact_us.create.flash.email_sent_successfully")
        params[:email_template_preview].tap do |email_params|
          TemplateMailer.new(Settings.contact_us_email, :blank_template, Country.get_country_from_locale,
                                       {:subject_content => email_params[:subject], :body_content => email_params[:body],
                                        :bcc_recipients => @email_template_preview.bcc, :cc_recipients => @email_template_preview.cc,
                                        :reply_to => email_params[:email_from], :sender_id => user_signed_in? ? current_user.id : nil, :email_template_uniq_id => "contact_us",
                                        :email_template_id => @email_template_preview.email_template_id}).deliver!
        end
        redirect_to root_path
      else
        render :action => 'new'
      end

  end
end
