class ::User::CategoryBuyer < ::User
  ROLES = [:category_buyer, :lead_buyer, :customer]

  after_create :set_interests

  include User::RegistrationValidations

  has_many :lead_purchases, :foreign_key => "owner_id"
  has_many :lead_requests, :foreign_key => "owner_id"

  has_many :country_interests, :foreign_key => 'user_id'
  has_many :category_interests, :foreign_key => 'user_id'
  has_many :countries, :through => :country_interests
  has_many :categories, :through => :category_interests
  has_many :invoices, :foreign_key => "user_id"
  accepts_nested_attributes_for :lead_purchases

  private

  def set_interests
    categories << category
  end
end