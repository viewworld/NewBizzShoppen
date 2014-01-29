class LeadPurchaseBase < ActiveRecord::Base
  set_table_name "lead_purchases"

  STATUSES = %w(not_contacted contacted meeting signed archived proposal).freeze

  belongs_to :lead
  belongs_to :owner, :class_name => "User::Supplier", :foreign_key => "owner_id"

  include ScopedSearch::Model

  CSV_ATTRS = %w(header description company_name contact_name phone_number email_address address)
  ACTIVE               = 0
  ABOUT_TO_EXPIRE      = 1
  EXPIRED              = 2

  NOT_CONTACTED        = 0
  CONTACTED            = 1
  ARCHIVED             = 4

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

  scope :accessible, where("accessible_from IS NOT NULL")
  scope :with_owner, lambda { |owner_id| where("owner_id = ?", owner_id) }
  scope :with_assignee, lambda { |assignee_id| where("assignee_id = ?", assignee_id) }
  scope :with_leads, joins("INNER JOIN leads on leads.id=lead_purchases.lead_id")
  scope :with_keyword, lambda { |q| where("lower(leads.header) like :keyword OR lower(leads.description) like :keyword OR lower(leads.creator_name) like :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :with_category, lambda { |category_id| where("leads.category_id = ?", category_id) }
  scope :with_deal_value_from, lambda { |from| where("leads.purchase_value >= ?", from) }
  scope :with_deal_value_to, lambda { |to| where("leads.purchase_value <= ?", to) }
  scope :with_country, lambda { |country_id| where("leads.country_id = ?", country_id) }
  scope :with_zip_code, lambda { |zip_code| where("leads.zip_code = ?", zip_code) }
  scope :with_requested_by, lambda { |requested_by| where("lead_purchases.requested_by = ?", requested_by) }
  scope :with_paid, lambda {|paid| where(:paid => paid) }
  scope :without_state, lambda { |state| where("lead_purchases.state <> ?", state) }

  scope :in_cart, where(:paid => false, :accessible_from => nil)
  scope :about_to_expire, lambda { where(["response_deadline = ? AND expiration_status = ? AND contacted = ?", Date.today+2.days, ACTIVE, NOT_CONTACTED]) }
  scope :expired, lambda { where(["response_deadline < ? AND expiration_status = ? AND contacted = ?", Date.today, ABOUT_TO_EXPIRE, NOT_CONTACTED]) }

  scope :with_volume_sold_by, lambda { |agent| where("leads.creator_id IN (?)", agent.has_role?(:call_centre) ? agent.subaccount_ids : agent.id).joins("INNER JOIN leads ON lead_purchases.lead_id=leads.id") }
  scope :with_rating_avg_by, lambda { |agent| select("avg(CASE WHEN rating_level in (#{Array(RATING_MISSING_CONTACT_INFO..RATING_OTHER_REASON).join(',')}) THEN 0 WHEN rating_level=2 THEN 0.25 WHEN rating_level=1 THEN 0.5 WHEN rating_level=0 THEN 1 END)*100 as id").where("creator_id = ? and (lead_purchases.rating_level != -1 and lead_purchases.rating_level is NOT NULL)", agent.id).joins("INNER JOIN leads ON lead_purchases.lead_id=leads.id") }
  scope :with_purchased_time_ago_by, lambda { |agent, time| where("creator_id = ? and accessible_from IS NOT NULL and accessible_from >= ?", agent.id, time).joins("INNER JOIN leads ON lead_purchases.lead_id=leads.id") }

  scope :with_not_invoiced, select("lead_purchases.owner_id, leads.currency_id, count(lead_purchases.id) as not_invoiced_count, sum(leads.price*lead_purchases.quantity) as not_invoiced_sum, sum(lead_purchases.euro_price*lead_purchases.quantity) as not_invoiced_euro_sum").joins("inner join leads on leads.id=lead_purchases.lead_id inner join users on users.id=lead_purchases.owner_id left outer join invoice_lines on lead_purchases.id=invoice_lines.payable_id").where("invoice_lines.payable_id is NULL").group("owner_id,leads.currency_id")
  scope :with_not_invoiced_keyword, lambda { |keyword| where("lower(leads.header) LIKE :keyword OR lower(leads.contact_name) LIKE :keyword OR lower(leads.company_name) LIKE :keyword", { :keyword => "%#{keyword.downcase}%" }) }
  scope :with_role, lambda { |role| where("users.roles_mask & #{2**User.valid_roles.index(role.to_sym)} > 0 ")}
  scope :with_assigned_at_date_after_and_including, lambda{ |date| where(["assigned_at::DATE >= ?",date.to_postgresql_date])}
  scope :with_assigned_at_date_before_and_including, lambda{ |date| where(["assigned_at::DATE <= ?",date.to_postgresql_date])}
  scope :with_purchased_by, lambda { |supplier| where("lead_purchases.requested_by IS NULL and (lead_purchases.owner_id = ? or lead_purchases.purchased_by = ?)", supplier.id, supplier.id) }
  scope :with_not_invoiced_for_user, lambda { |user| joins("LEFT JOIN invoice_lines ON invoice_lines.payable_id = lead_purchases.id LEFT JOIN users ON users.id = lead_purchases.owner_id").where(["invoice_lines.payable_id IS NULL AND users.id = ?", user.to_i]) }
  scope :with_lead, lambda {|lead_id| where(:lead_id => lead_id)}

  validates_presence_of :lead_id

  delegate :header, :hidden_description, :description, :purchase_value, :category, :country, :clicks_count, :exposures_count, :sale_limit, :novelty_level,
           :hotness_level, :certification_level, :price, :address, :company_name, :contact_name, :contact_title, :email_address, :direct_phone_number, :phone_number, :to => :lead

  public

  def self.statuses_for_select
    STATUSES.to_enum(:each_with_index).map { |code, i| [I18n.t("lead_purchases.statuses.#{code}").to_s, i] }.sort
  end
end
