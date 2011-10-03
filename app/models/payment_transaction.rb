class PaymentTransaction < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :payment_notification

  include ScopedSearch::Model

  attr_accessor :invoice_number

  scope :with_invoices, :include => [:invoice]
  scope :with_keyword, lambda { |q|
    where("invoices.number::TEXT = :number_keyword OR lower(leads.header) LIKE :keyword OR lower(leads.contact_name) LIKE :keyword OR lower(leads.company_name) LIKE :keyword OR lower(invoices.supplier_name) like :keyword OR lower(addresses.address_line_1) like :keyword OR lower(addresses.address_line_2) like :keyword OR lower(addresses.address_line_3) like :keyword OR lower(addresses.zip_code) like :keyword",  {:number_keyword => "#{q.downcase}", :keyword => "%#{q.downcase}%"}).
    joins(:invoice => [{:invoice_lines => {:lead_purchase => [:lead]}}, :supplier_address] ) }
  scope :with_sale_date_after_and_including, lambda{ |date| where(["invoices.sale_date >= ?",date.to_postgresql_date]) }
  scope :with_sale_date_before_and_including, lambda{ |date| where(["invoices.sale_date <= ?",date.to_postgresql_date]) }

  validates_presence_of :invoice_id, :amount, :paid_at
  validates_numericality_of :amount

  def paid_at_date
    paid_at ? paid_at.to_date : '-'
  end
end
