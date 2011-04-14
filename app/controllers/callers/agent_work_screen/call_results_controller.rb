class Callers::AgentWorkScreen::CallResultsController < Callers::AgentWorkScreenController

  inherit_resources
  layout "help_popup"

  before_filter :set_result, :only => :new
  before_filter :set_call_result, :only => [:edit, :update, :destroy]
  before_filter :set_category, :only => [:new, :edit]  


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
    @call_result.creator = current_user
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
      success.js { set_locals }
      failure.html {}
    end    
  end


  private
  def set_contact
    @lead = @contact = @agent.contacts.find(params[:contact_id])
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
  
  def set_category
    category = Category.find_by_id(params[:category_id])
    @contact.update_attribute(:category, category) if category
  end

end
