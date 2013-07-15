class DealRequestsController < ApplicationController

  def create
    @email_preview = DealRequestTemplatePreview.new('deal_request_for_deal_admin', params[:email_deal_request_preview], current_user, {:country => Country.get_country_from_locale})
    @captcha = verify_recaptcha(:message => t("share_deal_by_email.create.flash.invalid_captcha"))
    if @email_preview.valid? and @captcha
      flash[:notice] = I18n.t("deal_requests.create.flash.email_sent")
      TemplateMailer.new(Settings.default_deal_admin_email, :blank_template, Country.get_country_from_locale,
                                       {:subject_content => @email_preview.subject, :body_content => @email_preview.body,
                                        :bcc_recipients => @email_preview.bcc, :cc_recipients => @email_preview.cc,
                                        :reply_to => @email_preview.email_from, :sender_id => user_signed_in? ? current_user.id : nil,
                                        :email_template_uniq_id => "deal_request_for_deal_admin", :email_template_id => @email_preview.email_template_id}).deliver!
    end
  end
end