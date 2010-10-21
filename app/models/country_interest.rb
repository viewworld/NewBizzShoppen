class CountryInterest < ActiveRecord::Base
  belongs_to :country
  belongs_to :user, :foreign_key => 'user_id'
end
