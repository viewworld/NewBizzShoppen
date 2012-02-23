class NotificationsController < SecuredController
  respond_to :json, :html

  def index
    respond_to do |wants|
      wants.html {
        @notifications = current_user.with_role.notifications.order("id ASC").paginate(:page => params[:page], :per_page => 20)
      }
      wants.json {
        render :text => current_user.with_role.notifications.pending.order("id ASC").limit(params[:per_page]).to_json
      }
    end
  end

  def update
    @notification = current_user.with_role.notifications.find(params[:id])
    respond_with(@notification.update_attribute(:dismissed_at, Time.now))
  end

end