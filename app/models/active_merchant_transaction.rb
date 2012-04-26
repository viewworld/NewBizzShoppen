class ActiveMerchantTransaction < PaymentTransaction

  def can_be_edited?
    false
  end

end