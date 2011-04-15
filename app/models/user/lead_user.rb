class ::User::LeadUser < ::User
  ROLES = [:lead_user]

  include User::Subaccounts

  has_many :lead_requests,
           :foreign_key => :requested_by,
           :after_add => :set_owner

  has_many :lead_purchases,
           :foreign_key => :assignee_id,
           :conditions => "accessible_from IS NOT NULL",
           :include => :lead

  has_many :assigned_lead_purchases, :foreign_key => :assignee_id, :class_name => "LeadPurchase", :conditions => "accessible_from IS NOT NULL"
  has_many :assigned_leads, :class_name => "Lead", :through => :assigned_lead_purchases, :conditions => "accessible_from IS NOT NULL", :source => :lead

  alias_method :accessible_lead_purchases, :lead_purchases

  private

  def set_owner(lead_request)
    lead_request.update_attribute(:owner_id, parent_id || id)
  end

end
