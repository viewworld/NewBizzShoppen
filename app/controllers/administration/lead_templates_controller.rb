class Administration::LeadTemplatesController < Administration::AdministrationController
  set_tab 'browse_leads'

  before_filter :set_lead_template, only: [:edit, :update, :destroy]

  def new
    @lead_template = LeadTemplate.new(category_id: params[:category_id] || params[:lead_template][:category_id]).decorate
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
    @lead_template.current_user = current_user

    if @lead_template.update_attributes(params[:lead_template])
      redirect_to edit_administration_category_path(@lead_template.category)
    else
      render :edit
    end
  end

  def destroy
    @lead_template.current_user = current_user

    notice_key = @lead_template.destroy ? :deletion_successful : :deletion_failure
    redirect_to :back, notice: t(notice_key, scope: 'administration.lead_templates.destroy.flash')
  end

  private
  def set_lead_template
    @lead_template = LeadTemplate.find(params[:id]).decorate
  end
end
