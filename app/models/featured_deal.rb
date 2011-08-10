class FeaturedDeal < ActiveRecord::Base
  belongs_to :deal

  acts_as_list :scope => :deal

  validates_presence_of :deal, :position
end
