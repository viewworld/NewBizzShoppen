class ::User::Customer < ::User
  ROLES = [:customer, :lead_buyer]

  include User::RegistrationValidations

  has_many :lead_purchases, :foreign_key => "owner_id"
  has_many :lead_requests, :foreign_key => "owner_id"
  has_many :bought_leads, :through => :lead_purchases, :class_name => "Lead", :source => :lead

  has_many :country_interests, :foreign_key => 'user_id'
  has_many :category_interests, :foreign_key => 'user_id'
  has_many :countries, :through => :country_interests
  has_many :categories, :through => :category_interests
  has_many :invoices, :foreign_key => "user_id"
  has_many :category_customers, :foreign_key => "user_id"
  has_many :unique_categories, :through => :category_customers, :foreign_key => "user_id", :source => :category

  accepts_nested_attributes_for :lead_purchases
end