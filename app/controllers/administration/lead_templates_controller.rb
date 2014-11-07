class Administration::LeadTemplatesController < Administration::AdministrationController
  include Controllers::CommonActions
  set_tab 'browse_leads'

  before_filter :set_lead_template, only: [:edit, :update, :destroy]

  def new
    @lead_template = LeadTemplate.new(category_id: params[:category_id] || params[:lead_template][:category_id]).decorate
    @lead_template.duplicate_fields(LeadTemplate.find_by_id(params[:template_id]))
  end

  def create
    @lead_template = LeadTemplate.new(lead_template_params)
    @lead_template.creator = current_user
    @lead_template.current_user = current_user

    common_save(@lead_template, success: {
      redirect: edit_administration_category_path(@lead_template.category)
    })
  end

  def update
    @lead_template.assign_attributes(lead_template_params)
    @lead_template.current_user = current_user

    common_save(@lead_template, success: {
      redirect: edit_administration_category_path(@lead_template.category)
    })
  end

  def destroy
    @lead_template.current_user = current_user

    common_destroy(@lead_template)
  end

  private

  def set_lead_template
    @lead_template = LeadTemplate.find(params[:id]).decorate
  end

  def lead_template_params
    params.require(:lead_template).permit(:name, :category_id, :is_global,
      :is_mandatory, :is_active, lead_template_fields_attributes:
      [:name, :field_type, :is_hidden, :is_mandatory, :_destroy, :id])
  end
end
