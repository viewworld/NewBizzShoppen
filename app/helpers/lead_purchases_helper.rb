module LeadPurchasesHelper
  def lead_purchases_listing(collection, options = {}, &block)
    @hb = ApplicationHelper::HelperBlocks.new(:left, :right)
    block.call(@hb)
    options[:show_checkboxes] ||= false
    render(:partial => '/lead_purchases/listing', :locals => options.merge({:collection => collection}.merge(@hb.results)))
  end
end