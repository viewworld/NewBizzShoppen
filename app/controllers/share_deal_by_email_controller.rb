class ShareDealByEmailController < ApplicationController

  def create
    @deal = Deal.find(params[:deal_id])
    @email_preview = ShareDealTemplatePreview.new('share_deal_by_email', params[:email_from], {:description => params[:body], :name => params[:name], :deal_url => deal_url(:id => @deal.slug), :country => Country.get_country_from_locale})
    if @email_preview.valid?
      flash[:notice] = I18n.t("share_deal_by_email.create.flash.email_sent")
      TemplateMailer.delay.new(params[:email_to], :blank_template, Country.get_country_from_locale,
                                       {:subject_content => @email_preview.subject, :body_content => @email_preview.body,
                                        :bcc_recipients => @email_preview.bcc, :cc_recipients => @email_preview.cc, :reply_to => @email_preview.email_from,
                                        :sender_id => User.get_current_user_id})
    end
    redirect_to :back
  end
end