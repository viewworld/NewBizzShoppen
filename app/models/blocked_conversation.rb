class BlockedConversation < ActiveRecord::Base
  belongs_to :buyer, :class_name => "User::Abstract", :foreign_key => "buyer_id"
  belongs_to :agent, :class_name => "User::Abstract", :foreign_key => "agent_id"
  belongs_to :lead
end
