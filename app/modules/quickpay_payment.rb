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

  def self.included(base)
    base.class_eval do

    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    public
    def calculate_md5_check(params, fields_type)
      keys = {
         :window_request => [:protocol, :msgtype, :merchant, :language, :ordernumber, :amount, :currency, :continueurl, :cancelurl, :callbackurl,
                             :autocapture, :autofee, :cardtypelock, :description, :group, :testmode, :splitpayment],
         :window_response => [:msgtype, :ordernumber, :amount, :currency, :time, :state, :qpstat, :qpstatmsg, :chstat, :chstatmsg, :merchant, :merchantemail, :transaction, :cardtype, :cardnumber, :cardexpire, :splitpayment, :fraudprobability, :fraudremarks, :fraudreport, :fee]
      }

      Digest::MD5.hexdigest(keys[fields_type].map{ |key| params[key] }.join + APP_CONFIG[:quickpay_secret])
    end

    def base_hash_for_quickpay
      {:protocol => "4", :msgtype => "authorize",  :merchant => APP_CONFIG[:quickpay_merchant_id],
       :autocapture => "1", :cardtypelock => "dankort", :testmode => Rails.env.production? ? "0" : "1" }
    end
  end
end