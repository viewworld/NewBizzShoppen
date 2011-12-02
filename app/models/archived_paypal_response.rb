class ArchivedPaypalResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :subscription, :polymorphic => true
end
