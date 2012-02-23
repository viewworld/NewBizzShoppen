class LeadTemplatesController < SecuredController

  before_filter :set_lead_and_category

  def new

  end

  def create
    @templates.each do |template|
      new_template = LeadTemplate.new(:category => @category, :creator => current_user)
      new_template.duplicate_fields(template, true, @lead)
      new_template.save
    end
  end

  def show
    render :file => "lead_templates/show", :layout => "help_popup"
  end

  private

  def set_lead_and_category
    if user_signed_in?
      @lead = current_user.leads.find(params[:lead_id])
      @category = LeadCategory.find(params[:category_id])
      @templates = @lead.lead_templates - LeadTemplate.with_category_and_its_ancestors(@category).where("is_active = ?", true)
    else
      raise CanCan::AccessDenied
    end
  end

end