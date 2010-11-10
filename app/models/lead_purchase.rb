class LeadPurchase < LeadPurchaseBase
  belongs_to :assignee, :class_name => "User::LeadUser", :foreign_key =>  "assignee_id"
  belongs_to :lead, :counter_cache => :lead_purchases_counter

  default_scope where(:requested_by => nil)

  scope :in_cart, where(:paid => false, :accessible => false)

  before_save :assign_to_proper_owner_if_accessible

  private

  def assign_to_proper_owner_if_accessible
    if (u = User.find(owner_id)) && u.parent
      if (new_record? && accessible) || (changes["accessible"] == [false, true])
        self.owner_id = u.parent_id
      end
    end
  end

end
