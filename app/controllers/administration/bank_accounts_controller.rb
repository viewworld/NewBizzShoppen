class Administration::BankAccountsController < Administration::AdministrationController
  set_tab "settings"
  set_subtab "global"

  before_filter :set_bank_account, only: [:show, :edit, :update, :destroy]

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.new(params[:bank_account])

    if @bank_account.save
      redirect_to edit_administration_setting_path
    else
      render :new
    end
  end

  def update
    if @bank_account.update_attributes(params[:bank_account])
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
end
