class UseVoucherController < ApplicationController

  before_filter :set_variables

  def show
  end

  def create
    result = VoucherNumber.use_voucher(@deal_unique_id, @voucher_number)
    flash[:notice] = result[1]
    redirect_to validate_voucher_path
  end

  private

  def set_variables
    @deal_unique_id = params[:deal_unique_id]
    @voucher_number = params[:voucher_number]
  end

end