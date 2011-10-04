class MemberAccountsController < SignInController

  def new
    super(User::Member)
  end

  def create
    super(User::Member, :user_purchase_manager, I18n.t("flash.member_accounts.create.notice"))
  end

end
