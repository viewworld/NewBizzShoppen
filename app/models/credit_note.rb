class CreditNote < ActiveRecord::Base
  belongs_to :invoice

  after_create :set_number

  private

  def set_number
    invoice.seller.invoices.where("credit_note_id IS NOT NULL")
    self.update_attribute :number, CreditNote.count(:conditions => ["invoices.seller_id = ?", invoice.seller_id], :joins => :invoice) + 1
  end

  def invoice_lines
    invoice.invoice_lines.where("is_credited = ?", true)
  end

end
