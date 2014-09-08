module Administration::CategoriesHelper
  def unique_category_select_name(u)
    name = "#{u.company_name} (#{u.email})"
    name += " #{u.last_name}" if [:agent,:call_centre_agent].include?(u.role)
    name
  end

  def after_category
    ->(category) do
      translation_scope = 'administration.categories.index.view'

      links = []
      links << link_to(t(:edit_link, scope: translation_scope), edit_administration_category_path(category))

      if category.is_empty?
        links << link_to(t(:destroy_link, scope: translation_scope), administration_category_path(category), method: :delete, confirm: I18n.t('common.confirmation'))
      end

      links.join(' | ').html_safe
    end
  end
end
