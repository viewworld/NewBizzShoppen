class Suppliers::LeadsController < Suppliers::BasicSupplierController
  before_filter :check_supplier_role

  private

  def check_supplier_role
    redirect_to supplier_home_path unless current_user.has_role?(:supplier)
  end
end