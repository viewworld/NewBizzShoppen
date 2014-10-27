var content = '<%= escape_javascript(content_tag(:span, link_to_function(@comment.user_blocked_from_conversation? ? t("comments.threads.show.view.unblock_user") : t("comments.threads.show.view.block_user"), "block_user(#{@comment.id}, #{@comment.user_blocked_from_conversation? ? 1 : 0})"), :id => "block_user_link_#{@comment.id}")) %>';
$('#block_user_link_<%= @comment.id %>').replaceWith(content);
$('#block_user_link_<%= @comment.id %>').effect('highlight',{},3000);
