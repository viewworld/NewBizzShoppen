class Members::MemberController < SecuredController
  def current_user
    @agent ||= ::User::Member.find_by_id(super.id)
    @agent ||= User.find_by_id(super.id).with_role
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:member)
  end
end
