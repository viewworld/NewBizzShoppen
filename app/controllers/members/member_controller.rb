class Members::MemberController < SecuredController
  def current_user
    @agent ||= ::User::Member.find_by_id(super.id)
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:member)
  end
end
