class Buyer::BuyerController < SecuredController
  def current_user
    #Second request is cached so only class-casting occurs
    @buyer ||= ::User::LeadBuyer.find(super.id)
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:lead_buyer)
  end
end
