class Administration::Invoicing::CreditNotesController < Administration::AdministrationController

  def create
    @credit = CreditNote::Credit.create(params[:credit_note])

    respond_to do |format|
      format.html {
        flash[:notice] = I18n.t("flash.credit_notes.create.notice")
        redirect_to administration_invoicing_invoices_path
      }
    end
  end
end