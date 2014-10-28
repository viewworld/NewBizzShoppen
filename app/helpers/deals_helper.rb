module DealsHelper

  def deals_table(collection, options = {}, &block)
    @hb = ApplicationHelper::HelperBlocks.new(:status_column, :tools, :rowtooltip)
    block.call(@hb)
    options[:show_checkboxes] ||= false
    render(:partial => '/shared/deals/table', :locals => options.merge({:collection => collection}.merge(@hb.results)))
  end

  def handle_new_deal(user, params=[])
    javascript = ''
    if user && params[:query_type] == 'check_email'
      deal = Deal.new_for_user(user)
      deal.category_id = user.deal_category_id
      [:company_name, :contact_name, :email_address, :phone_number, :address_line_1,
       :address_line_2, :address_line_3, :zip_code, :country_id, :region_id, :category_id].each do |field|
        javascript << "$('#deal_#{field}').val(\"#{deal.send(field)}\");"
      end
      javascript << "$('div#supplier_info').html('#{escape_javascript(user.company_name)}, #{escape_javascript(user.screen_name)}');"
      javascript << "$('div#supplier_confirmation').show();"
    elsif params[:query_type] == "check_email"
      javascript << "alert('#{I18n.t('call_centre_agent.deals.new.view.no_user_found_message', :email => params[:email])}');"
    elsif params[:query_type] == "certify"
      javascript << 'setup_step(1);'
    end
    javascript.html_safe
  end

  def group_deal_leads_created_and_missing(deal)
    if deal.group_deal?
      temp_arr = []
      temp_arr << "#{deal.created_leads} #{I18n.t("deals.common.created_leads_count")}" if deal.created_leads.to_i > 0
      temp_arr << "#{deal.min_created_leads - deal.created_leads} #{I18n.t("deals.common.missing_leads_count")}#{" " + I18n.t("deals.common.leads_label") if deal.created_leads.to_i <= 0}" if deal.min_created_leads.to_i > 0 and deal.min_created_leads > deal.created_leads
      temp_arr.join(" / ")
    end
  end
end
