var content = '<%= escape_javascript(render(:partial => "/shared/deal_comments/deal_threads", :locals => { :deal => @deal, :threads => @threads })) %>';
$('#comments_for_deal_<%= @deal.id %>').html(content);
