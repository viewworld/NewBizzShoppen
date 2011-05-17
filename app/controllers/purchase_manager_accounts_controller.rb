class PurchaseManagerAccountsController < SignInController

  def new
    super(User::PurchaseManager)
  end

  def create
    super(User::PurchaseManager, :user_purchase_manager, I18n.t("flash.purchase_manager_accounts.create.notice"))
  end

end
