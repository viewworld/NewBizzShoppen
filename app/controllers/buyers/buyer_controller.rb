class Buyers::BuyerController < SecuredController
  def current_user
    @buyer ||= ::User::LeadBuyer.find_by_id(super.id)
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:lead_buyer)
  end
  
end
