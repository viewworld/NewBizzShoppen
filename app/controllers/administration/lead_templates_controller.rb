class Administration::LeadTemplatesController < Administration::AdministrationController
  set_tab "browse_leads"

  def new
    @lead_template = LeadTemplate.new(category_id: params[:category_id] || params[:lead_template][:category_id])
    @lead_template.duplicate_fields(LeadTemplate.find_by_id(params[:template_id]))
  end

  def create
    @lead_template = LeadTemplate.new(params[:lead_template])
    @lead_template.creator = current_user
    @lead_template.current_user = current_user

    if @lead_template.save
      redirect_to edit_administration_category_path(@lead_template.category)
    else
      render :new
    end
  end

  def update
    @lead_template = LeadTemplate.find(params[:id])
    @lead_template.current_user = current_user

    if @lead_template.update_attributes(params[:lead_template])
      redirect_to edit_administration_category_path(@lead_template.category)
    else
      render :edit
    end
  end

  def destroy
    @lead_template = LeadTemplate.find(params[:id])
    @lead_template.current_user = current_user

    if @lead_template.destroy
      redirect_to :back, notice:t("administration.lead_templates.destroy.flash.deletion_successful")
    else
      redirect_to :back, notice: t("administration.lead_templates.destroy.flash.deletion_failure")
    end
  end
end
