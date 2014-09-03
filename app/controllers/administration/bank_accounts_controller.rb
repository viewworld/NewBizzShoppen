class Administration::BankAccountsController < Administration::AdministrationController
  set_tab "settings"
  set_subtab "global"

  before_filter :set_bank_account, only: [:show, :edit, :update, :destroy]

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.new(bank_account_params)

    if @bank_account.save
      redirect_to edit_administration_setting_path
    else
      render :new
    end
  end

  def update
    if @bank_account.update_attributes(bank_account_params)
      redirect_to edit_administration_setting_path
    else
      render :edit
    end
  end

  def destroy
    @bank_account.destroy
    redirect_to edit_administration_setting_path
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
