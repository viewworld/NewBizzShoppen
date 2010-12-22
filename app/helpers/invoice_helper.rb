module InvoiceHelper

  def self.number_in_words(n, ending=nil)
    # It's probably the worst code in ruby I've ever written
    # It seems to work, but it definitely should not ;)
    n = n.to_i
    return '' if n.nil? or n == 0
    sc = [''] + %w{jeden dwa trzy cztery pięć sześć siedem osiem dziewięć}
    sn = %w{dziesięć jedenaście dwanaście trzynaście czternaście piętnaście szesnaście siedemnaście osiemnaście dziewiętnaście}
    sd = ['', ''] + %w{dwadzieścia trzydzieści czterdzieści pięćdziesiąt sześćdziesiąt siedemdziesiąt osiemdziesiąt dziewiędziesiąt sto}
    ss = [''] + %w{sto dwieście trzysta czterysta pięćset sześćset siedemset osiemset dziewięćset}
    b = (ending || ['', '', '']), %w{tysiąc tysiące tysięcy}, %w{milion miliony milionów}, %w{miliard miliardy miliardów}, %w{bilion biliony bilionów}
    p = n.to_s.size
    return n if p > 15
    d, dn = n.to_s[0, (p%3 == 0 ? 3 : p%3)], n.to_s[(p%3 == 0 ? 3 : p%3)..-1]
    return "#{d.to_i==0 ? '' : b[((p-1)/3.0).floor][0]} #{number_in_words(dn, ending)}".strip if (d.to_i == 1 or d.to_i == 0 ) and n != 1
    r = ''
    (d.size-1).downto(0) do |i|
      r += ' ' unless r[-1] and r[-1].chr == ' '
      r += ss[d[-i-1].chr.to_i] if i == 2
      d[-i-1].chr.to_i == 1 ? (r += sn[d[-i].chr.to_i]; d = d[0..-2]; break) : r += sd[d[-i-1].chr.to_i] if i == 1
      r += sc[d[-i-1].chr.to_i] if i == 0
    end
    (2..4) === (d.to_i % 10) ? k=1 : k=2
    "#{r.strip} #{b[((p-1)/3.0).floor][k]} #{number_in_words(dn.to_i, ending)}".strip
  end

  def self.number_in_words_ext(n, currency = "PLN")
    number_in_words(n, ending=nil) + " #{currency} " + n.to_f.to_s.split(".").last.ljust(2, "0") + "/100"
  end

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


end