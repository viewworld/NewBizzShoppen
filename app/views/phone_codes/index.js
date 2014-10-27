<% if @country %>
  set_phone_code('lead_direct_phone_number', '<%= @country.phone_dialling_code %>');
  set_phone_code('lead_phone_number', '<%= @country.phone_dialling_code %>');
  set_phone_code('lead_company_phone_number', '<%= @country.phone_dialling_code %>');
<% end %>

