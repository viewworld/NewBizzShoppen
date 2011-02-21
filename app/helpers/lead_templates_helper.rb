module LeadTemplatesHelper

  def lead_templates_table(collection, options = {}, &block)
    @hb = ApplicationHelper::HelperBlocks.new(:tools)
    block.call(@hb)
    options[:show_checkboxes] ||= false
    options[:show_active_column] ||= false
    render(:partial => '/shared/lead_templates/table', :locals => options.merge({:collection => collection}.merge(@hb.results)))
  end

  def translate_boolean(val)
    val ? t("lead_templates.table.yes_label") : t("lead_templates.table.no_label")
  end
end