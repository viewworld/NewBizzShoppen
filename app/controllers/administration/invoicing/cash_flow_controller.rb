class Invoicing::CashFlowController < ApplicationController
  before_filter :get_invoice

  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    @invoice.update_attributes(params[:invoice])
    respond_to do |format|
      format.js
    end
  end

  private

  def get_invoice
    @invoice = Invoice.find(params[:invoice_id])
  end

end
