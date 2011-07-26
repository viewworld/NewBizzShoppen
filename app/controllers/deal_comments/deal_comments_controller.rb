class DealComments::DealCommentsController < SecuredController
  private

  def authorize_user_for_namespace!
    raise CanCan::AccessDenied if !user_signed_in?
  end

  def current_user
    User.find_by_id(super.id).with_role
  end
end