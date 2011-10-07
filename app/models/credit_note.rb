class CreditNote < ActiveRecord::Base
  belongs_to :invoice

  NOTE_TYPES = ["credit".freeze, "refund".freeze]

  include ScopedSearch::Model

  scope :with_keyword, lambda { |keyword| where("users.first_name like :q or users.last_name like :q or credit_notes.number::TEXT like :q", { :q => "%#{keyword}%" }).joins(:invoice => [:user]) }
  scope :with_type, lambda { |type_name| where("lower(type) = ?", type_name) }

  after_create :set_number

  private

  def set_number
    self.update_attribute :number, CreditNote.count(:conditions => ["invoices.seller_id = ?", invoice.seller_id], :joins => :invoice)
  end

  public

  def invoice_lines
    invoice.invoice_lines.where("is_credited = ?", true)
  end

  def supplier
    invoice.user
  end

  def total
    invoice_lines.sum('brutto_value')
  end

  def full_number
    "#{number}/#{created_at.year}"
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

  public

  def type_as_text
    I18n.t("models.credit_note.type.credit")
  end

end

class Refund < CreditNote

  def type_as_text
    I18n.t("models.credit_note.type.refund")
  end
end