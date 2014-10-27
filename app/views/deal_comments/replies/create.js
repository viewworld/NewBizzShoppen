<% if @reply.save %>
  <% @reply.reload %>
  <% @reply.assign_last_thread_created_at_to_root %>
  var content = '<%= escape_javascript(render(:partial => 'deal_comments/shared/comment', :locals => {:thread => @reply.root, :comment => @reply, :level => @reply.level })) %>';
  $(content).insertAfter('#comment_<%= @reply.comment_to_insert_after.id %>');
  $('#reply_<%= @reply.parent.id %>').slideUp('slow');
  $('#comment_<%= @reply.id %>').effect('highlight',{},3000);
<% else %>
  alert('Comment has not been saved.');
<% end %>
