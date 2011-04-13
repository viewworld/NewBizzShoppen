class ::User::LeadBuyer < ::User
  ROLES = [:lead_buyer, :lead_user]

  include User::Subaccounts

  has_many :lead_purchases, :foreign_key => :owner_id
  has_many :lead_buyouts, :foreign_key => :owner_id
  has_many :lead_primary_purchases, :foreign_key => :owner_id
  has_many :lead_single_purchases, :foreign_key => :owner_id
  has_many :lead_additional_buyouts, :foreign_key => :owner_id
  has_many :leads_in_cart,
           :class_name => "Lead",
           :through => :lead_purchases,
           :conditions => {"lead_purchases.accessible_from" => nil, "lead_purchases.paid" => false, "lead_purchases.requested_by" => nil},
           :source => :lead
  has_many :lead_purchases_in_cart,
           :class_name => "LeadPurchase",
           :conditions => { :accessible_from => nil, :paid => false, :requested_by => nil},
           :include => :lead,
           :foreign_key => :owner_id
  has_many :invoices, :foreign_key => "user_id"
  has_many :bought_leads, :through => :lead_purchases, :class_name => "Lead", :source => :lead, :conditions => "accessible_from IS NOT NULL"
  has_many :accessible_lead_purchases, :foreign_key => :owner_id, :class_name => "LeadPurchase", :conditions => "accessible_from IS NOT NULL"

  before_save :set_big_buyer

  def set_big_buyer
    self.big_buyer = parent.big_buyer if parent and self.big_buyer? != parent.big_buyer?
    true
  end
end