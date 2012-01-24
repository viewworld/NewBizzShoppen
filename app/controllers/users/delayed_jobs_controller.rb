class Users::DelayedJobsController < SecuredController

  def index
    @delayed_jobs = current_user.delayed_jobs.paginate(:page => params[:page], :per_page => 20)
  end

end