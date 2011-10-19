class FairdealsHomeController < ApplicationController

  set_tab "home"

  def show
    @featured_deals = FeaturedDeal.with_active_deals(Date.today)
    @primary_deal = Deal.where(:id => params[:id]).first || @featured_deals[0]
    @news = Article::News::Member.published.latest.limit(3)
    @email_deal_request_preview = DealRequestTemplatePreview.new(:blank_template, {}, current_user)
  end

end
