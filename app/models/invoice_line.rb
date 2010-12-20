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
    return brutto_value
  end

  def update_frozen_revenue
    InvoiceLine.update_all "revenue_frozen = brutto_value", ["id = ?",id]
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