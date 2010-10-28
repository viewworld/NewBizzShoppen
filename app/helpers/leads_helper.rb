module LeadsHelper
  def leads_listing(collection, options = {}, &block)
    @hb = ApplicationHelper::HelperBlocks.new(:left, :right)
    block.call(@hb)
    options[:show_checkboxes] ||= false
    render(:partial => '/leads/listing', :locals => options.merge({:collection => collection}.merge(@hb.results)))
  end
end



