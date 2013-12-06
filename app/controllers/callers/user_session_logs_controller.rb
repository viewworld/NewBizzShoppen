class Callers::UserSessionLogsController < Callers::CallerController
  inherit_resources

  before_filter :prepare_default_params, :only => [:index]

  set_tab 'reports'
  set_subtab 'user_session_logs'

  def collection
    @search = UserSessionLog.scoped_search(params[:search])
    @user_session_logs = @search.order("created_at DESC")
    @user_session_logs_paginated = @user_session_logs.paginate(:page => params[:page], :per_page => 30, :show_all => params[:show_all])
  end

  private

  def prepare_default_params
    picker_format = "%d-%m-%Y %H:%M"

    @filters = ActiveSupport::OrderedHash.new
    @filters[:today] = callers_user_session_logs_path(
      :search => {
        :with_time_from => Time.now.beginning_of_day.strftime(picker_format),
        :with_time_to => Time.now.end_of_day.strftime(picker_format)
      },
      :skip_defaults => '1'
    )
    @filters[:yesterday] = callers_user_session_logs_path(
      :search => {
        :with_time_from => Date.yesterday.beginning_of_day.strftime(picker_format),
        :with_time_to => Date.yesterday.end_of_day.strftime(picker_format)
      },
      :skip_defaults => '1'
    )
    @filters[:this_week] = callers_user_session_logs_path(
      :search => {
        :with_time_from => Time.now.beginning_of_week.strftime(picker_format),
        :with_time_to => Time.now.end_of_week.strftime(picker_format)
      },
      :skip_defaults => '1'
    )
    @filters[:this_month] = callers_user_session_logs_path(
      :search => {
        :with_time_from => Time.now.beginning_of_month.strftime(picker_format),
        :with_time_to => Time.now.end_of_month.strftime(picker_format)
      },
      :skip_defaults => '1'
    )

    params[:search] = {} unless params[:search].present?

    if params[:skip_defaults] != '1'
      params[:search] = @filters[:today][:search]
    end

    params[:search][:with_hours] = '1'
  end


end


