class ::User::Customer < ::User
  ROLE = :customer
  include User::RegularUser

  before_create :set_role

  has_many :lead_purchases, :foreign_key => "owner_id"

  accepts_nested_attributes_for :lead_purchases

  private

  def set_role
    self.roles = [:customer, :lead_buyer, :lead_user]
  end
end