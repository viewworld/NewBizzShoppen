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

  belongs_to :user
  belongs_to :currency, :class_name => "CurrencyCode", :foreign_key => :currency_id

  has_many :invoice_lines, :dependent => :destroy
  has_many :invoice_lines_grouped_by_vat_rate, :select => "SUM(invoice_lines.netto_value) as netto_value_sum,
                                                           SUM(invoice_lines.vat_value) as vat_value_sum,
                                                           SUM(invoice_lines.brutto_value) as brutto_value_sum",
           :group => "vat_rate", :class_name => "InvoiceLine"


  named_scope :ascend_by_invoice_number, :order => "YEAR(invoices.creation_date) ASC, invoices.number ASC, company_id ASC"
  named_scope :descend_by_invoice_number, :order => "YEAR(invoices.creation_date) DESC, invoices.number DESC, company_id ASC"
  scope :creation_date_in_year, where({})

  validates_presence_of :user_id
  validates_associated :invoice_lines


  after_create :duplicate_company_and_customer_information, :set_year
  after_validation_on_create :set_default_currency
  after_update :cache_total_words, :update_revenue_frozen

  #Uncomment reject_if, if not validating invoice lines
  accepts_nested_attributes_for :invoice_lines, :allow_destroy => true #,:reject_if => lambda { |a| a[:name].blank? }

  protected

  def update_revenue_frozen
    Invoice.update_all ["revenue_frozen = (select sum(revenue_frozen) from invoice_lines where invoice_id = ?)",id], ["id = ?",id]
  end

  def cache_total_words
#    self.total_in_words = InvoiceHelper.number_in_words_ext(total, currency.symbol)
#    self.send :update_without_callbacks
  end

  private

  def set_default_currency
#    self.currency_id = CurrencyCode.find_by_short_name("PLN")
  end

  def duplicate_company_and_customer_information
    self.update_attributes({
            :customer_name => user.full_name,
            :customer_address => user.address,
            :customer_vat_no => "User vat",
            :seller_address => "Address from settings",
            :seller_name => "Seller name from settings",
            :seller_vat_no => "Seller vat from settings",
            :seller_first_name => "Seller first name from settings",
            :seller_last_name => "Seller last name from settings",
            :payment_account_information => "Payment account from settings"
    })
  end

  def set_year
    self.update_attribute :creation_date, Time.now
    self.update_attribute :sale_date, Time.now
    self.update_attribute :payment_deadline_date, Time.now + Settings.default_payment_deadline_date.days
    update_number_according_to_year
  end

  def update_number_according_to_year
    self.update_attribute(:number, (user.invoices.creation_date_in_year(creation_date).maximum(:number) || 0)+1)
  end

  def get_template_source
    File.open(File.join((Rails::Configuration.new.view_path), "invoicing", "invoices", "_invoice_preview.erb")){|file| file.read}
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