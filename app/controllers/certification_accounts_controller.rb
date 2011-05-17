class CertificationAccountsController < SignInController

  def new
    lead = Lead.find(params[:lead_id])
    @user = User::PurchaseManager.new(:newsletter_on => true, :email => lead.email_address,
                                      :phone => lead.direct_phone_number.blank? ? lead.phone_number : lead.direct_phone_number,
                                      :first_name => lead.contact_name.blank? ? nil : lead.contact_name.strip.split.first,
                                      :last_name => lead.contact_name.blank? ? nil : lead.contact_name.strip.split.last)
  end

  def create
    super(User::PurchaseManager, :user_purchase_manager, I18n.t("flash.purchase_manager_accounts.create.notice"))
  end

end
