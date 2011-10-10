class CertificationAccountsController < SignInController

  def new
    lead = Lead.find(params[:lead_id])
    @user = User::Member.new(:time_zone => "UTC")
    @user.populate_fields_from_lead(lead)
  end

  def create
    super(User::Member, :user_member, I18n.t("flash.member_accounts.create.notice"))
  end

end
