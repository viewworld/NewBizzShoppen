<% unless @templates.empty? %>
  $.colorbox({overlayClose: false, width:570, height: 250,iframe: true, href:'/lead_templates/?lead_id=<%= @lead.id %>&category_id=<%= @category.id %>', onClosed:function(){change_category_and_submit_form();} });
<% else %>
  change_category_and_submit_form();
<% end %>
