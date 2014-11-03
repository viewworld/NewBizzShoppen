class Administration::EmailTemplateSignaturesController < Administration::AdministrationController
  include Controllers::CommonActions

  set_tab 'settings'
  set_subtab 'email_template_signatures'

  before_filter :set_email_collection, only: [:edit, :new]
  before_filter :set_email_template_signature, only: [:edit, :update, :destroy]

  def index
    @email_template_signatures = EmailTemplateSignature.custom.paginate(show_all: params[:show_all], page: params[:page])
  end

  def new
    @email_template_signature = EmailTemplateSignature.new
  end

  def create
    @email_template_signature = EmailTemplateSignature.new(email_template_signature_params)

    common_save(@email_template_signature, success: { redirect: administration_email_template_signatures_path })
  end

  def update
    @email_template_signature.assign_attributes(email_template_signature_params)

    common_save(@email_template_signature, success: { redirect: administration_email_template_signatures_path })
  end

  def destroy
    common_destroy(@email_template_signature, success: { redirect: administration_email_template_signatures_path })
  end

  private

  def set_email_collection
    @emails = EmailTemplateSignature::FROM_EMAILS.map { |e| [e, e] }
  end

  def set_email_template_signature
    @email_template_signature = EmailTemplateSignature.find(params[:id])
  end

  def email_template_signature_params
    params.require(:email_template_signature).permit(:name, :email_from, :body)
  end
end
