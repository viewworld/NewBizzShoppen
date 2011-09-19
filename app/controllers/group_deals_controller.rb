class GroupDealsController < ApplicationController

  def show
    @current_deal = Deal.group_deals.find(params[:id])
    @deal = if params[:previous]
      @current_deal.previous_group_deal
    elsif params[:next]
      @current_deal.next_group_deal
    else
      @current_deal
    end

    respond_to do |format|
      format.html {redirect_to root_path(:id => @deal)}
      format.js {}
    end
  end

end