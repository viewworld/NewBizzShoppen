class ::User::LeadBuyer < ::User
  ROLES = [:lead_buyer, :lead_user]

  include User::Subaccounts

  has_many :country_interests, :foreign_key => 'user_id'
  has_many :category_interests, :foreign_key => 'user_id'
  has_many :countries, :through => :country_interests
  has_many :categories, :through => :category_interests
  has_many :lead_purchases, :foreign_key => :owner_id
  has_many :leads_in_cart,
           :class_name => "Lead",
           :through => :lead_purchases,
           :conditions => {"lead_purchases.accessible" => false, "lead_purchases.paid" => false, "lead_purchases.requested_by" => nil},
           :source => :lead

end