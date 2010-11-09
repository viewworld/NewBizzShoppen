class LeadPurchase < LeadPurchaseBase
  CSV_ATTRS = %w(header description company_name lead_name phone_number email_address address)

  belongs_to :assignee, :class_name => "User::LeadUser", :foreign_key =>  "assignee_id"
  belongs_to :lead

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

  public

  class << self

    def to_csv(*ids)
      FasterCSV.generate(:force_quotes => true) do |csv|
        csv << CSV_ATTRS.map(&:humanize)
        find(ids).each { |lp| csv << CSV_ATTRS.map { |attr| lp.lead[attr] } }
      end
    end

  end

  def to_csv
    LeadPurchase.to_csv(id)    
  end

end
