class Administration::Invoicing::MailingsController < Administration::AdministrationController
  before_filter :get_invoice

  def new
    @email_template_preview = EmailTemplatePreview.new(:invoice, {:invoice => @invoice})
    @email_template_preview.invoice_filename = @invoice.store_pdf(current_user).basename
  end

  def create
    @email_template_preview = EmailTemplatePreview.new(:invoice, {:invoice => @invoice})
    params[:email_template_preview].tap do |email_params|
      invoice_path = Pathname.new(File.join(::Rails.root.to_s,'public/html2pdf/invoice_cache',email_params[:invoice_filename]))
      ApplicationMailer.delay.generic_email(email_params[:recipients], email_params[:subject], email_params[:body], nil, Array(invoice_path), @email_template_preview.cc, @email_template_preview.bcc)
    end
    flash[:notice] = I18n.t("flash.bulk_lead_share_by_email.create.notice")
    redirect_to administration_invoicing_invoice_path(@invoice)
  end

  private

  def get_invoice
    @invoice = Invoice.find_by_id(params[:invoice_id])
  end
end