class Administration::Invoicing::MailingsController < Administration::AdministrationController
  before_filter :get_invoice

  def new
    @email_template_preview = EmailTemplatePreview.new(:invoice, {:invoice => @invoice})
    @email_template_preview.invoice_filename = @invoice.store_pdf.basename
  end

  def create
    params[:email_template_preview].tap do |email_params|
      invoice_path = Pathname.new(File.join(::Rails.root.to_s,'public/html2pdf/invoice_cache',email_params[:invoice_filename]))
      ApplicationMailer.generic_email(email_params[:recipients], email_params[:subject], email_params[:body], nil, invoice_path.to_a).deliver
    end
    flash[:notice] = I18n.t("flash.bulk_lead_share_by_email.actions.create.notice")
    redirect_to administration_invoicing_invoice_path(@invoice)
  end

  private

  def get_invoice
    @invoice = Invoice.find_by_id(params[:invoice_id])
  end
end