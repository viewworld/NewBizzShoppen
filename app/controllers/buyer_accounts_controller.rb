class BuyerAccountsController < SignInController

  def new
    super(User::Customer)
  end

  def create
    super(User::Customer, :user_customer, I18n.t("flash.buyer_accounts.create.notice"))
  end

end
