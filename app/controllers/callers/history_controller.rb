class Callers::HistoryController < Callers::CallerController

  def show
    @history = CallResult.order("created_at DESC").where(:creator_id => current_user.call_centre? ? current_user.subaccount_ids+[current_user.id] : current_user.id).paginate(:page => params[:page], :per_page => 20)
  end

end