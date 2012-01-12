class SupplierAccountsController < SignInController

  def new
    super(User::CategorySupplier)
  end

  def create
    super(User::CategorySupplier, :user_category_supplier, I18n.t("flash.supplier_accounts.create.notice"))
  end

end
