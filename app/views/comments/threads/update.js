<% if params[:comment].keys.each(&:to_sym).include?("is_blocked") %>
    var content = '<%= escape_javascript(render(:partial => '/comments/shared/thread', :locals => {:thread => @comment.root})) %>';
    $('#truncated_thread_<%= @comment.root.id %>').remove();
    $('#thread_<%= @comment.root.id %>').replaceWith(content);
<% else %>
    $('#edit_comment_<%= @comment.id %>').slideUp('slow');
    $('#edit_comment_<%= @comment.id %>').remove();
    $('#comment_<%= @comment.id %> p[class=comment_title]').html('<%= escape_javascript(@comment.title) %>');
    $('#comment_<%= @comment.id %> span[id=body]').html('<%= escape_javascript(@comment.body) %>');
    $('#comment_<%= @comment.id %> span[id=title]').effect('highlight', {}, 3000);
<% end %>
