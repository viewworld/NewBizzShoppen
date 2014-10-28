$("#osx-modal-data").html('<%= escape_javascript(render(:partial => "/invoicing/mailings/new") %>');
$("#osx-modal-title").html("<%= I18n.t('administration.invoices.mailing.new.view.title') %>");
showModal();
