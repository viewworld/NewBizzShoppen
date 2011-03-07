module Administration::CategoriesHelper

  def unique_category_select_name(u)
    name = "#{u.company_name} (#{u.email})"
    name += " #{u.last_name}" if [:agent,:call_centre_agent].include?(u.role)
    name
  end

end
