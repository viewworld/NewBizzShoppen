<% if params[:field_prefix] %>
    clear_regions_select('<%= params[:field_prefix] %>');
<% else %>
    clear_regions_select_custom('<%= params[:region_html_id] %>');
<% end %>

<% if @country %>
    <% @country.regions.each do |region| %>
      <% if params[:field_prefix] %>
        add_region('<%= params[:field_prefix] %>', '<%= region.name %>', '<%= region.id %>');
      <% else %>
        add_region_custom('<%= params[:region_html_id] %>', '<%= region.name %>', '<%= region.id %>');
      <% end %>
    <% end %>
<% end %>
