class Administration::HomeController < ApplicationController

  set_tab "home"

  def show
    @campaigns = Campaign.available_for_user(current_user).with_state("active")
    params[:date_from] ||= Date.today
    params[:date_to] ||= Date.today
    params[:currency_id] ||= Currency.active.first.id
    @performance_campaigns = Campaign.active_between(params[:date_from], params[:date_to]).available_for_user(current_user)
    @agents = User.select("DISTINCT(users.*)").joins(:user_session_logs).where(:user_session_logs => { :campaign_id => @performance_campaigns, :end_date => params[:date_from]..params[:date_to] })
  end

end