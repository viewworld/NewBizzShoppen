class Invoicing::MailingsController < ApplicationController
  before_filter :get_invoice

  def new
    @mailing = Mailing.new
    respond_to do |format|
      format.js
    end
  end


  def create
    params[:mailing][:filepaths] = [[@invoice.store_pdf, @invoice.filename+".pdf"]]

    if Mailing.create(params[:mailing])
      @invoice.update_attribute(:emailed_at, Time.now)
    end

    respond_to do |format|
      format.html {redirect_to invoicing_invoice_path(@invoice)}
    end
  end

  private

  def get_invoice
    @invoice = Invoice.find_by_id(params[:invoice_id])
  end
end