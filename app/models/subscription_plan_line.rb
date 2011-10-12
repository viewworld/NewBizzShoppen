class SubscriptionPlanLine < ActiveRecord::Base
  belongs_to :subscription_plan

  validates_presence_of :name, :price
  validates_numericality_of :price
end
