class ShareDealByEmailController < ApplicationController

  def create
    @deal = Deal.find(params[:deal_id])
    @email_preview = ShareDealTemplatePreview.new('share_deal_by_email', params[:email_from], {:description => params[:body], :name => params[:name], :deal_url => deal_url(:id => @deal.slug), :country => Country.get_country_from_locale})
    if @email_preview.valid?
      flash[:notice] = I18n.t("share_deal_by_email.create.flash.email_sent")
      ApplicationMailer.delay.generic_email([params[:email_to]], @email_preview.subject, @email_preview.body, nil, [], @email_preview.cc, @email_preview.bcc, @email_preview.email_from)
    end
    redirect_to :back
  end
end