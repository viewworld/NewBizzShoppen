class DealsController < ApplicationController
  inherit_resources
  actions :index, :show
  set_tab "browse_leads"

  def collection
    @search = Deal.scoped_search(params[:search])
    @category = Category.find_by_id(@search.with_category)
    @deals = @search.paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
  end
end