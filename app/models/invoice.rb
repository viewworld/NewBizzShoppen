class Invoice < ActiveRecord::Base
  PAYMENT_METHODS = [:bank_transfer, :cash]

  MARKUP_SCAFFOLD = %{<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
          <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <style type="text/css">
              @import url("../stylesheets/invoice.css") print;
            </style>
          </head>
          <body>
            %s
          </body>
        </html>}

  include ScopedSearch::Model
  include MultiScopedOrder

  belongs_to :user
  belongs_to :currency
  belongs_to :bank_account
  belongs_to :seller

  # TODO not sure here if it should be possible to delete paid invoice
  has_many :payment_transactions, :dependent => :destroy
  has_many :invoice_lines, :dependent => :destroy, :order => "name"
  has_many :invoice_lines_grouped_by_vat_rate, :select => "vat_rate, SUM(invoice_lines.netto_value) as netto_value_sum,
                                                           SUM(invoice_lines.vat_value) as vat_value_sum,
                                                           SUM(invoice_lines.brutto_value) as brutto_value_sum",
           :group => "vat_rate", :class_name => "InvoiceLine"

  has_one :customer_address, :class_name => '::Address::InvoiceCustomer', :as => :addressable
  has_one :seller_address, :class_name => '::Address::InvoiceSeller', :as => :addressable
  has_one :credit_note

  scope :ascend_by_invoice_number, order("YEAR(invoices.creation_date) ASC, invoices.number ASC, company_id ASC")
  scope :descend_by_invoice_number, order("YEAR(invoices.creation_date) DESC, invoices.number DESC, company_id ASC")
  scope :creation_date_in_year, lambda{ |date| where(["(date_part('year', created_at) = ?)", date.year]) }
  scope :with_sale_date_after_and_including, lambda{ |date| where(["sale_date >= ?",date])}
  scope :with_sale_date_before_and_including, lambda{ |date| where(["sale_date <= ?",date])}
  scope :not_paid, where(:paid_at => nil)
  scope :with_keyword, lambda{ |keyword| joins(:customer_address).where("users.email like :keyword OR users.first_name like :keyword OR users.last_name like :keyword OR invoices.seller_name like :keyword OR invoices.number::TEXT = :number_keyword OR lower(invoices.customer_name) LIKE :keyword OR lower(addresses.address_line_1) LIKE :keyword OR lower(addresses.address_line_2) LIKE :keyword OR lower(addresses.address_line_3) LIKE :keyword OR lower(addresses.zip_code) LIKE :keyword OR lower(leads.header) LIKE :keyword OR lower(leads.contact_name) LIKE :keyword OR lower(leads.company_name) LIKE :keyword OR lower(leads.email_address) LIKE :keyword", {:keyword => "%#{keyword.downcase}%", :number_keyword => "#{keyword.downcase}"}).joins("LEFT JOIN invoice_lines ON invoices.id=invoice_lines.invoice_id LEFT JOIN lead_purchases ON invoice_lines.payable_id=lead_purchases.id LEFT JOIN leads ON lead_purchases.lead_id=leads.id").joins(:user) }
  scope :ascend_by_customer, joins(:user).order("users.first_name||' '||users.last_name ASC")
  scope :descend_by_customer, joins(:user).order("users.first_name||' '||users.last_name DESC")
  scope :ascend_by_total, joins("LEFT JOIN invoice_lines ON invoice_lines.invoice_id = invoices.id").group(column_names.map{|c| 'invoices.'+c}.join(',')).order("SUM(invoice_lines.brutto_value) ASC")
  scope :descend_by_total, joins("LEFT JOIN invoice_lines ON invoice_lines.invoice_id = invoices.id").group(column_names.map{|c| 'invoices.'+c}.join(',')).order("SUM(invoice_lines.brutto_value) DESC")
  scope :with_paid, lambda{|paid| paid.to_i==1 ? where("invoices.paid_at IS NOT NULL") : where("invoices.paid_at IS NULL")}
  scope :for_user, lambda{|user| where(:user_id => user.to_i)}
  scope :total_paid, where("invoices.paid_at IS NOT NULL")
  scope :total_not_paid, where("invoices.paid_at IS NULL")

  validates_presence_of :user, :seller
  validates_associated :invoice_lines, :seller

  after_create :duplicate_company_and_customer_information, :set_year
  after_validation :set_default_currency, :if => Proc.new{ |i| i.new_record? }
  after_update :cache_total_words, :update_revenue_frozen
  after_create :generate_invoice_lines_for_big_buyer
  before_update :generate_manual_transaction_for_big_buyer
  before_save :mark_all_invoice_lines_as_paid
  after_save :recalculate_invoice_items
  after_initialize :set_seller

  #Uncomment reject_if, if not validating invoice lines
  accepts_nested_attributes_for :invoice_lines, :allow_destroy => true #,:reject_if => lambda { |a| a[:name].blank? }
  accepts_nested_attributes_for :customer_address, :seller_address

  scoped_order :revenue_frozen, :paid_at, :number, :sale_date, :seller_name
  multi_scoped_order :sale_date_and_number

  protected

  def set_seller
    self.seller = Seller.default if !seller
  end

  def update_revenue_frozen
    Invoice.update_all ["revenue_frozen = (select sum(revenue_frozen) from invoice_lines where invoice_id = ?)",id], ["id = ?",id]
  end

  def cache_total_words
    Invoice.update_all ["total_in_words = ?",EnglishNumerals.to_English(total)], ["id = ?",id]
  end

  private

  #TODO
  def set_default_currency
    self.currency = Currency.first unless currency
  end

  def duplicate_company_and_customer_information
    self.update_attributes({
            :customer_name => user.with_role.full_name,
            :customer_address => ::Address::InvoiceCustomer.new(user.with_role.address.attributes),
            :customer_vat_no => user.with_role.vat_number,
            :seller_address => ::Address::InvoiceSeller.new(seller.address.attributes),
            :seller_name => seller.company_name,
            :seller_vat_no => seller.vat_no,
            :seller_first_name => seller.first_name,
            :seller_last_name => seller.last_name,
            :charge_vat => !user.with_role.not_charge_vat?,
            :bank_account => payment_bank_account
    })
  end

  def payment_bank_account
    user.bank_account || seller.bank_account || BankAccount.country_default_bank_account(user.address.country).first || BankAccount.global_default_bank_account.first
  end

  def set_year
    self.update_attribute :creation_date, Time.now
    self.update_attribute :sale_date, Time.now
    self.update_attribute :payment_deadline_date, Time.now + Settings.invoicing_default_payment_deadline_date.to_i.days
    update_number_according_to_year
  end

  def update_number_according_to_year
    self.update_attribute(:number, (seller.invoices.creation_date_in_year(creation_date).maximum(:number) || 0)+1)
  end

  def get_template_source
    File.open(File.join(::Rails.root.to_s, "app", "views", "shared", "invoices", "_invoice_preview.erb")){|file| file.read}
  end

  def generate_invoice_lines_for_big_buyer
    if user and user.big_buyer?
      User::Customer.find(user_id).lead_purchases.select { |lp| lp.invoice_line.blank? and lp.lead.currency_id == currency_id }.each do |lead_purchase|
        InvoiceLine.create(
            :invoice => self,
            :payable => lead_purchase,
            :name => lead_purchase.lead.header,
            :netto_price => lead_purchase.lead.price,
            :vat_rate => user.country_vat_rate,
            :quantity => lead_purchase.quantity)
      end
    end
  end

  def generate_manual_transaction_for_big_buyer
    if paid_at_changed? and cash_flow_changed? and user and user.big_buyer?
      ManualTransaction.create(:invoice => self, :amount => cash_flow, :paid_at => Time.now)
    end
  end

  def mark_all_invoice_lines_as_paid
    if paid_at_changed?
      invoice_lines.each do |invoice_line|
        invoice_line.update_attribute(:paid_at, paid_at)
      end
    end
  end

  def recalculate_invoice_items
    invoice_lines.reload && invoice_lines.each{|ii| ii.calculate_additional_values! }
  end

  public

  #-------------------------------------------------------------------
  #------------------------ { CLASS METHODS } ------------------------
  #-------------------------------------------------------------------

  class << self

  end

  #-------------------------------------------------------------------
  #---------------------- { INSTANCE METHODS } -----------------------
  #-------------------------------------------------------------------

  def markup(current_user)
    av = ActionView::Base.new
    av.assigns[:invoice] = self
    av.instance_eval do
      extend InvoiceHelper
      extend ApplicationHelper
    end

    html_template = get_template_source
    html_markup = [:original].map do |version|
      av.render(:inline => html_template, :type => :erb, :layout => '/app/views/layouts/pdf', :locals => {:version => version, :invoice => self, :current_user => current_user})
    end.join

    MARKUP_SCAFFOLD % html_markup
  end

  def temp_invoice_path
    Rails.root.join("public/html2pdf/#{filename}.html")
  end

  def store_pdf(current_user)
    File.open(temp_invoice_path, 'w') {|f| f.write(markup(current_user)) }
    `python public/html2pdf/pisa.py #{temp_invoice_path} #{filepath}`
    File.delete(temp_invoice_path)
    filepath
  end

  def filepath(extension='pdf')
    Rails.root.join "public/html2pdf/invoice_cache/#{filename}.#{extension}"
  end

  def filename
    "invoice_#{number}_#{creation_date.year}_#{user.full_name.downcase.gsub(/[-&^%$@!~"'* ,.\/\\]/, '_')}"
  end

  def total(without_credited=false)
    il = invoice_lines.scoped
    il = il.where("is_credited = ?", false) if without_credited
    il.sum('brutto_value')
  end

  def revenue
    invoice_lines.sum('revenue_frozen')
  end

  def total_netto
    invoice_lines.sum('netto_value')
  end

  def total_vat
    invoice_lines.sum('vat_value')
  end

  def full_number
    "#{number}/#{creation_date.year}"
  end

  def paid?
    !!paid_at
  end

  def sent?
    !!emailed_at
  end

  def status
    return :paid if paid?
    return :sent if sent?
    return :new
  end

  def ribbon_colour
    case status
      when :paid then
        "green"
      when :sent then
        "blue"
      else
        "red"
    end
  end

end