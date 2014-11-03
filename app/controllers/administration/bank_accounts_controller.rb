class Administration::BankAccountsController < Administration::AdministrationController
  include Controllers::CommonActions

  set_tab 'settings'
  set_subtab 'global'

  before_filter :set_bank_account, only: [:show, :edit, :update, :destroy]

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.new(bank_account_params)

    common_save(@bank_account, success: { redirect: edit_administration_setting_path })
  end

  def update
    @bank_account.assign_attributes(bank_account_params)

    common_save(@bank_account, success: { redirect: edit_administration_setting_path })
  end

  def destroy
    common_destroy(@bank_account, success: { redirect: edit_administration_setting_path })
  end

  private
  def set_bank_account
    @bank_account = BankAccount.find(params[:id])
  end

  def bank_account_params
    params.require(:bank_account).permit(
      :bank_name, :iban_no, :local_bank_number, :swift,
      :payment_conditions, :country_default, :global_default,
      address_attributes: [:address_line_1, :address_line_2, :address_line_3, :zip_code, :country_id, :region_id]
    )
  end
end
