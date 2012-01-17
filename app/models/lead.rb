class Lead < AbstractLead
  INFINITY = 1.0/0
  NOVELTY_LEVEL_RANGES = [(0..8), (9..30), (31..INFINITY)]
  HOTNESS_LEVEL_RANGES = [(29..INFINITY), (7..28), (-INFINITY..6)]
  BLACK_LISTED_ATTRIBUTES = [:published]
  CSV_ATTRS = %w(company_name company_phone_number company_website address_line_1 address_line_2 address_line_3 zip_code country region company_vat_no company_ean_number contact_name direct_phone_number phone_number email_address linkedin_url facebook_url is_international header description hidden_description purchase_value price currency published sale_limit purchase_decision_date)
  REQUIRED_FIELDS = %w(company_name address_line_1 address_line_3 zip_code country contact_name phone_number header description hidden_description price currency sale_limit purchase_decision_date)
  NUMERIC_FIELDS = %w(price sale_limit)

  translates :header, :description, :hidden_description
  acts_as_commentable

  include ScopedSearch::Model

  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  belongs_to :category
  belongs_to :country
  belongs_to :currency
  belongs_to :region
  belongs_to :requestee, :class_name => "User::Member", :foreign_key => :requested_by
  belongs_to :deal, :class_name => "Deal", :foreign_key => "deal_id"
  has_many :lead_certification_requests, :dependent => :destroy
  has_many :lead_translations, :dependent => :destroy
  has_many :lead_purchases
  has_many :lead_template_values
  has_many :comment_threads, :class_name => "Comment", :foreign_key => :commentable_id, :conditions => {:commentable_type => 'AbstractLead'}

  validates_presence_of :price, :purchase_decision_date, :sale_limit, :category_id
  validates_inclusion_of :sale_limit, :in => 0..10, :if => :process_for_lead_information?

  scope :deal_value_from, lambda { |q| where(["purchase_value >= ?", q]) }
  scope :deal_value_to, lambda { |q| where(["purchase_value <= ?", q]) }
  scope :price_from, lambda { |q| where(["price >= ?", q]) }
  scope :price_to, lambda { |q| where(["price <= ?", q]) }
  scope :lead_purchases_counter_from, lambda { |q| where(["lead_purchases_counter >= ?", q]) }
  scope :lead_purchases_counter_to, lambda { |q| where(["lead_purchases_counter <= ?", q]) }
  scope :purchase_value_from, lambda { |q| where(["purchase_value >= ?", q]) }
  scope :purchase_value_to, lambda { |q| where(["purchase_value <= ?", q]) }
  scope :with_categories, lambda { |arr| where(:category_id => Category.where(:id => arr.map(&:self_and_descendants).flatten.map(&:id))) }
  scope :with_ids_not_in, lambda { |q| where(["leads.id NOT IN (?)", q]) }
  scope :without_inactive, where("((select sum(quantity) from lead_purchases where lead_id = leads.id group by lead_id) is null or (select sum(quantity) from lead_purchases where lead_id = leads.id group by lead_id) < sale_limit)")
  scope :without_outdated, lambda { where("purchase_decision_date >= ?", Date.today.to_s) }
  scope :without_locked_users, joins("INNER JOIN users ON users.id=leads.creator_id").where("users.locked_at is NULL")
  scope :with_status, lambda { |q| where(["leads.published = ?", q]) }
  scope :with_creator_type, lambda { |creator_type| where(["leads.creator_type = ?", "User::#{creator_type}"]) }
  scope :within_accessible_categories, lambda { |accessible_categories_ids| where("leads.category_id IN (?)", accessible_categories_ids) }
  scope :with_call_centre, lambda { |call_centre_id| where(["users.parent_id = ?", call_centre_id]).joins("INNER JOIN users ON leads.creator_id=users.id") }
  #====================
  scope :featured, where(:featured => true)
  scope :purchased, where("lead_purchases_counter > 0")
  scope :without_bought_and_requested_by, lambda { |u| select("DISTINCT leads.*").joins("LEFT JOIN lead_purchases lp ON lp.lead_id = leads.id").where(["(lp.owner_id <> ? OR lp.owner_id IS NULL) AND (lp.assignee_id <> ? OR lp.assignee_id IS NULL) AND (lp.requested_by <> ? OR lp.requested_by IS NULL)", u.id, u.id, u.id]) if u }
  scope :bestsellers, order("lead_purchases_counter DESC")
  scope :contact_requests_for, lambda { |user_id| where("leads.creator_id = :id or leads.email_address = :email", {:id => user_id, :email => User.find(user_id).email}).order("leads.created_at DESC") }
  scope :interesting_for_user, lambda { |user| where("leads.category_id IN (?)", user.accessible_categories_ids) }

  scope :joins_on_lead_purchases, joins("INNER JOIN lead_purchases ON lead_purchases.lead_id=leads.id")
  scope :with_created_by, lambda { |agent_id| where("creator_id = ?", agent_id) }
  scope :with_created_by_call_centre, lambda { |call_centre| where("creator_id IN (?)", call_centre.subaccount_ids) }
  scope :with_revenue_by, lambda { |agent| select("sum(lead_purchases.euro_price) as id").where("leads.creator_id IN (?) and lead_purchases.requested_by IS NULL", agent.has_role?(:call_centre) ? agent.subaccount_ids : agent.id).joins_on_lead_purchases }
  scope :with_rated_good_by, lambda { |agent| where("creator_id = ? and lead_purchases.rating_level > -1 and lead_purchases.rating_level <= ? and lead_purchases.requested_by IS NULL", agent.id, LeadPurchase::RATING_SATISFACTORY).joins_on_lead_purchases }
  scope :with_rated_bad_by, lambda { |agent| where("creator_id = ? and lead_purchases.rating_level > ? and lead_purchases.requested_by IS NULL", agent.id, LeadPurchase::RATING_SATISFACTORY).joins_on_lead_purchases }
  scope :with_not_rated_by, lambda { |agent| where("creator_id = ? and (lead_purchases.rating_level = -1 or lead_purchases.rating_level is NULL) and lead_purchases.requested_by IS NULL", agent.id).joins_on_lead_purchases }

  scope :with_not_invoiced_for_user, lambda { |user| joins("RIGHT JOIN lead_purchases ON lead_purchases.lead_id = leads.id LEFT JOIN invoice_lines ON invoice_lines.payable_id = lead_purchases.id LEFT JOIN users ON users.id = lead_purchases.owner_id").where(["invoice_lines.payable_id IS NULL AND users.id = ?", user.to_i]) }

  scope :owned_by, lambda { |user| where("lead_purchases.accessible_from IS NOT NULL and lead_purchases.owner_id = ?", user.id).joins(:lead_purchases) }
  scope :without_unique_categories, where("categories.is_agent_unique = ? and categories.is_customer_unique = ?", false, false).joins(:category)
  scope :with_supplier_unique_categories, lambda { |supplier_id| where("(is_customer_unique = ? and category_customers.user_id is NULL) or (is_customer_unique = ? and category_customers.user_id = ?)", false, true, supplier_id).joins("INNER JOIN categories on categories.id=leads.category_id LEFT JOIN category_customers ON categories.id=category_customers.category_id") }
  scope :with_agent_unique_categories, lambda { |agent_id| where("(is_agent_unique = ? and category_agents.user_id is NULL) or (is_agent_unique = ? and category_agents.user_id = ?)#{' or (is_agent_unique = \'t\' and category_agents.user_id = ' + User::CallCentreAgent.find_by_id(agent_id).parent_id.to_s + ')' if User::CallCentreAgent.find_by_id(agent_id)}", false, true, agent_id).joins("INNER JOIN categories on categories.id=leads.category_id LEFT JOIN category_agents ON categories.id=category_agents.category_id") }

  scope :with_deal_value_from, lambda { |from| where("purchase_value >= ?", from) }
  scope :with_deal_value_to, lambda { |to| where("purchase_value <= ?", to) }
  scope :with_certification_level, lambda { |cl| joins("INNER JOIN users ON users.id=leads.creator_id").where("certification_level = ? or certification_level = ?", cl.to_i, cl.to_i + 10) }
  scope :with_sale_limit, lambda { |sale_limit| where("sale_limit = ?", sale_limit.to_i) }
  scope :with_hotness, lambda { |hotness| where("hotness_counter = ?", hotness) }
  scope :for_notification, lambda { |categories, notification_type| where("category_id in (?) and DATE(published_at) between ? and ?", categories.map(&:id), notification_type == User::LEAD_NOTIFICATION_ONCE_PER_DAY ? Date.today : Date.today-7, Date.today).published_only.without_inactive.without_outdated.order("category_id") }

  scope :requested_by_member, lambda { |user| where("leads.creator_id = ? or leads.requested_by = ?", user.id, user.id) }

  scope :descend_by_leads_id, order("leads.id DESC")

  delegate :certification_level, :to => :creator

  scoped_order :id, :header, :sale_limit, :price, :lead_purchases_counter, :published, :has_unsatisfactory_rating, :purchase_value, :created_at

  before_destroy :can_be_removed?
  after_find :set_suppliers_notification
  before_update :notify_suppliers_about_changes
  before_create :set_deal_code

  before_save :handle_category_change
  before_validation :handle_dialling_codes
  validate :check_lead_templates, :unless => Proc.new { |l| l.requestee and l.requestee.has_role?(:member) }
  before_save :check_if_category_can_publish_leads
  after_create :certify_lead_if_created_from_deal, :send_email_with_deal_details_and_files
  after_update :send_instant_notification_to_subscribers
  after_save :auto_buy
  after_create :update_deal_created_leads_count
  attr_accessor :creation_step
  attr_protected :published

  private

  def check_if_category_can_publish_leads
    if category and !category.can_publish_leads?
      self.errors.add(:category_id, I18n.t("shared.leads.form.category_no_leads_can_be_published"))
    end
  end

  def process_for_lead_information?
    !(requestee and requestee.has_role?(:member))
  end

  #prevent dialling codes from saving when no proper phone number follows them
  def handle_dialling_codes
    fields = [:direct_phone_number, :phone_number, :company_phone_number].select { |pn| self.send(pn).to_s.strip.size <= 3 }
    unless fields.empty?
      fields.each do |field|
        self.send("#{field}=".to_sym, nil)
      end
    end
  end

  #Handling case when category is changed during edit/create to prevent auto save
  def handle_category_change
    if ActiveRecord::ConnectionAdapters::Column.value_to_boolean(category_is_changed)
      self.errors.add(:category_id, I18n.t("shared.leads.form.category_was_changed"))
    end
  end

  def mass_assignment_authorizer
    if self.current_user and current_user.can_publish_leads?
      self.class.protected_attributes.reject! { |a| BLACK_LISTED_ATTRIBUTES.include?(a.to_sym) }
      self.class.protected_attributes
    else
      super
    end
  end

  def novelty_ratio
    !published_at.nil? ? (Date.today - published_at.to_date).to_i : 2
  end

  def hotness_ratio
    if purchase_decision_date
      (purchase_decision_date - Date.today).to_i.tap do |result|
        return result < 0 ? 0 : result
      end
    else
      INFINITY
    end
  end

  def can_be_removed?
    lead_purchases.empty?
  end

  def set_suppliers_notification
    self.notify_suppliers_after_update = true
  end

  def notify_suppliers_about_changes
    if ActiveRecord::ConnectionAdapters::Column.value_to_boolean(notify_suppliers_after_update) and lead_purchases.present?
      lead_purchases.map(&:owner).uniq.each { |supplier| deliver_notify_suppliers_about_changes(supplier.email) }
    end
  end

  def deliver_notify_suppliers_about_changes(email)
    deliver_email_template(email, "notify_buyers_about_lead_update")
  end

  def deliver_email_template(email, uniq_id)
    TemplateMailer.delay.new(email, uniq_id.to_sym, Country.get_country_from_locale, {:lead => self, :sender_id => nil})
  end

  def auto_buy
    if published_changed? and published and category.auto_buy
      user = category.category_customers.first.user.with_role
      if user.big_buyer? and !bought_by_user?(user)
        user.cart.add_lead(self)
        deal.check_max_auto_buy! if deal
      end
    end
  end

  def check_lead_templates
    if category_id_changed?
      lead_template_fields = lead_templates(true).map { |lt| lt.lead_template_fields }.flatten.select { |f| f.is_mandatory }
      unless lead_template_values.select { |ltv| lead_template_fields.map(&:id).include?(ltv.lead_template_field_id) }.size == lead_template_fields.size
        self.errors.add(:category_id, I18n.t("shared.leads.form.not_all_templates_filled"))
      end
    end
  end

  def certify_lead_if_created_from_deal
    if deal
      lcr = self.lead_certification_requests.create(:do_not_send_email => true)
      lcr.update_attribute(:state, LeadCertificationRequest::STATE_APPROVED)
    end
  end

  def send_email_with_deal_details_and_files
    if deal
      TemplateMailer.delay.new(requestee.email, deal.deal_request_details_email_template || :deal_request_details, Country.get_country_from_locale, {:deal => deal, :sender_id => nil},
      (deal.images + deal.materials).map{ |material| material.full_local_path_for_current })
    end
  end

  def update_deal_created_leads_count
    if deal
      deal.increment!(:created_leads)
    end
  end

  def set_deal_code
    self.hidden_description = "#{I18n.t("models.lead.hidden_description_prefix_for_deal_code")} #{deal.deal_code}. #{hidden_description}" if deal
  end

  public

  def hotness_level
    HOTNESS_LEVEL_RANGES.each_with_index { |range, i| return i if range.include?(hotness_ratio) }
  end

  def novelty_level
    NOVELTY_LEVEL_RANGES.each_with_index { |range, i| return i if range.include?(novelty_ratio) }
  end

  def buyable?
    published? and lead_purchases.sum("quantity") < sale_limit
  end

  def calculate_average_rating
    ratings_percentage = lead_purchases.map(&:rating_as_percentage).select { |rp| rp >= 0 }
    unless ratings_percentage.empty?
      self.average_rating = ((ratings_percentage.sum.to_f / ratings_percentage.size.to_f) * 100).round
    else
      self.average_rating = -1
    end
  end

  def refresh_hotness_counter
    self.hotness_counter = hotness_level
  end

  def average_rating_as_text
    "#{average_rating}%"
  end

  def sold?
    lead_purchases_counter > 0
  end

  def duplicate_fields(lead)
    if lead
      ["company_name", "company_phone_number", "company_website", "address_line_1", "address_line_2", "address_line_3", "zip_code",
       "country_id", "company_ean_number", "contact_name", "direct_phone_number", "phone_number", "email_address", "linkedin_url", "facebook_url"].each do |field|
        self.send("#{field}=".to_sym, lead.send(field.to_sym))
      end
    end
  end

  def bought_by_anyone?
    lead_purchases.any?
  end

  def bought_by_users_other_than(user)
    user ? lead_purchases.map(&:owner_id).except(user.id).any? : bought_by_anyone?
  end

  def buyout_quantity
    sale_limit - lead_purchases.sum("quantity")
  end

  def buyout_price
    buyout_quantity * price
  end

  def buyout_possible_for?(user)
    category.buyout_enabled? and !bought_by_users_other_than(user) and buyable? and (user.nil? or (user and user.has_any_role?(:supplier, :lead_supplier)))
  end

  def buyout!(supplier)
    if (supplier.lead_single_purchases.with_lead(id).any? ? supplier.lead_additional_buyouts : supplier.lead_buyouts).create(
        :lead_id => self.id,
        :paid => false,
        :accessible_from => (supplier.big_buyer? ? Time.now : nil),
        :quantity => buyout_quantity)
      :buyout_successful
    end
  end

  def update_stats!(field)
    self.notify_suppliers_after_update = false
    self.increment!(field)
  end

  def can_be_commented?
    !creator.has_role?(:member)
  end

  def has_unread_comments_for_user?(user)
    comment_threads.unread_by_user(user).count > 0
  end

  def current_lcr
    lead_certification_requests.last
  end

  def certified?
    !lead_certification_requests.blank? and current_lcr.approved?
  end

  def can_be_certified?
    lead_certification_requests.blank? and !email_address.blank? and !contact_name.blank?
  end

  def can_be_recertified?
    current_lcr.present? and current_lcr.email != email_address and LeadCertificationRequest::STATES_THAT_COULD_BE_RECERTIFICATED.include?(current_lcr.state)
  end

  def send_instant_notification_to_subscribers
    if published and published_changed?
      self.delay.deliver_instant_notification_to_subscribers
    end
  end

  def deliver_instant_notification_to_subscribers
    unless category.auto_buy?
      category.supplier_subscribers.where("lead_notification_type = ?", User::LEAD_NOTIFICATION_INSTANT).each do |user|
        deliver_email_template(user.email, "lead_notification_instant")
      end
    end
  end

  def show_lead_details_url
    "http://#{mailer_host}/leads/#{self.id}"
  end

  def category_name
    category.name
  end

  def bought_by_user?(user)
    !lead_purchases.where("purchased_by = #{user.id} and accessible_from IS NOT NULL").blank?
  end

  def lead_purchase_for(user)
    lead_purchases.where("purchased_by = #{user.id} and accessible_from IS NOT NULL").first
  end

  def copy_user_profile(user)
    [
        [:contact_name, :full_name], [:phone_number, :phone], [:email_address, :email],
        [:company_name], [:address_line_1, nil, :address], [:address_line_2, nil, :address],
        [:address_line_3, nil, :address], [:zip_code, nil, :address], [:country_id, nil, :address],
        [:region_id, nil, :address], [:direct_phone_number, :direct_phone_number]
    ].each do |field1, field2, field3|
      field2 = field1 if field2.nil?
      if field3
        self.send("#{field1}=".to_sym, user.send(field3.to_sym).send(field2.to_sym)) if self.send(field1.to_sym).blank?
      else
        self.send("#{field1}=".to_sym, user.send(field2.to_sym)) if self.send(field1.to_sym).blank?
      end
    end
  end

  def fill_social_media_link(user)
    if user.rpx_identifier.to_s[/facebook/]
      self.facebook_url = user.rpx_identifier
    elsif user.rpx_identifier.to_s[/linkedin/]
      self.linkedin_url = user.rpx_identifier
    end
  end

  def based_on_deal(deal, user)
    {:current_user => User.find_by_email(deal.deal_admin_email).with_role, :category => deal.lead_category, :sale_limit => 1, :price => deal.price.blank? ? 0 : deal.price,
     :purchase_decision_date => deal.end_date+7, :currency => deal.currency, :published => true, :requestee => user, :deal_id => deal.id
    }.each_pair do |key, value|
      self.send("#{key}=", value)
    end

    copy_user_profile(user)

    fill_social_media_link(user)

    current_locale = I18n.locale
    (deal.lead_translations.count > 1 ? ::Locale.enabled.map(&:code) : [current_locale]).each do |locale_code|
      I18n.locale = locale_code
      self.header = "#{I18n.t("models.lead.field_prefixes.header")} #{deal.header}"
      self.description = "#{I18n.t("models.lead.field_prefixes.description")} #{deal.description}"
    end
    I18n.locale = current_locale
  end

  def can_be_shown_to?(cu)
    published? or (cu and ((cu == creator) or (cu.has_role?(:admin))))
  end

end