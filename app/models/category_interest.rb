class CategoryInterest < ActiveRecord::Base
  belongs_to :category
  belongs_to :user, :foreign_key => 'user_id'
end
