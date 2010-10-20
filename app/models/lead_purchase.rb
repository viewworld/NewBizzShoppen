class LeadPurchase < ActiveRecord::Base

  belongs_to :lead

  #it may be necessary to cast the users objects into the appropriate subclass
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  belongs_to :assignee, :class_name => "User", :foreign_key =>  "assignee_id"
end
