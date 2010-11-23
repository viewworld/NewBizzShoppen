class LeadPurchase < LeadPurchaseBase
  CSV_ATTRS = %w(header description company_name contact_name phone_number email_address address)
  ACTIVE               = 0.freeze
  ABOUT_TO_EXPIRE      = 1.freeze
  EXPIRED              = 2.freeze

  belongs_to :assignee, :class_name => "User::LeadUser", :foreign_key =>  "assignee_id"
  belongs_to :lead, :counter_cache => :lead_purchases_counter

  default_scope where(:requested_by => nil)

  scope :in_cart, where(:paid => false, :accessible => false)
  scope :accessible, where(:accessible => true)

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
