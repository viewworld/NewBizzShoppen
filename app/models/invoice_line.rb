class InvoiceLine < ActiveRecord::Base

  attr_accessor :payable_update

  validates_presence_of :name, :netto_price, :quantity
  belongs_to :payable, :polymorphic => true
  belongs_to :invoice

  after_save :update_frozen_revenue
  before_save :mark_as_paid

  private

  def update_frozen_revenue
    InvoiceLine.update_all "revenue_frozen = brutto_value", ["id = ?",id]
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
     payable_id ? payable_name :  "&nbsp;"
 end
end