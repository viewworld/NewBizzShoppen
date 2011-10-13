class CategorySupplierAccountsController < SignInController

  def new
    @user = User::CategorySupplier.new(:newsletter_on => true, :buying_categories => [@home_category], :time_zone => "UTC")
    data = session[:rpx_data]
    @user.set_fields_for_rpx(data) unless data.blank?
  end

  def create
    super(::User::CategorySupplier, :user_category_supplier, I18n.t("flash.category_supplier_accounts.create.notice"), category_home_page_path(@home_category.cached_slug))
  end

end
