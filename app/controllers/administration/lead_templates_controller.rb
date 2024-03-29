class Administration::LeadTemplatesController < Administration::AdministrationController
  inherit_resources
  actions :all, :except => [:index, :show]
  set_tab "browse_leads"

  def new
    @lead_template = LeadTemplate.new(:category_id => params[:category_id].blank? ? params[:lead_template][:category_id] : params[:category_id])
    @lead_template.duplicate_fields(LeadTemplate.find_by_id(params[:template_id]))
  end

  def create
    @lead_template = LeadTemplate.new(:current_user => current_user, :creator => current_user)
    @lead_template.attributes = params[:lead_template]

    create! do |success, failure|
      success.html { redirect_to edit_administration_category_path(@lead_template.category) }
      failure.html { render 'new' }
    end
  end

  def update
    @lead_template = LeadTemplate.find(params[:id])
    @lead_template.current_user = current_user

    update! do |success, failure|
      success.html { redirect_to edit_administration_category_path(@lead_template.category) }
      failure.html { render 'edit' }
    end
  end

  def destroy
    @lead_template = LeadTemplate.find(params[:id])
    @lead_template.current_user = current_user

    if @lead_template.destroy
      flash[:notice] = I18n.t("administration.lead_templates.destroy.flash.deletion_successful")
    else
      flash[:notice] = I18n.t("administration.lead_templates.destroy.flash.deletion_failure")
    end
    redirect_to :back
  end
end