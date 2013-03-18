class CallCentres::CallCentreAgentsController < CallCentres::CallCentreController

  set_tab "call_centre_agents"

  def index
    per_page = params[:per_page].blank? ? 25 : params[:per_page].to_i
    params[:search] ||= {}
    params[:search][:with_subaccounts] = current_user.id

    @search = User::CallCentreAgent.scoped_search(params[:search])
    @call_centre_agents = if per_page == 0
               @search.all
             else
               @search.paginate(:show_all => params[:show_all], :per_page => per_page, :page => params[:page])
             end
  end

  def new
    @call_centre_agent = User::CallCentreAgent.new
  end

  def create
    @call_centre_agent = User::CallCentreAgent.new(params[:user_call_centre_agent])
    @call_centre_agent.parent_id = current_user.id
    @call_centre_agent.skip_email_verification = params[:user_call_centre_agent][:skip_email_verification]
    if @call_centre_agent.save
      flash[:notice] = t("call_centre.call_centre_agents.create.flash.call_centre_agent_creation_successful")
      redirect_to call_centres_call_centre_agents_path
    else
      render :action => 'new'
    end
  end

  def edit
    @call_centre_agent = User::CallCentreAgent.find(params[:id])
  end

  def update
    @call_centre_agent = User::CallCentreAgent.find(params[:id])
    user_params = params["user_call_centre_agent".to_sym]
    if user_params and user_params[:locked]
      @call_centre_agent.locked = user_params[:locked]
    end
    if @call_centre_agent.update_attributes(user_params)
      flash[:notice] = I18n.t("call_centre.call_centre_agents.update.flash.call_centre_agent_update_successful")
      redirect_to call_centres_call_centre_agents_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @call_centre_agent = User::CallCentreAgent.find(params[:id])
    if @call_centre_agent.destroy
      flash[:notice] = I18n.t("call_centre.call_centre_agents.destroy.flash.call_centre_agent_deletion_successful")
    else
      flash[:notice] = I18n.t("call_centre.call_centre_agents.destroy.flash.call_centre_agent_deletion_failure")
    end
    redirect_to call_centres_call_centre_agents_path
  end
end