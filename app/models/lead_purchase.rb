class LeadPurchase < ActiveRecord::Base
  belongs_to :lead

  #it may be necessary to cast the users objects into the appropriate subclass
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  belongs_to :assignee, :class_name => "User", :foreign_key =>  "assignee_id"

  validates_presence_of :lead_id

  default_scope where(:requested_by => nil)

  scope :in_cart, where(:paid => false, :accessible => false)
end
