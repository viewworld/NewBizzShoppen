class SurveysManagement::SurveysManagementController < SecuredController
  def current_user
    if user_signed_in?
      @user ||= ::User::Admin.find_by_id(super.id)
      @user ||= ::User::CallCentre.find_by_id(super.id)
      @user ||= ::User::CategorySupplier.find_by_id(super.id)
      @user ||= ::User::Supplier.find_by_id(super.id)
    end
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:admin, :call_centre, :category_supplier, :supplier)
  end
end