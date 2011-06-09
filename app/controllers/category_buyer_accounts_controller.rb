class CategoryBuyerAccountsController < SignInController

  def new
    @user = User::CategoryBuyer.new(:newsletter_on => true, :buying_categories => [@home_category], :time_zone => "UTC")
    data = session[:rpx_data]
    @user.set_fields_for_rpx(data) unless data.blank?
  end

  def create
    super(::User::CategoryBuyer, :user_category_buyer, I18n.t("flash.category_buyer_accounts.create.notice"), category_home_page_path(@home_category.cached_slug))
  end

end
