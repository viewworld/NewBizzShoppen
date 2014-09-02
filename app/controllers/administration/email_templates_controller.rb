class Administration::EmailTemplatesController < Administration::AdministrationController
  include EmailTemplatesActions

  set_tab "settings"
  set_subtab "email_templates"

  before_filter :set_referer, only: :edit
  before_filter :set_email_template, only: [:edit, :update]

  def index
    @email_templates = EmailTemplate.global.paginate(show_all: params[:show_all], page: params[:page], per_page: EmailTemplate.per_page)
  end

  def update
    if @email_template.update_attributes(params[:email_template])
      redirect_to session[:articles_referer] || administration_email_templates_path
    else
      render :edit
    end
  end

  private
  def set_email_template
    @email_template = EmailTemplate.find(params[:id])
    @email_template.enable_custom_signature = @email_template.email_template_signature.present?
    @email_template
  end

  def set_referer
    session[:articles_referer] = request.referer
  end
end
