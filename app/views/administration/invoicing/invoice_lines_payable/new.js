$("#osx-modal-data").html('<%= escape_javascript(render(:partial => "/invoicing/invoice_lines_payable/new") %>');
$("#osx-modal-title").html("Set payable for selected invoice lines");
showModal();
