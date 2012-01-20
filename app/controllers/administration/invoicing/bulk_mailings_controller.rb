class Administration::Invoicing::BulkMailingsController < Administration::AdministrationController

  before_filter :get_invoices

  def edit
    @sent_invoices = @invoices.select { |invoice| invoice.sent? }
  end

  def update
    @email_template.update_attributes(params[:email_template])
    @invoices.each do |invoice|
      invoice_filename = invoice.store_pdf(current_user).basename
      invoice_path = Pathname.new(File.join(::Rails.root.to_s,'public/html2pdf/invoice_cache', invoice_filename))
      TemplateMailer.delay(:queue => 'emails').new(invoice.user.email, @email_template, invoice.user.country,
                                       {:invoice => invoice, :sender_id => user_signed_in? ? current_user.id : nil}, Array(invoice_path))
      invoice.update_attribute(:emailed_at, Time.now)
    end
    flash[:notice] = I18n.t("flash.bulk_mailings.invoices_sent")
    redirect_to administration_invoicing_invoices_path
  end

  def get_invoices
    @email_template = EmailTemplate.find_by_uniq_id("invoice")
    @invoices = Invoice.where(:id => params[:invoice_ids].is_a?(Array) ? params[:invoice_ids] : params[:invoice_ids].to_s.split(","))
    if @invoices.empty?
      flash[:notice] = I18n.t("flash.bulk_mailings.no_invoices_selected")
      redirect_to administration_invoicing_invoices_path
    end
  end
end