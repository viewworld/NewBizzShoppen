module InvoiceHelper

  def payment_status(condition, true_text = "true", false_text="false")
    content_tag(:span, (condition ? true_text : false_text), :class => "invoice_status #{condition ? 'positive' : 'negative'}")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render("/administration/invoicing/invoice_lines/"+association.to_s.singularize + "_fields", :f => builder)
    end
    bt_link_to(:plus, name, "javascript:void(0)", :onclick => "add_fields(this, '#{association}', '#{escape_javascript(fields)}');change_vat_fields_availibility($('#invoice_charge_vat')[0].checked)", :id => "add_fields_#{association}", :class => "bt_max")
  end

  def options_for_with_paid
    [
        [t('administration.invoices.index.view.paid'),1],
        [t('administration.invoices.index.view.not_paid'),0],
    ]
  end

  def invoice_preview_path(filename)
    "/html2pdf/invoice_cache/#{filename}"
  end

  def total_in_words(invoice)
    begin
      "Numerals::#{I18n.locale.to_s.humanize}".constantize.in_words(invoice.total, invoice.currency)
    rescue
      Numerals::En.in_words(invoice.total, invoice.currency)
    end
  end

  def send_invoice_warning(invoice)
    if invoice.sent? or invoice.paid?
      t("administration.invoices.mailing.new.view.invoice_already_sent_or_paid", :status => t("administration.invoices.mailing.new.view.#{invoice.paid? ? 'paid' : 'sent'}"))
    else
      false
    end
  end
end