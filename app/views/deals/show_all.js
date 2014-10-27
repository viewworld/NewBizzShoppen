$('#deal_links_container').html('<%= escape_javascript(render(:partial => 'shared/deals/deal_link_row', :locals => {:deals => @deals})) %>');
$('#modal_for_deal_links_buttons_panel').show();
