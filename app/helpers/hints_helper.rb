module HintsHelper
  def hint_for(object, method)
    html_id = "#{object.class.to_s.tableize.singularize}_#{method}"
    @hint = Article::Cms::Hint.first(:conditions => {:key => html_id, :published => true})
    admin_edit_link = (current_user and current_user.has_role?(:admin)) ? content_tag(:p, link_to(image_tag("icons/edit.png"), edit_administration_hint_path(@hint), :title => t("common.edit_hint")), :class => "inline-hints") : ""
    if !@hint.blank? and !@hint.content.blank?
      return link_to_function(image_tag("icons/hint.png"), "javascript:void();", {:id => "hint_#{html_id}", :class => "inputs_hint"}) +
              content_tag(:div, (@hint.content_sanitized).html_safe, :id => "hint_#{html_id}", :class => "hidden") +
              admin_edit_link
    end
    nil
  end
end