module Administration::CategoriesHelper

  def unique_category_select_name(u)
    name = "#{u.company_name} (#{u.email})"
    name += " #{u.last_name}" if [:agent,:call_centre_agent].include?(u.role)
    name
  end

  def after_category
    lambda do |c|
      [].tap do |links|
          links << link_to(t("administration.categories.index.view.edit_link"), edit_administration_category_path(c))
          links << link_to(t("administration.categories.index.view.destroy_link"), administration_category_path(c),
                           method: :delete,
                           confirm: I18n.t("common.confirmation")) if c.is_empty?
      end.join(" | ").html_safe
    end
  end

end
