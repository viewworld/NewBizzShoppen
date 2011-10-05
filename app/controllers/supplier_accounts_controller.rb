class SupplierAccountsController < SignInController

  def new
    super(User::Supplier)
  end

  def create
    super(User::Supplier, :user_supplier, I18n.t("flash.supplier_accounts.create.notice"))
  end

end
