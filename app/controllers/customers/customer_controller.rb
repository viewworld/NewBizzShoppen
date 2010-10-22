class Customers::CustomerController < SecuredController
  def current_user
    @customer ||= ::User::Customer.find(super.id)
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:customer)
  end
end
