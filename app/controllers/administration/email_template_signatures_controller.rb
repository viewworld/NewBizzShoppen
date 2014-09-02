class Administration::EmailTemplateSignaturesController < Administration::AdministrationController
  set_tab "settings"
  set_subtab "email_template_signatures"

  before_filter :set_email_collection, only: [:edit, :new]
  before_filter :set_email_template_signature, only: [:edit, :update, :destroy]

  def index
    @email_template_signatures = EmailTemplateSignature.custom.paginate(show_all: params[:show_all], page: params[:page])
  end

  def new
    @email_template_signature = EmailTemplateSignature.new
  end

  def create
    @email_template_signature = EmailTemplateSignature.new(params[:email_template_signature])

    if @email_template_signature.save
      redirect_to administration_email_template_signatures_path
    else
      render :new
    end
  end

  def update
    if @email_template_signature.update_attributes(params[:email_template_signature])
      redirect_to administration_email_template_signatures_path
    else
      render :new
    end
  end

  def destroy
    @email_template_signature.destroy
    redirect_to administration_email_template_signatures_path
  end

  private
  def set_email_collection
    @emails = EmailTemplateSignature::FROM_EMAILS.map { |e| [e, e] }
  end

  def set_email_template_signature
    @email_template_signature = EmailTemplateSignature.find(params[:id])
  end
end
