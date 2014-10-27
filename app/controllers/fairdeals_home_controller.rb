class FairdealsHomeController < ApplicationController

  respond_to :html, :js

  set_tab "home"

  before_filter :fetch_common_data

  def show
    @featured_deals = FeaturedDeal.with_active_deals(Date.today).with_locale.where(:domain_id => domain)
    @primary_deal = Deal.where(:id => params[:id]).first || @featured_deals.first
  end

  def index
    @per_page = 3
    @deals = Deal.without_inactive.published_only.order("end_date ASC").with_locale
    @last_page = (@deals.count.to_f / @per_page).ceil

    @deals = if request.xhr?
      @deals.paginate(:show_all => params[:show_all], :page => params[:page], :per_page => @per_page)
    else
      @deals.first(15)
    end
    respond_with @deals
  end

  private

  def domain
    @domain ||= Domain.find_by_site_and_locale(session[:site], session[:locale_code])
  end

  def fetch_common_data
    @news = Article::News::Member.published.latest.limit(3)
  end
end
