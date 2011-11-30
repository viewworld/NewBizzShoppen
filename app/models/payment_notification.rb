class PaymentNotification < ActiveRecord::Base
  serialize :params

  belongs_to :supplier, :foreign_key => "buyer_id", :class_name => "User"

end
