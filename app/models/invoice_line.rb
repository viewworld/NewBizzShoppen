class InvoiceLine < ActiveRecord::Base

  attr_accessor :payable_update

  validates_presence_of :name, :netto_price, :quantity
  belongs_to :payable, :polymorphic => true
  belongs_to :invoice
  belongs_to :lead_purchase, :foreign_key => :payable_id

  after_save :update_frozen_revenue
  before_save :mark_as_paid
  before_save :calculate_additional_values
  before_save :handle_refunding

  private

  def handle_refunding
    if is_credited_changed? and is_credited? and paid? and invoice.credit_note.nil?
      Refund.create(:invoice => invoice)
    end
  end

  def paid?
    !!paid_at
  end

  def update_frozen_revenue
    InvoiceLine.update_all "revenue_frozen = brutto_value", ["id = ?", id]
  end

  def mark_as_paid
    if !invoice.paid_at.blank? and paid_at.blank?
      self.paid_at = invoice.paid_at
    end
  end

  def calculate_additional_values
    calculate_netto_value
    calculate_vat_value
    calculate_brutto_value
    calculate_vat_rate
  end

  def calculate_vat_rate
    self.vat_rate = 0 unless invoice.charge_vat?
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

  def payable_name
    (payable_id && payable.to_s)
  end

  def payable_name_for_hint
    payable_id ? payable_name : "&nbsp;"
  end

  def calculate_netto_value
    self.netto_value = quantity * netto_price
  end

  def calculate_vat_value
    self.vat_value = (invoice.charge_vat? ? netto_value * BigDecimal(vat_rate.to_s).div(100,4) : BigDecimal.new("0.0")).round(2)
  end

  def calculate_brutto_value
    self.brutto_value = (invoice.charge_vat? ? netto_value + vat_value : netto_value)
  end

  def calculate_additional_values!
    calculate_additional_values && save
  end

end