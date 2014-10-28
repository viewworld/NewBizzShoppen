window.t = setTimeout("top.location='<%= logout_path %>'", TIME_TO_CANCEL);

<% if @user_session_log.nil? || @user_session_log.expired? %>
  $('#modal_for_longer_session').dialog('open');
<% else %>
  extend_session();
<% end %>
