class Members::LeadTemplatesController < Members::MemberController
  inherit_resources

  set_tab "lead_templates"

  def new
    @lead_template = LeadTemplate.new(:current_user => current_user, :creator => current_user, :category_id => params[:lead_template].blank? ? nil : params[:lead_template][:category_id])
    @lead_template.duplicate_fields(LeadTemplate.with_creator(current_user.id).find_by_id(params[:template_id]))
  end

  def create
    @lead_template = LeadTemplate.new(:current_user => current_user, :creator => current_user)
    @lead_template.attributes = params[:lead_template]

    create! do |success, failure|
      success.html { redirect_to purchase_managers_lead_templates_path }
      failure.html { render 'new' }
    end
  end

  def update
    @lead_template = LeadTemplate.find(params[:id])
    @lead_template.current_user = current_user
    if current_user != @lead_template.creator
      params[:lead_template].delete(:lead_template_fields_attributes)
    end

    update! do |success, failure|
      success.html { redirect_to purchase_managers_lead_templates_path }
      failure.html { render 'edit' }
    end
  end

  def destroy
    @lead_template = LeadTemplate.find(params[:id])
    @lead_template.current_user = current_user

    if @lead_template.destroy
      flash[:notice] = I18n.t("member.lead_templates.destroy.flash.deletion_successful")
    else
      flash[:notice] = I18n.t("member.lead_templates.destroy.flash.deletion_failure")
    end
    redirect_to :back
  end

  protected

  def collection
    params[:search]||={}
    params[:search][:with_creator] = current_user.id

    @search = LeadTemplate.scoped_search(params[:search])
    @lead_templates = @search.paginate(:page => params[:page], :per_page => LeadTemplate.per_page)
    @categories = LeadCategory.without_locked.with_agent_unique(current_user).map { |c| [c.name.to_s, c.id] }.sort
  end
end