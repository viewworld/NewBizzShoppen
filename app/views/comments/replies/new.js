var content = '<%= escape_javascript(render(:partial => 'comments/shared/reply', :locals => {:thread_id => params[:thread_id], :comment_id => params[:comment_id], :commentable_id => params[:commentable_id], :title => params[:title] })) %>';
$(content).insertAfter('#comment_<%= params[:comment_id] %>');
