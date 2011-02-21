class PaymentTransaction < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :payment_notification

  include ScopedSearch::Model

  attr_accessor :invoice_number

  scope :with_invoices, :include => [:invoice]
  scope :with_keyword, lambda { |q| where("invoices.number::TEXT = :number_keyword OR lower(leads.header) LIKE :keyword OR lower(leads.contact_name) LIKE :keyword OR lower(leads.company_name) LIKE :keyword OR lower(invoices.customer_name) like :keyword OR lower(customer_address.address_line_1) like :keyword OR lower(customer_address.address_line_2) like :keyword OR lower(customer_address.address_line_3) like :keyword OR lower(customer_address.zip_code) like :keyword",  {:number_keyword => "#{q.downcase}", :keyword => "%#{q.downcase}%"}).joins("INNER JOIN invoices ON invoices.id = payment_transactions.invoice_id INNER JOIN invoice_lines ON invoices.id=invoice_lines.invoice_id INNER JOIN lead_purchases ON invoice_lines.payable_id=lead_purchases.id INNER JOIN leads ON lead_purchases.lead_id=leads.id INNER JOIN addresses customer_address ON customer_address.addressable_id = invoices.id AND customer_address.addressable_type = 'Invoice'") }
  scope :with_sale_date_after_and_including, lambda{ |date| where(["invoices.sale_date >= ?",date]).joins("INNER JOIN invoices ON payment_transactions.invoice_id=invoices.id") }
  scope :with_sale_date_before_and_including, lambda{ |date| where(["invoices.sale_date <= ?",date]).joins("INNER JOIN invoices ON payment_transactions.invoice_id=invoices.id") }

  validates_presence_of :invoice_id, :amount, :paid_at

  def paid_at_date
    paid_at ? paid_at.to_date : '-'
  end
end
