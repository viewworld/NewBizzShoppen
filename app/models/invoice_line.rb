class InvoiceLine < ActiveRecord::Base

  attr_accessor :payable_update

  validates_presence_of :name, :netto_price, :quantity
  belongs_to :payable, :polymorphic => true
  belongs_to :invoice

  after_save :update_frozen_revenue
  before_save :mark_as_paid
  before_create :calculate_additional_values

  private

  def update_frozen_revenue
    InvoiceLine.update_all "revenue_frozen = brutto_value", ["id = ?", id]
  end

  def mark_as_paid
    if !invoice.paid_at.blank? and paid_at.blank?
      self.paid_at = invoice.paid_at
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
    self.vat_value = netto_value * vat_rate
  end

  def calculate_brutto_value
    self.brutto_value = netto_value + vat_value
  end

  def calculate_additional_values
    if netto_value.blank? or vat_value.blank? or brutto_value.blank?
      calculate_netto_value
      calculate_vat_value
      calculate_brutto_value
    end
  end
end