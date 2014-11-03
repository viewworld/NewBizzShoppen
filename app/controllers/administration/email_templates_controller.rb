class Administration::EmailTemplatesController < Administration::AdministrationController
  include Controllers::CommonActions
  include Controllers::EmailTemplatesActions

  set_tab 'settings'
  set_subtab 'email_templates'

  before_filter :set_referer, only: :edit
  before_filter :set_email_template, only: [:edit, :update]

  def index
    @email_templates = EmailTemplate.global.paginate(show_all: params[:show_all], page: params[:page], per_page: EmailTemplate.per_page)
  end

  def update
    @email_template.assign_attributes(email_template_params)

    common_save(@email_template, success: { redirect: session[:articles_referer] || administration_email_templates_path })
  end

  private

  def set_email_template
    @email_template = EmailTemplate.find(params[:id])
    @email_template.enable_custom_signature = @email_template.email_template_signature.present?
    @email_template
  end

  def email_template_params
    params.require(:email_template).permit(:subject, :from, :bcc, :cc, :body,
      :enable_custom_signature, email_template_signature_attributes: [:body, :_destroy, :id])
  end

  def set_referer
    session[:articles_referer] = request.referer
  end
end
