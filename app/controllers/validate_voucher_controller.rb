class ValidateVoucherController < ApplicationController
  set_tab "validate_voucher"
  def show
  end

  def create
    @deal_unique_id = params[:deal_unique_id]
    @voucher_number = params[:voucher_number]
    result = VoucherNumber.validate_voucher(@deal_unique_id, @voucher_number)
    flash[:notice] = result[1] unless result[0]
    redirect_to result[0] ? use_voucher_path(:deal_unique_id => @deal_unique_id, :voucher_number => @voucher_number) : validate_voucher_path
  end

end