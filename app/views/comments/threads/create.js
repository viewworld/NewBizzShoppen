var content = '<%= escape_javascript(render(:partial => '/comments/shared/thread', :locals => {:thread => @comment})) %>';
$(content).insertBefore('#new_comment_div_<%= @comment.commentable.id %>');
clear_form('#new_comment_<%= @comment.commentable.id %>');
