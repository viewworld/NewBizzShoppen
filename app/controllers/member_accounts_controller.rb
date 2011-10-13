class MemberAccountsController < SignInController

  def new
    super(User::Member)
  end

  def create
    super(User::Member, :user_member, I18n.t("flash.member_accounts.create.notice"))
  end

end
