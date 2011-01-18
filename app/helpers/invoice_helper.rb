module InvoiceHelper

  def payment_status(condition, true_text = "true", false_text="false")
    content_tag(:span, (condition ? true_text : false_text), :class => "invoice_status #{condition ? 'positive' : 'negative'}")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render("/administration/invoicing/invoice_lines/"+association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, (%{add_fields(this, '#{association}', '#{escape_javascript(fields)}')}), :id => "add_fields_#{association}", :class => "add_line")
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


end