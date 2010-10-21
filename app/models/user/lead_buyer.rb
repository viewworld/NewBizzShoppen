class ::User::LeadBuyer < ::User
  before_create :set_role

  def set_role
    self.roles = [:lead_buyer, :lead_user]
  end

  has_many :country_interests, :foreign_key => 'user_id'
  has_many :category_interests, :foreign_key => 'user_id'
  has_many :countries, :through => :country_interests
  has_many :categories, :through => :category_interests
end