class Refund < CreditNote

  belongs_to :paid_invoice, :class_name => 'Invoice'

  def type_as_text
    I18n.t("models.credit_note.type.refund")
  end

  def total
    refund_price
  end
end