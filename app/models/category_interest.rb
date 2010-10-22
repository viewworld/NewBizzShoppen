class CategoryInterest < ActiveRecord::Base
  belongs_to :category
  belongs_to :user, :foreign_key => 'user_id' #TODO Do we need that foreign key here ?
end
