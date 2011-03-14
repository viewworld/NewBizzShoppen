class Administration::Invoicing::CreditNotesController < Administration::AdministrationController


  def create
    @credit_note = CreditNote.new(params[:credit_note])
    if @credit_note.save
      @credit_note.invoice.invoice_lines.each do |invoice_line|
        invoice_line.update_attribute(:is_credited, true)
      end
    end
    respond_to do |format|
      format.html { redirect_to administration_invoicing_invoices_path }
    end
  end
end