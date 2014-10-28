<% content = String.new.tap do |string| %>
  <% @deals.each do |deal| %>
    <% string << escape_javascript(render(:partial => 'shared/deals/deal_for_email', :locals => {:featured => deal})) %>
  <% end %>
<% end %>

CKEDITOR.instances['#{params[:instance_name]}'].insertHtml("<p>&nbsp;</p><p>" + '<%= content %>' + "</p><p>&nbsp;</p>");
$('#modal_for_deal_links').dialog('close');
