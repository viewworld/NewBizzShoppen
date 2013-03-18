class Callers::CommunicationController < Callers::CallerController

  def show
    @communications = Communication.for_user(current_user.call_centre? ? current_user.subaccount_ids+[current_user.id] : current_user.id).descending_by_created_at.paginate(:show_all => params[:show_all], :page => params[:page], :per_page => 20)
  end

end