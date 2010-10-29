module LeadRequestsHelper
  def lead_requests_listing(collection, options = {}, &block)
    @hb = ApplicationHelper::HelperBlocks.new(:general, :tools)
    block.call(@hb)
    options[:show_checkboxes] ||= false
    render(:partial => '/lead_requests/listing', :locals => options.merge({:collection => collection}.merge(@hb.results)))
  end
end