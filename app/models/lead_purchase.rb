class LeadPurchase < LeadPurchaseBase
  CSV_ATTRS = %w(header description company_name contact_name phone_number email_address address)
  ACTIVE               = 0.freeze
  ABOUT_TO_EXPIRE      = 1.freeze
  EXPIRED              = 2.freeze

  NOT_CONTACTED        = 0.freeze
  CONTACTED            = 1.freeze

  RATING_EXCELLENT =              0
  RATING_VERY_GOOD =              1
  RATING_SATISFACTORY =           2
  RATING_MISSING_CONTACT_INFO =   12
  RATING_INCORRECT_DESCRIPTION =  13
  RATING_ANOTHER_SUPPLIER =       14
  RATING_OTHER_REASON =           15

  RATING_LEVELS = [RATING_EXCELLENT, RATING_VERY_GOOD, RATING_SATISFACTORY, RATING_MISSING_CONTACT_INFO, RATING_INCORRECT_DESCRIPTION,
                   RATING_ANOTHER_SUPPLIER, RATING_OTHER_REASON]

  belongs_to :assignee, :class_name => "User::LeadUser", :foreign_key =>  "assignee_id"
  belongs_to :lead, :counter_cache => :lead_purchases_counter

  default_scope where(:requested_by => nil)

  scope :in_cart, where(:paid => false, :accessible => false)
  scope :accessible, where(:accessible => true)
  scope :about_to_expire, lambda { where(["response_deadline = ? AND expiration_status = ? AND contacted = ?", Date.today+2.days, ACTIVE, NOT_CONTACTED]) }
  scope :expired, lambda { where(["response_deadline < ? AND expiration_status = ? AND contacted = ?", Date.today, ABOUT_TO_EXPIRE, NOT_CONTACTED]) }

  before_save :assign_to_proper_owner_if_accessible
  before_save :assign_to_owner
  before_save :change_contacted_state
  before_save :handle_new_deadline
  before_save :set_assigned_at
  after_save :deliver_lead_rated_as_unsatisfactory_email
  after_save :deliver_about_to_expire_email

  liquid :id, :header, :rating_level_as_text, :rating_reason

  private

  def assign_to_proper_owner_if_accessible
    if (u = User.find(owner_id)) && u.parent
      if (new_record? && accessible) || (changes["accessible"] == [false, true])
        self.owner_id = u.parent_id
      end
    end
  end

  def assign_to_owner
    self.assignee_id = owner.id if !assignee and owner
  end

  def change_contacted_state
    if state_changed? and state_was == NOT_CONTACTED
      self.contacted = CONTACTED
      self.expiration_status = ACTIVE
    end
  end

  def handle_new_deadline
    if response_deadline_changed? and contacted == NOT_CONTACTED
      self.expiration_status = if (response_deadline-Date.today).to_i < 0
        EXPIRED
      elsif (0..2).include?((response_deadline-Date.today).to_i)
        ABOUT_TO_EXPIRE
      else
        ACTIVE
      end
    end
  end

  def deliver_about_to_expire_email
    if expiration_status_changed? and expiration_status == ABOUT_TO_EXPIRE and contacted == NOT_CONTACTED
      deliver_email_template("lead_purchase_is_about_to_expire")
    end
  end

  def deliver_lead_rated_as_unsatisfactory_email
    if rating_level_changed? and rating_level >= RATING_MISSING_CONTACT_INFO
      self.lead.update_attribute(:has_unsatisfactory_rating, true)
      deliver_email_template("lead_rated_as_unsatisfactory", lead.creator.email)
    end
  end

  def set_assigned_at
    if !assignee_id.blank? and assignee_id_changed?
      self.assigned_at = Time.now
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

  def deliver_email_template(uniq_id, to=nil)
    ApplicationMailer.email_template(to.blank? ? owner.email : to, EmailTemplate.find_by_uniq_id(uniq_id), {:lead_purchase => self}).deliver
  end

  def about_to_expire!
    update_attribute(:expiration_status, ABOUT_TO_EXPIRE)
  end

  def expire!
    update_attribute(:expiration_status, EXPIRED)
  end

  def expiring?
    expiration_status == ABOUT_TO_EXPIRE and contacted == NOT_CONTACTED
  end

  def expired?
    expiration_status == EXPIRED
  end

  def rating_level_as_text
    I18n.t("activerecord.attributes.lead_purchase.rating_levels.rating_level#{rating_level}")
  end

end
