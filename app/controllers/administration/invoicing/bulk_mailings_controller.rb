class Administration::Invoicing::BulkMailingsController < Administration::AdministrationController
  before_filter :get_invoices

  def edit
    @sent_invoices = @invoices.select(&:sent?)
  end

  def update
    @email_template.update_attributes(params[:email_template])

    @invoices.each do |invoice|
      invoice_filename = invoice.store_pdf(current_user).basename
      invoice_path = Pathname.new(File.join(::Rails.root.to_s, 'public/system/invoice_cache', invoice_filename))

      TemplateMailer.new(
        invoice.user.email,
        @email_template,
        invoice.user.country,
        {invoice: invoice, sender_id: user_signed_in? ? current_user.id : nil},
        Array(invoice_path)
      ).deliver!
      
      invoice.update_attribute(:emailed_at, Time.now)
    end

    redirect_to administration_invoicing_invoices_path, notice: t("flash.bulk_mailings.invoices_sent")
  end

  def get_invoices
    @email_template = EmailTemplate.find_by_uniq_id('invoice')
    @invoices = Invoice.where(id: params[:invoice_ids].is_a?(Array) ? params[:invoice_ids] : params[:invoice_ids].to_s.split(","))

    if @invoices.empty?
      redirect_to administration_invoicing_invoices_path, notice: t('flash.bulk_mailings.no_invoices_selected')
    end
  end
end
