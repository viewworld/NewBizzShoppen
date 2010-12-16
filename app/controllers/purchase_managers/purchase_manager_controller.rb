class PurchaseManagers::PurchaseManagerController < SecuredController
  def current_user
    @agent ||= ::User::PurchaseManager.find_by_id(super.id)
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:purchase_manager)
  end
end
