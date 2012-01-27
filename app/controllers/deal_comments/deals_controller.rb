class DealComments::DealsController < ApplicationController
  respond_to :js

  before_filter :fetch_deal

  private

  def fetch_deal
    @deal = Deal.find(params[:id])
  end

  public

  def show
    respond_with @threads = @deal.comment_threads.roots.order("created_at DESC")
  end
end