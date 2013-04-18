module LeadPurchasesHelper
  def lead_purchases_listing(collection, options = {}, &block)
    @hb = ApplicationHelper::HelperBlocks.new(:general, :card, :contact, :bottom, :assigned_to, :other_actions, :tools, :hidden_area)
    block.call(@hb)
    options[:show_checkboxes] ||= false
    render(:partial => '/lead_purchases/listing', :locals => options.merge({:collection => collection}.merge(@hb.results)))
  end

  def lead_purchase_has_email_address?(lead_purchase)
    lead_purchase.lead.email_address.present?
  end

  def paid_values
    [
        [I18n.t('common.all_label'), nil],
        [I18n.t('common.yes_label'),true],
        [I18n.t('common.no_label'),false]
    ]
  end

  def show_archived_values
    [
        [I18n.t('common.yes_label'),nil],
        [I18n.t('common.no_label'),LeadPurchaseBase::ARCHIVED]
    ]
  end
end