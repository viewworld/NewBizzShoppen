class Credit < CreditNote

  after_save :set_invoice_as_paid_and_credited
  after_create :set_number

  private

  def set_number
    self.update_attribute :number, Credit.count(:conditions => ["invoices.seller_id = ?", invoice.seller_id], :joins => :invoice)
  end

  def set_invoice_as_paid_and_credited
    invoice.update_attribute(:paid_at, Time.now)
    invoice.invoice_lines.each do |invoice_line|
      invoice_line.update_attribute(:is_credited, true)
    end
  end

  public

  def type_as_text
    I18n.t("models.credit_note.type.credit")
  end

  def total
    invoice_lines.sum('brutto_value')
  end
end