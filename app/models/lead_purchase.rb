class LeadPurchase < ActiveRecord::Base
  belongs_to :lead

  belongs_to :owner, :class_name => "User::Customer", :foreign_key => "owner_id"
  belongs_to :assignee, :class_name => "User::LeadUser", :foreign_key =>  "assignee_id"

  validates_presence_of :lead_id

  default_scope where(:requested_by => nil)

  scope :in_cart, where(:paid => false, :accessible => false)

  delegate :header, :description, :purchase_value, :to => :lead
end
