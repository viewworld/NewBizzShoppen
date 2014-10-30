<% if @thread.nil? %>
  $('#thread_<%= @thread_id %>').remove();
<% else %>
  var content = '<%= escape_javascript(render('deal_comments/shared/thread', { thread: @thread })) %>';
  $('#thread_<%= @thread_id %>').replaceWith(content);
<% end %>
$('#truncated_thread_<%= @thread_id %>').remove();

