class SubscriptionPlanLine < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true, :foreign_key => "resource_id"

  validates_presence_of :name, :price
  validates_numericality_of :price
end
