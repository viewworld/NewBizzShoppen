class InvoiceLinesImport
  attr_accessor :raw_text
  attr_reader :invoice_id

  def initializer

  end

  def self.create(*args)
    options = args.extract_options!
    @invoice_id = options[:invoice_id]
    @raw_text = options[:raw_text]

    @raw_text.split("\n").each do |line|
      unless line.strip.blank?
        s = line.split(/[^a-z0-9,.]/i).select{|str| str.present?}
        name, netto_price = s[0..-2].join(" ").to_s, s.last.gsub(",", ".").to_f
        if (name.present? and not netto_price.zero?)
          save_invoice_line!(name, netto_price)
        end
      end
    end
    @invoice_id
  end

  def self.save_invoice_line!(name, netto_price)
    InvoiceLine.create :invoice_id => @invoice_id,
                       :name => name,
                       :netto_price => netto_price,
                       :quantity => 1,
                       :vat_rate => 0.0,
                       :vat_value => 0.0,
                       :netto_value => netto_price,
                       :brutto_value => netto_price
  end

  #For formtastic
  def new_record?
    true
  end

  def self.human_name
    "Order lines import"
  end

  def self.model_name
    "InvoiceLinesImport"
  end


end