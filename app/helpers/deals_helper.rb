module DealsHelper

  def deals_table(collection, options = {}, &block)
    @hb = ApplicationHelper::HelperBlocks.new(:status_column, :tools, :rowtooltip)
    block.call(@hb)
    options[:show_checkboxes] ||= false
    render(:partial => '/shared/deals/table', :locals => options.merge({:collection => collection}.merge(@hb.results)))
  end

  def handle_new_deal(user, page, params=[])
    if user and params[:query_type] == "check_email"
      deal = Deal.new_for_user(user)
      deal.category_id = user.deal_category_id
      [:company_name, :contact_name, :email_address, :phone_number, :address_line_1,
       :address_line_2, :address_line_3, :zip_code, :country_id, :region_id, :category_id].each do |field|
        page << "$('#deal_#{field}').val(\"#{deal.send(field)}\")"
      end
      page << "$('div#buyer_info').html('#{escape_javascript(user.company_name)}, #{escape_javascript(user.screen_name)}')"
      page << "$('div#buyer_confirmation').show()"
    elsif params[:query_type] == "check_email"
      page << "alert('#{I18n.t('call_centre_agent.deals.new.view.no_user_found_message', :email => params[:email])}')"
    elsif params[:query_type] == "certify"
      page << "setup_step(1)"
    end
  end

end