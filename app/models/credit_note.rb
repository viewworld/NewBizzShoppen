class CreditNote < ActiveRecord::Base
  belongs_to :invoice

  after_create :set_number

  private

  def set_number
    invoice.seller.invoices.where("credit_note_id IS NOT NULL")
    self.update_attribute :number, CreditNote.count(:conditions => ["invoices.seller_id = ?", invoice.seller_id], :joins => :invoice) + 1
  end

  public

  def invoice_lines
    invoice.invoice_lines.where("is_credited = ?", true)
  end

end

class Credit < CreditNote

  after_save :set_invoice_as_paid_and_credited

  private

  def set_invoice_as_paid_and_credited
    invoice.update_attribute(:paid_at, Time.now)
    invoice.invoice_lines.each do |invoice_line|
      invoice_line.update_attribute(:is_credited, true)
    end
  end

end

class Refund < CreditNote

end