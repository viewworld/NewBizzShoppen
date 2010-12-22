class Invoice < ActiveRecord::Base
  PAYMENT_METHODS = [:bank_transfer, :cash]

  MARKUP_SCAFFOLD = %{<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
        <html>
          <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <style type="text/css">
              @import url("unicode.css") print;
              @import url("../public/stylesheets/invoice.css") print;
              @import url("css.css") print;
            </style>
          </head>
          <body>
            %s
          </body>
        </html>}

  TEMP_INVOICE_MARKUP_PATH = Rails.root.join("html2pdf/invoice.html")

  include ScopedSearch::Model
  include MultiScopedOrder

  belongs_to :user
  belongs_to :currency

  has_many :payment_transactions
  has_many :invoice_lines, :dependent => :destroy
  has_many :invoice_lines_grouped_by_vat_rate, :select => "vat_rate, SUM(invoice_lines.netto_value) as netto_value_sum,
                                                           SUM(invoice_lines.vat_value) as vat_value_sum,
                                                           SUM(invoice_lines.brutto_value) as brutto_value_sum",
           :group => "vat_rate", :class_name => "InvoiceLine"


  scope :ascend_by_invoice_number, order("YEAR(invoices.creation_date) ASC, invoices.number ASC, company_id ASC")
  scope :descend_by_invoice_number, order("YEAR(invoices.creation_date) DESC, invoices.number DESC, company_id ASC")
  scope :creation_date_in_year, lambda{ |date| where(["(date_part('year', created_at) = ?)", date.year]) }
  scope :with_sale_date_after_and_including, lambda{ |date| where(["sale_date >= ?",date])}
  scope :with_sale_date_before_and_including, lambda{ |date| where(["sale_date <= ?",date])}
  scope :not_paid, where(:paid_at => nil)
  scope :with_keyword, lambda{ |keyword| where("number LIKE :keyword OR lower(customer_name) LIKE :keyword OR lower(customer_address) LIKE :keyword OR lower(customer_vat_no) LIKE :keyword", {:keyword => "%#{keyword.downcase}%"}) }

  validates_presence_of :user_id
  validates_associated :invoice_lines


  after_create :duplicate_company_and_customer_information, :set_year
  after_validation :set_default_currency, :if => Proc.new{ |i| i.new_record? }
  after_update :cache_total_words, :update_revenue_frozen
  after_create :generate_invoice_lines_for_big_buyer
  before_save :mark_all_invoice_lines_as_paid

  #Uncomment reject_if, if not validating invoice lines
  accepts_nested_attributes_for :invoice_lines, :allow_destroy => true #,:reject_if => lambda { |a| a[:name].blank? }

  scoped_order :revenue_frozen, :paid_at
  multi_scoped_order :sale_date_and_number

  protected

  def update_revenue_frozen
    Invoice.update_all ["revenue_frozen = (select sum(revenue_frozen) from invoice_lines where invoice_id = ?)",id], ["id = ?",id]
  end

  def cache_total_words
    Invoice.update_all ["total_in_words = ?",InvoiceHelper.number_in_words_ext(total, currency.symbol)], ["id = ?",id]
  end

  private

  #TODO
  def set_default_currency
    self.currency = Currency.first
  end

  def duplicate_company_and_customer_information
    self.update_attributes({
            :customer_name => user.full_name,
            :customer_address => user.address,
            :customer_vat_no => "User vat",
            :seller_address => Settings.invoicing_seller_address,
            :seller_name => Settings.invoicing_seller_name,
            :seller_vat_no => Settings.invoicing_seller_vat_number,
            :seller_first_name => Settings.invoicing_seller_first_name,
            :seller_last_name => Settings.invoicing_seller_last_name,
            :payment_account_information => Settings.invoicing_seller_payment_account
    })
  end

  def set_year
    self.update_attribute :creation_date, Time.now
    self.update_attribute :sale_date, Time.now
    self.update_attribute :payment_deadline_date, Time.now + Settings.invoicing_default_payment_deadline_date.days
    update_number_according_to_year
  end

  def update_number_according_to_year
    self.update_attribute(:number, (Invoice.creation_date_in_year(creation_date).maximum(:number) || 0)+1)
  end

  def get_template_source
    File.open(File.join((Rails::Configuration.new.view_path), "invoicing", "invoices", "_invoice_preview.erb")){|file| file.read}
  end

  def generate_invoice_lines_for_big_buyer
    if user and user.big_buyer?
      User::Customer.find(user_id).lead_purchases.select { |lp| lp.invoice_line.blank? }.each do |lead_purchase|
        InvoiceLine.create(:invoice => self, :payable => lead_purchase, :name => lead_purchase.lead.header, :netto_price => lead_purchase.lead.price)
      end
    end
  end

  def mark_all_invoice_lines_as_paid
    if paid_at_changed?
      throw "d"
      invoice_lines.each do |invoice_line|
        invoice_line.update_attribute(:paid_at, paid_at)
      end
    end
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

  def markup
    av = ActionView::Base.new
    av.assigns[:invoice] = self
    av.instance_eval do
      extend InvoiceHelper
      extend ApplicationHelper
    end

    html_template = get_template_source
    html_markup = [:original, :copy].map do |version|
      av.render(:inline =>html_template, :type => :erb, :layout => false, :locals => {:version => version})
    end.join

    MARKUP_SCAFFOLD % html_markup
  end

  def store_pdf
    File.open(TEMP_INVOICE_MARKUP_PATH, 'w') {|f| f.write(markup) }
    if ENV['OS'] and ENV['OS'].include?("Windows")
      `xhtml2pdf html2pdf/invoice.html #{filepath}`
    else
      `python pisa.py #{TEMP_INVOICE_MARKUP_PATH} #{filepath}`
    end
    filepath
  end

  def filepath(extension='pdf')
    Rails.root.join "html2pdf/invoice_cache/#{filename}.#{extension}"
  end

  def filename
    "invoice_#{number}_#{creation_date.year}_#{customer.name.downcase.gsub(/[-&^%$@!~"'* ,.\/\\]/, '_')}"
  end

  def total
    invoice_lines.sum('brutto_value')
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