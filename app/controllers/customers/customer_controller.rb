class Customers::CustomerController < SecuredController
  def current_user
    @customer ||= ::User::Customer.find_by_id(super.id)
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:customer)
  end
end
