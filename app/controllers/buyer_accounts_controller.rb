class BuyerAccountsController < SignInController

  def new
    @user = User::Customer.new(:newsletter_on => true)
  end

  def create
    super(User::Customer, :user_customer, I18n.t("flash.buyer_accounts.create.notice"))
  end

end
