class Comments::CommentsController < SecuredController
  private

  def authorize_user_for_namespace!
    raise CanCan::AccessDenied if !user_signed_in? or (current_user and current_user.has_role?(:purchase_manager))
  end

  def current_user
    User.find_by_id(super.id).with_role
  end
end