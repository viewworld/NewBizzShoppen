module DealsHelper

  def deals_table(collection, options = {}, &block)
    @hb = ApplicationHelper::HelperBlocks.new(:status_column, :tools)
    block.call(@hb)
    options[:show_checkboxes] ||= false
    render(:partial => '/shared/deals/table', :locals => options.merge({:collection => collection}.merge(@hb.results)))
  end

end