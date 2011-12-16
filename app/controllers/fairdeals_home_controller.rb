class FairdealsHomeController < ApplicationController

  respond_to :html, :js

  set_tab "home"

  before_filter :fetch_common_data

  private

  def fetch_common_data
    @news = Article::News::Member.published.latest.limit(3)
    @email_deal_request_preview = DealRequestTemplatePreview.new(:blank_template, {}, current_user)
  end

  public

  def show
    @featured_deals = FeaturedDeal.with_active_deals(Date.today)
    @primary_deal = Deal.where(:id => params[:id]).first || @featured_deals[0]
  end

  def cycle
    @featured_deals = FeaturedDeal.with_active_deals(Date.today)
    @primary_deal = Deal.where(:id => params[:id]).first || @featured_deals[0]
  end

  def index
    @per_page = 3
    @deals = Deal.without_inactive.order("end_date ASC")
    @last_page = (@deals.count.to_f / @per_page).ceil

    @deals = if request.xhr?
      @deals.paginate(:page => params[:page], :per_page => @per_page)
    else
      @deals.first(15)
    end
    respond_with @deals
  end

end
