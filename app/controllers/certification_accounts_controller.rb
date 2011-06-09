class CertificationAccountsController < SignInController

  def new
    lead = Lead.find(params[:lead_id])
    @user = User::PurchaseManager.new(:time_zone => "UTC")
    @user.populate_fields_from_lead(lead)
  end

  def create
    super(User::PurchaseManager, :user_purchase_manager, I18n.t("flash.purchase_manager_accounts.create.notice"))
  end

end
