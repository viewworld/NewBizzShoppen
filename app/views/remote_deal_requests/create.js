<% unless @nested_lead.leads_valid? %>
  $('#modal_remote_deal_requests_info_container').html('<%= escape_javascript(render(:partial => 'nested_lead_forms', :locals => {:nested_lead => @nested_lead, :user => @user, :remote => true})) %>');
<% else %>
  $('#modal_remote_deal_requests_info').dialog('close');
<% end %>
