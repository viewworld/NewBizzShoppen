module HintsHelper
  def hint_for(object, method)
    html_id = "#{object.class.to_s.tableize.singularize}_#{method}"
    @hint = Article::Cms::Hint.first(:conditions => {:key => html_id, :published => true})
    if !@hint.blank? and !@hint.content.blank?
      return link_to_function(image_tag("icons/hint.png"), "javascript:void();", {:id => "hint_#{html_id}", :class => "inputs_hint"}) +
              content_tag(:div, @hint.content_sanitized.html_safe, :id => "hint_#{html_id}", :class => "hidden")
    end
    nil
  end
end