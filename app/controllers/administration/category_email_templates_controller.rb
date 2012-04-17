class Administration::CategoryEmailTemplatesController < Administration::AdministrationController
  set_tab "browse_leads"

  before_filter :set_category, :only => [:edit, :update]

  def edit
    global_et = EmailTemplate.global.where(:uniq_id => 'bought_lead_notification').first
    @email_template = @category.email_template ? @category.email_template : @category.create_email_template(:subject => global_et.subject, :body => global_et.body, :from => global_et.from, :uniq_id => global_et.uniq_id)
  end

  def update
    @email_template = @category.email_template
    @email_template.update_attributes(params[:email_template])
    if @email_template.save
      flash[:notice] = t('administration.category_email_templates.update.controller.successful_update_notice')
      redirect_to categories_path
    else
      render :edit
    end
  end

  private

  def set_category
    @category = LeadCategory.find(params[:id])
  end


end
