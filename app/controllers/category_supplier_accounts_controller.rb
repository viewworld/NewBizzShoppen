class CategorySupplierAccountsController < SignInController

  def new
    @user = User::CategorySupplier.new(:newsletter_on => true, :buying_categories => [@home_category], :time_zone => "UTC")
  end

  def create
    params[:user_category_supplier][:assign_free_subscription_plan] = "1" if params[:user_category_supplier]
    super(::User::CategorySupplier, :user_category_supplier, I18n.t("flash.category_supplier_accounts.create.notice"), category_home_page_path(@home_category.cached_slug))
  end

end
