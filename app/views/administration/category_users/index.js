clear_select('<%= params[:users_type] %>', 'all');

<% @users.each do |user| %>
  add_option_to_select('<%= params[:users_type] %>', 'all', '<%= user.email %>', '<%= user.id %>);
<% end %>
