class ::User::Customer < ::User
  ROLE = :customer
  include User::RegularUser

  before_create :set_role

  private

  def set_role
    self.roles = [:customer, :lead_buyer, :lead_user]
  end
end