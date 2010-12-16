class InvoiceLine < ActiveRecord::Base

  attr_accessor :payable_update

  validates_presence_of :name, :netto_price, :quantity
  belongs_to :payable, :polymorphic => true
  belongs_to :invoice

  after_save :update_frozen_revenue
  after_validation_on_update :switch_project_or_version_id_from_redmine_to_diamond_mine
  after_validation_on_create :switch_project_or_version_id_from_redmine_to_diamond_mine

  named_scope :for_project, lambda{|project| {:select => "invoice_lines.*",
                                                     :conditions => ["(payable_type = 'Project' AND payable_id = :project_id) OR " +
                                                                     "(payable_type = 'Version' AND payable_id IN (:version_ids))",
                                                                     {:project_id => project.id, :version_ids => project.versions.map(&:id)}]}}

  private

  def calculated_revenue_in_pln
    if invoice.currency.short_name == "PLN"
      return brutto_value
    else
      require "money"
      Money.default_bank = Currency::ExchangeBank.new
      total_brutto_in_cts = (brutto_value*100.0).round
      total_brutto_in_cts_converted = Money.new(total_brutto_in_cts, invoice.currency.short_name).exchange_to("PLN")
      return (total_brutto_in_cts_converted.to_f)
    end
  end

  def update_frozen_revenue
    self.revenue_frozen = calculated_revenue_in_pln
    self.send :update_without_callbacks
  end

  def switch_project_or_version_id_from_redmine_to_diamond_mine
    if self.payable_id_changed?
      if payable_type == "Project"
        self.payable_id = Project.find_by_redmine_project_id(self.payable_id).id unless Project.find_by_redmine_project_id(self.payable_id).nil?
      end
      if payable_type == "Version"
        self.payable_id = Version.find_by_redmine_version_id(self.payable_id).id unless Version.find_by_redmine_version_id(self.payable_id).nil?
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

  def payable_name
    (payable_id && payable.to_s)
  end

 def payable_name_for_hint
     payable_id ? payable_name :  "&nbsp;"
 end
end