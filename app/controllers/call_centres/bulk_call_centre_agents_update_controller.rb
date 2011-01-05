class CallCentres::BulkCallCentreAgentsUpdateController < CallCentres::CallCentreController

  def update
    User::CallCentreAgent.where({:parent_id => current_user.id}).where("id in (?)", params[:call_centre_agent_ids]).each do |user|
      user.locked = params[:locked]
      user.save
    end
    flash[:notice] = I18n.t("flash.bulk_call_centre_agents_update.update.notice")
    redirect_to call_centres_call_centre_agents_path
  end

end