class PaymentTransaction < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :payment_notification

  include ScopedSearch::Model

  attr_accessor :invoice_number

  scope :with_invoices, :include => [:invoice]
  scope :with_keyword, lambda { |q| where("lower(invoices.customer_name) like :keyword OR lower(invoices.customer_address) like :keyword",  {:keyword => "%#{q.downcase}%"}).joins("INNER JOIN invoices on payment_transactions.invoice_id=invoices.id") }

  validates_presence_of :invoice_id, :amount, :paid_at
end
