class Users::DelayedJobsController < SecuredController

  def index
    @delayed_jobs = current_user.delayed_jobs.paginate(:page => params[:page], :per_page => 20)
  end

  def delete_all
    current_user.delayed_jobs.destroy_all
    redirect_to users_delayed_jobs_path
  end

end