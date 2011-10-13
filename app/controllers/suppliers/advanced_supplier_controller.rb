class Suppliers::AdvancedSupplierController < Suppliers::SupplierController
  before_filter :authorize_user_for_namespace!

  def current_user
    @supplier ||= ::User::Supplier.find_by_id(super.id)
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:supplier)
  end
end