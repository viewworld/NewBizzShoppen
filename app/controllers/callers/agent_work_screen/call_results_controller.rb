class Callers::AgentWorkScreen::CallResultsController < Callers::AgentWorkScreenController

  inherit_resources

  before_filter :set_result, :only => :new
  before_filter :set_call_result, :only => [:edit, :update, :destroy]
  before_filter :set_category, :only => [:new, :edit]


  def new
    @call_result = CallResult.new
    @call_result.result = @result
    @call_result.contact = @contact
    @call_result.contact.strict_validate = true
    @contact.published = true
  end

  def create
    if params[:call_result][:contact_attributes].present?
      @contact.strict_validate = true
      attributes = params[:call_result].delete(:contact_attributes)
      @contact.attributes = attributes
      @contact.published = true unless attributes[:published].to_i.zero?
      @contact.save
    end
    @call_result = CallResult.new(params[:call_result].merge(:current_user => current_user))
    @call_result.creator = current_user
    @call_result.contact = @contact
    create! do |success, failure|
      success.js { }
      failure.js { render 'new' }
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
    #final = @contact.current_call_result.result.final?
    #@contact.update_attribute(:completed, final) if @contact.completed != final
    update! do |success, failure|
      success.js { }
      failure.js { render 'edit' }
    end
  end

  def destroy
    destroy! do |success, failure|
      success.js {
        set_locals
        add_completed_to_locals
        add_pending_to_locals
      }
      failure.js {}
    end
  end


  private
  def set_contact
    @lead = @contact = @campaign.contacts.find(params[:contact_id])
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
    category = LeadCategory.find_by_id(params[:category_id])
    @contact.update_attribute(:category, category) if category
  end

end
