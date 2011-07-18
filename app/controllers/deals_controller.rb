class DealsController < ApplicationController
  inherit_resources
  actions :index, :show
  set_tab "browse_leads"

  def collection
    @search = Deal.scoped_search(params[:search])
    @category = Category.find_by_id(@search.with_category)
    @deals = @search.paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
  end

  def rate
    @deal = Deal.find(params[:id])
    @deal.rate(params[:stars], current_user, params[:dimension])
    render :update do |page|
      page.replace_html @deal.wrapper_dom_id(params), ratings_for(@deal, params.merge(:wrap => false))
      page.visual_effect :highlight, @deal.wrapper_dom_id(params)
    end
  end
end