class CallCentres::CallCentreAgentsController < CallCentres::CallCentreController

  set_tab "call_centre_agents"

  def index

  end

  def new
    @call_centre_agent = User::CallCentreAgent.new
  end

  def create
    @call_centre_agent = User::CallCentreAgent.new(params[:user_call_centre_agent])
    @call_centre_agent.parent_id = current_user.id
    if @call_centre_agent.save
      flash[:notice] = t("call_centre.call_centre_agents.create.flash.call_centre_agent_creation_successful")
      redirect_to call_centres_call_centre_agents_path
    else
      render :action => 'new'
    end
  end
end