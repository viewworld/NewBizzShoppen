class LeadPurchase < LeadPurchaseBase
  CSV_ATTRS = %w(header description company_name contact_name phone_number email_address address)
  ACTIVE               = 0
  ABOUT_TO_EXPIRE      = 1
  EXPIRED              = 2

  NOT_CONTACTED        = 0
  CONTACTED            = 1

  RATING_EXCELLENT =              0
  RATING_VERY_GOOD =              1
  RATING_SATISFACTORY =           2
  RATING_MISSING_CONTACT_INFO =   12
  RATING_INCORRECT_DESCRIPTION =  13
  RATING_ANOTHER_SUPPLIER =       14
  RATING_OTHER_REASON =           15

  UNSATISFACTORY_RATING_LEVELS = [RATING_MISSING_CONTACT_INFO, RATING_INCORRECT_DESCRIPTION,
                          RATING_ANOTHER_SUPPLIER, RATING_OTHER_REASON]
  RATING_LEVELS = [RATING_EXCELLENT, RATING_VERY_GOOD, RATING_SATISFACTORY] + UNSATISFACTORY_RATING_LEVELS

  belongs_to :assignee, :class_name => "User::LeadUser", :foreign_key =>  "assignee_id"
  belongs_to :lead, :counter_cache => :lead_purchases_counter
  has_one :invoice_line, :as => :payable

  default_scope where(:requested_by => nil)

  scope :in_cart, where(:paid => false, :accessible_from => nil)
  scope :accessible, where("accessible_from IS NOT NULL")
  scope :about_to_expire, lambda { where(["response_deadline = ? AND expiration_status = ? AND contacted = ?", Date.today+2.days, ACTIVE, NOT_CONTACTED]) }
  scope :expired, lambda { where(["response_deadline < ? AND expiration_status = ? AND contacted = ?", Date.today, ABOUT_TO_EXPIRE, NOT_CONTACTED]) }
  scope :with_paid, lambda {|paid| where(:paid => paid) }

  scope :with_volume_sold_by, lambda { |agent| where("leads.creator_id = ?", agent.id).joins("INNER JOIN leads ON lead_purchases.lead_id=leads.id") }
  scope :with_rating_avg_by, lambda { |agent| select("avg(CASE WHEN rating_level in (#{Array(RATING_MISSING_CONTACT_INFO..RATING_OTHER_REASON).join(',')}) THEN 0 WHEN rating_level=2 THEN 0.25 WHEN rating_level=1 THEN 0.5 WHEN rating_level=0 THEN 1 END)*100 as id").where("creator_id = ? and (lead_purchases.rating_level != -1 and lead_purchases.rating_level is NOT NULL)", agent.id).joins("INNER JOIN leads ON lead_purchases.lead_id=leads.id") }
  scope :with_purchased_time_ago_by, lambda { |agent, time| where("creator_id = ? and accessible_from IS NOT NULL and accessible_from >= ?", agent.id, time).joins("INNER JOIN leads ON lead_purchases.lead_id=leads.id") }

  scope :with_not_invoiced, select("lead_purchases.owner_id, leads.currency_id, count(lead_purchases.id) as not_invoiced_count, sum(leads.price) as not_invoiced_sum").joins("inner join leads on leads.id=lead_purchases.lead_id inner join users on users.id=lead_purchases.owner_id left outer join invoice_lines on lead_purchases.id=invoice_lines.payable_id").where("invoice_lines.payable_id is NULL and users.big_buyer = ?", true).group("owner_id,currency_id")
  scope :with_not_invoiced_keyword, lambda { |keyword| where("lower(leads.header) LIKE :keyword OR lower(leads.contact_name) LIKE :keyword OR lower(leads.company_name) LIKE :keyword", { :keyword => "%#{keyword.downcase}%" }) }
  scope :with_assigned_at_date_after_and_including, lambda{ |date| where(["assigned_at::DATE >= ?",date])}
  scope :with_assigned_at_date_before_and_including, lambda{ |date| where(["assigned_at::DATE <= ?",date])}

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
      if (new_record? && !accessible_from.nil?) || (accessible_from_changed? && !accessible_from.nil?)
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
    if rating_level_changed? and !rating_level.nil? and rating_level >= RATING_MISSING_CONTACT_INFO
      self.lead.update_attributes(:notify_buyers_after_update => false, :has_unsatisfactory_rating => true)
      deliver_email_template("lead_rated_as_unsatisfactory", lead.creator.email)
    end
  end

  def set_assigned_at
    if !assignee_id.blank? and assignee_id_changed?
      self.assigned_at = Time.now
    end
  end

  def paid!
    self.paid = true
    self.accessible_from = Time.now
    save
  end

  public

  class << self

    def to_csv(*ids)
      FasterCSV.generate(:force_quotes => true) do |csv|
        lead_purchases = find(ids)
        templates = lead_purchases.map { |lp| lp.lead.lead_templates }.flatten.uniq
        template_fields = templates.map { |t| t.lead_template_fields }.flatten
        csv << CSV_ATTRS.map(&:humanize) + template_fields.map(&:name)
        lead_purchases.each { |lp| csv << CSV_ATTRS.map { |attr| lp.lead[attr] } + template_fields.map { |tf| tf.value_for_lead(lp.lead) } }
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

  def rating_as_percentage
    if rating_level == RATING_EXCELLENT
      1
    elsif rating_level == RATING_VERY_GOOD
      0.5
    elsif rating_level == RATING_SATISFACTORY
      0.25
    elsif (RATING_MISSING_CONTACT_INFO..RATING_OTHER_REASON).include?(rating_level)
      0
    else
      -1
    end
  end

  def is_rated_as_unsatisfactory?
    UNSATISFACTORY_RATING_LEVELS.include?(rating_level)
  end

end
