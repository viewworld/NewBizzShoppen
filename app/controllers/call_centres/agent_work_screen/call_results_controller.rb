class CallCentres::AgentWorkScreen::CallResultsController < CallCentres::AgentWorkScreenController

  inherit_resources
  layout "help_popup"

  before_filter :set_result, :only => :new
  before_filter :set_call_result, :only => [:edit, :update, :destroy]

  respond_to :js, :only => [:create, :update]


  def new
    @call_result = CallResult.new
    @call_result.result = @result
    @call_result.contact = @contact
    @call_result.contact.strict_validate = true
  end

  def create
    if params[:call_result][:contact_attributes].present?
      @contact.strict_validate = true
      @contact.update_attributes(params[:call_result].delete(:contact_attributes))
    end
    @call_result = CallResult.new(params[:call_result])
    @call_result.agent = current_user
    @call_result.contact = @contact
    create! do |success, failure|
      success.html { }
      failure.html { render 'new' }
    end
  end

  def edit
    @call_result.contact.strict_validate = true
  end

  def update
    if params[:call_result][:contact_attributes].present?
      @contact.strict_validate = true
      @contact.update_attributes(params[:call_result].delete(:contact_attributes))
    end
    @call_result.contact = @contact
    @call_result.attributes = params[:call_result]
    update! do |success, failure|
      success.html { }
      failure.html { render 'edit' }
    end
  end

  def destroy
    destroy! do |success, failure|
      success.html { redirect_to edit_call_centres_campaign_contact_path(@contact.campaign, @contact) }
      failure.html {}
    end    
  end


  private
  def set_contact
    @lead = @contact = @contacts.find(params[:contact_id])
  end

  def set_call_result
    @call_result = CallResult.find(params[:id])
  end

  def set_result
    @result = Result.find(params[:result_id])
  end

  def set_contact_managing
    @contact_managing = false
  end

end
