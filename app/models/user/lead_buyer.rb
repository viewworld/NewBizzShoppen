class ::User::LeadBuyer < ::User
  ROLES = [:lead_buyer, :lead_user]

  include User::Subaccounts

  has_many :lead_purchases, :foreign_key => :owner_id
  has_many :leads_in_cart,
           :class_name => "Lead",
           :through => :lead_purchases,
           :conditions => {"lead_purchases.accessible_from" => nil, "lead_purchases.paid" => false, "lead_purchases.requested_by" => nil},
           :source => :lead
  has_many :invoices, :foreign_key => "user_id"
  has_many :bought_leads, :through => :lead_purchases, :class_name => "Lead", :source => :lead, :conditions => "accessible_from IS NOT NULL"
end