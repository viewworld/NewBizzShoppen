class Administration::Invoicing::MailingsController < Administration::AdministrationController
  before_filter :get_invoice

  def new
    @email_template_preview = EmailTemplatePreview.new(:invoice, {:invoice => @invoice, :country => Country.get_country_from_locale})
    @email_template_preview.invoice_filename = @invoice.store_pdf(current_user).basename
  end

  def create
    @email_template_preview = EmailTemplatePreview.new(:invoice, {:invoice => @invoice})
    params[:email_template_preview].tap do |email_params|
      invoice_path = Pathname.new(File.join(::Rails.root.to_s,'public/html2pdf/invoice_cache',email_params[:invoice_filename]))
      TemplateMailer.delay.new(email_params[:recipients], :blank_template, Country.get_country_from_locale,
                                       {:subject_content => email_params[:subject], :body_content => email_params[:body],
                                        :bcc_recipients => @email_template_preview.bcc, :cc_recipients => @email_template_preview.cc}, Array(invoice_path))
    end
    flash[:notice] = I18n.t("flash.bulk_lead_share_by_email.create.notice")
    redirect_to administration_invoicing_invoice_path(@invoice)
  end

  private

  def get_invoice
    @invoice = Invoice.find_by_id(params[:invoice_id])
  end
end