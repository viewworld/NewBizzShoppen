$("#osx-modal-data").html('<%= escape_javascript(render(:partial => "/administration/invoicing/cash_flow/form") %>');
$("#osx-modal-title").html("Update cash flow for invoice #<%= @invoice.id %>");
initCalendars();
showModal();
