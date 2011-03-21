module UsersHelper
  def full_name_with_company(user)
    if user.has_role? :call_centre_agent
      "#{user.full_name} @ #{link_to(user.parent.company_name, edit_administration_user_path(user.parent))}"
    else
      user.full_name
    end
  end
end