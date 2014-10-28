module HintsHelper
  def hint_for(object, method)
    html_id = "#{object.class.to_s == "String" ? object : object.class.to_s.tableize.singularize}_#{method}"
    if current_user and current_user.has_any_role?(:admin, :translator)
      @hint = Article::Cms::Hint.find_by_key(html_id)
    else
      @hint = Article::Cms::Hint.first(:conditions => {:key => html_id, :published => true})
    end
    result = []

    if (@hint and current_user and current_user.has_any_role?(:admin, :translator)) or (!@hint.blank? and !@hint.content.blank?)
      result << link_to_function(image_tag('icons/hint.png'), 'javascript:void(0)', { id: "hint_#{html_id}", class: "inputs_hint" }) +
              content_tag(:div, (@hint.content_sanitized).html_safe, :id => "hint_#{html_id}", :class => "hidden") if @hint.published?
      if current_user and current_user.has_any_role?(:admin, :translator)
        if @hint.published?
          result << content_tag(:p, link_to(image_tag("icons/edit.png"), edit_administration_hint_path(@hint), :title => t("common.edit_hint")), :class => "inline-hints")
          result << content_tag(:p, link_to(image_tag("icons/remove.png"), administration_hint_path(@hint), :title => t("common.remove_hint"), :method => :delete), :class => "inline-hints")
        else
          result << content_tag(:p, link_to(image_tag("icons/add.png"), edit_administration_hint_path(@hint, :add => "1"), :title => t("common.add_hint")), :class => "inline-hints")
        end
      end
      return result.join.html_safe
    end
    nil
  end
end
