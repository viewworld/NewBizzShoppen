class BlockedConversation < ActiveRecord::Base
  belongs_to :supplier, :class_name => "User::Abstract", :foreign_key => "supplier_id"
  belongs_to :agent, :class_name => "User::Abstract", :foreign_key => "agent_id"
  belongs_to :lead
end
