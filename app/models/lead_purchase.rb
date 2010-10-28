class LeadPurchase < LeadPurchaseBase
  belongs_to :assignee, :class_name => "User::LeadUser", :foreign_key =>  "assignee_id"

  default_scope where(:requested_by => nil)

  scope :in_cart, where(:paid => false, :accessible => false)
end
