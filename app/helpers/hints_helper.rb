module HintsHelper
  def hint_for(object, method)
    html_id = "#{object.class.to_s.tableize.singularize}_#{method}"
    @hint = Article::Cms::Hint.first(:conditions => {:key => html_id, :published => true})
    if !@hint.blank? and !@hint.content.blank?
      return link_to_function("[?]", "javascript:void();", {:id => "hint_#{html_id}"}) +
          "<script>$('#hint_#{html_id}').simpletip({ content: '#{@hint.content_sanitized}', fixed: true });</script>".html_safe
    end

    nil
  end
end