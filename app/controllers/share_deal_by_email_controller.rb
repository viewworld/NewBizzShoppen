class ShareDealByEmailController < ApplicationController

  def create
    @deal = Deal.find(params[:deal_id])
    @email_preview = ShareDealTemplatePreview.new('share_deal_by_email', params[:email_from], {:name => params[:name], :deal_url => deal_url(:id => @deal.slug), :country => Country.get_country_from_locale})
    @captcha = verify_recaptcha(:message => t("share_deal_by_email.create.flash.invalid_captcha"))
    #redirect_to :back
  end

  def new
    @deal = Deal.find(params[:deal_id])
    render :action => :new, :layout => false
  end
end