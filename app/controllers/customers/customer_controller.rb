class Customers::CustomerController < SecuredController
  def current_user
    #Second request is cached so only class-casting occurs
    @customer ||= ::User::Customer.find(super.id)
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:customer)
  end
end
