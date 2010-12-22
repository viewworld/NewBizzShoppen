class ManualTransaction < PaymentTransaction

  def can_be_edited?
    true
  end

end