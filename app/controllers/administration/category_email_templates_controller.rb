class Administration::CategoryEmailTemplatesController < Administration::AdministrationController
  set_tab "browse_leads"

  before_filter :set_category, only: [:edit, :update]

  def edit
    @email_template = @category.email_template || duplicate_global_email_template
  end

  def update
    if @category.email_template.update_attributes(params[:email_template])
      redirect_to categories_path, notice: t('administration.category_email_templates.update.controller.successful_update_notice')
    else
      render :edit
    end
  end

  private
  def set_category
    @category = LeadCategory.find(params[:id])
  end

  def duplicate_global_email_template
    global_template = EmailTemplate.global.where(uniq_id: 'bought_lead_notification').first

    @category.create_email_template(
      subject: global_template.subject,
      body: global_template.body,
      from: global_template.from,
      uniq_id: global_template.uniq_id
    )
  end
end
