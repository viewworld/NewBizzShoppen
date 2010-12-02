module LeadPurchasesHelper
  def lead_purchases_listing(collection, options = {}, &block)
    @hb = ApplicationHelper::HelperBlocks.new(:general, :card, :tools, :contact, :bottom, :assigned_to)
    block.call(@hb)
    options[:show_checkboxes] ||= false
    render(:partial => '/lead_purchases/listing', :locals => options.merge({:collection => collection}.merge(@hb.results)))
  end

  def lead_purchase_has_email_address?(lead_purchase)
    lead_purchase.lead.email_address.present?
  end
end