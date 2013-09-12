module Callers::UserSessionLogsHelper

  def link_to_user_session_logs(additional_conditions={})
    callers_user_session_logs_path(
        :search => {
            :with_time_from => "#{params[:date_from] || Date.today} 00:00",
            :with_time_to => "#{params[:date_to] || Date.today} 23:59"
        }.merge(additional_conditions))
  end

  def campaign_link_to_user_session_logs(campaign)
    link_to_user_session_logs :for_campaign => campaign.id
  end

  def agent_link_to_user_session_logs(agent)
    link_to_user_session_logs :for_user => agent.id, :with_log_type => 0
  end

end
