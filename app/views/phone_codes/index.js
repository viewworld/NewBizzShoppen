function set_phone_code(field, code) {
    $("[id$=" + field + "]").val('+' + code);
}

<% if @country %>
  set_phone_code('_direct_phone_number', '<%= @country.phone_dialling_code %>');
  set_phone_code('_phone_number', '<%= @country.phone_dialling_code %>');
  set_phone_code('_company_phone_number', '<%= @country.phone_dialling_code %>');
<% end %>

