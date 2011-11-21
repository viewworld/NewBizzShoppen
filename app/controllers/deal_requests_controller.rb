class DealRequestsController < ApplicationController

  def create
    @email_preview = DealRequestTemplatePreview.new('deal_request_for_deal_admin', params[:email_deal_request_preview], current_user, {:country => Country.get_country_from_locale})
    if @email_preview.valid?
      flash[:notice] = I18n.t("deal_requests.create.flash.email_sent")
      TemplateMailer.delay.new(Settings.default_deal_admin_email, :blank_template, Country.get_country_from_locale,
                                       {:subject_content => @email_preview.subject, :body_content => @email_preview.body,
                                        :bcc_recipients => @email_preview.bcc, :cc_recipients => @email_preview.cc,
                                        :reply_to => @email_preview.email_from, :sender_id => User.get_current_user_id,
                                        :email_template_uniq_id => "deal_request_for_deal_admin"})
    end
    redirect_to :back
  end
end