<% if @material.valid? %>
    $('#materials_dialog').html('<%= escape_javascript(render(:partial => 'materials', :locals => {:material => @resource.materials.build, :materials => @resource.materials})) %>');
<% else %>
    $('<p><%= @material.errors.full_messages %></p>').dialog({title:'<%=t("materials.views.index.failed_to_upload")%>'});
<% end %>
