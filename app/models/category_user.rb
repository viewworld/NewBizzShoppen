class CategoryUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  before_create :set_user_type

  def set_user_type
    self.user_type = user.role.to_s
  end
end
