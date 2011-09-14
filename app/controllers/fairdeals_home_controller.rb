class FairdealsHomeController < ApplicationController

  set_tab "home"

  def show
    @primary_deal = Deal.where(:id => params[:id]).first || FeaturedDeal.primary
    @news = Article::News::PurchaseManager.published.latest.limit(3)
    @email_deal_request_preview = CategoryRequestTemplatePreview.new(:blank_template, {}, current_user)
  end

end
