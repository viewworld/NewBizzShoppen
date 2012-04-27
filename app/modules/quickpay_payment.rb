module QuickpayPayment
  TRANSACTION_STATES = { 0 => 'Initial', 1 => 'Authorized', 3 => 'Captured', 5 => 'Cancelled', 7 => 'Refunded', 9 => 'Subscribed' }

  APPROVED =                "000".freeze
  REJECTED =                "001".freeze
  COMMUNICATION_ERROR =     "002".freeze
  CARD_EXPIRED =            "003".freeze
  TRANSITION_NOT_ALLOWED =  "004".freeze
  AUTHORIZATION_EXPIRED =   "005".freeze
  ERROR_ACQUIRER =          "006".freeze
  ERROR_QUICKPAY =          "007".freeze
  ERROR_REQUEST_DATA =      "008".freeze
  ABORTED =                 "009".freeze

  TRANSACTION_STATUSES = {
      APPROVED                => "Approved",
      REJECTED                => "Rejected",
      COMMUNICATION_ERROR     => "Communication error",
      CARD_EXPIRED            => "Card expired",
      TRANSITION_NOT_ALLOWED  => "Transition is not allowed for transaction current state",
      AUTHORIZATION_EXPIRED   => "Authorization is expired",
      ERROR_ACQUIRER          => "Error reported by acquirer",
      ERROR_QUICKPAY          => "Error reported by QuickPay",
      ERROR_REQUEST_DATA      => "Error in request data",
      ABORTED                 => "Payment aborted by shopper"
  }.freeze

  def calculate_md5_check(action, params)
    Digest::MD5.hexdigest(ActiveMerchant::Billing::QuickpayGateway::MD5_CHECK_FIELDS[4][action.to_sym].map{ |key| params[key.to_sym] }.join + APP_CONFIG[:quickpay_secret])
  end

  module_function :calculate_md5_check
end