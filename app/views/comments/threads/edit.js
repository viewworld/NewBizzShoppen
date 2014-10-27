var content = '<%= escape_javascript(render(:partial => 'form', :locals => {:comment => @comment})) %>';
$(content).insertAfter('#comment_<%= @comment.id %>');
