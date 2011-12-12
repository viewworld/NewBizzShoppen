class PaymentNotification < ActiveRecord::Base
  serialize :params

  belongs_to :supplier, :foreign_key => "buyer_id", :class_name => "User"

  include ScopedSearch::Model

  scope :with_keyword, lambda { |q| where("lower(params) like ?", "%#{q.downcase}%") }
end
