class CallCentres::BulkCallCentreAgentsUpdateController < CallCentres::CallCentreController
  def update
    @users = User::CallCentreAgent.where(parent_id: current_user.id, id: params[:call_centre_agent_ids])

    if params[:bulk_action_type] == 'lock'
      @users.each(&:lock!)
    elsif params[:bulK_action_type] == 'unlock'
      @users.update_all(locked_at: nil)
    end

    redirect_to call_centres_call_centre_agents_path, notice: t("flash.bulk_call_centre_agents_update.update.notice")
  end
end
