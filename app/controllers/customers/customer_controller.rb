class Customers::CustomerController < SecuredController

  def current_user
    @customer ||= ::User::Customer.find_by_id(super.id)
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:customer)
  end

  def authorize_for_team_buyers
    raise CanCan::AccessDenied unless current_user.team_buyers?
  end

  def authorize_for_big_buyer
    raise CanCan::AccessDenied unless current_user.big_buyer?
  end

  def authorize_for_interests
    raise CanCan::AccessDenied if current_user.has_role? :category_buyer
  end
end
