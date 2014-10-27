<% if @call_results.blank? %>
var content = '';
<% else %>
var content = '<%= escape_javascript(render(:partial => 'callers/campaigns/call_result_details_table', :locals => {:call_results => @call_results, :campaign => @campaign})) %>'
<% end %>

$('#container_for_result_details').html(content);
