module UsersHelper
  def screen_name_with_company_name(user)
    case
      when (user.role == :call_centre_agent and current_user_has_role? :admin)
        then "#{user.screen_name} @ #{link_to(user.parent.company_name, edit_administration_user_path(user.parent))}"
      when (user.role == :call_centre_agent)
        then "#{user.screen_name} @ #{user.parent.company_name}"
      when (user.role == :call_centre)
        then user.company_name
      else user.screen_name
    end
  end
end