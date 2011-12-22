class Deal < AbstractLead
  include ScopedSearch::Model

  VOUCHER_UNTIL_TYPE_DATE = 0.freeze
  VOUCHER_UNTIL_TYPE_WEEKS = 1.freeze  

  has_one :deal_request_details_email_template, :as => :resource, :class_name => "EmailTemplate", :conditions => "uniq_id = 'deal_request_details'", :dependent => :destroy
  has_one :logo, :class_name => "Asset::DealLogo", :as => :resource, :conditions => "asset_type = 'Asset::DealLogo'", :dependent => :destroy
  has_one :voucher_heading_picture, :class_name => "Asset::VoucherPicture", :as => :resource, :conditions => "asset_type = 'Asset::VoucherPicture'", :dependent => :destroy
  has_many :images, :class_name => "Asset::DealImage", :as => :resource, :conditions => "asset_type = 'Asset::DealImage'", :dependent => :destroy
  has_many :materials, :class_name => "Asset::DealMaterial", :as => :resource, :conditions => "asset_type = 'Asset::DealMaterial'", :dependent => :destroy
  has_many :leads, :class_name => "Lead", :foreign_key => "deal_id"
  has_many :comment_threads, :class_name => "Comment", :foreign_key => :commentable_id, :conditions => {:commentable_type => 'AbstractLead'}
  has_many :deal_certification_requests, :dependent => :destroy
  has_many :featured_deals
  has_many :voucher_numbers
  has_and_belongs_to_many :deal_templates, :class_name => "LeadTemplate", :join_table => "leads_lead_templates", :foreign_key => "lead_id", :association_foreign_key => "lead_template_id"
  belongs_to :lead_category, :class_name => "Category", :foreign_key => "lead_category_id"
  belongs_to :deal_admin, :class_name => "User", :foreign_key => "deal_admin_email", :primary_key => "email"

  scope :without_inactive, lambda { where("leads.end_date >= ? and leads.start_date <= ? and leads.enabled_from <= ?", Date.today, Date.today, Date.today) }
  scope :without_requested_by, lambda { |u| select("DISTINCT leads.*").joins("LEFT JOIN leads lr ON lr.deal_id = leads.id").where(["(lr.requested_by <> ? OR lr.requested_by IS NULL)", u.id]) if u }
  scope :active_is, lambda { |q| where("#{q == "1" ? "end_date >= ? and start_date <= ?" : "end_date < ? or start_date > ?"}", Date.today, Date.today) }
  scope :for_user, lambda { |q| where("creator_id = ?", q.id) }
  scope :group_deals, where(:group_deal => true)
  scope :not_blocked_by_sold_out_vouchers, where("leads.voucher_enabled = false OR (leads.voucher_enabled = true and leads.voucher_max_number > (select count(*) from voucher_numbers where voucher_numbers.deal_id = leads.id and voucher_numbers.state <> 'new'))")

  scoped_order :header, :end_date, :published, :created_at, :company_name

  validates_presence_of :start_date, :end_date, :email_address
  validates_presence_of :deal_admin_email, :unless => Proc.new { |d| d.new_record? }

  validates_numericality_of :deal_price, :greater_than_or_equal_to => 0, :if => Proc.new { |d| d.group_deal == true or d.voucher_enabled == true }
  validates_numericality_of :discounted_price, :greater_than_or_equal_to => 0, :if => Proc.new { |d| d.group_deal == true or d.voucher_enabled == true}
  validates_numericality_of :created_leads, :greater_than_or_equal_to => 0, :only_integer => true

  validates_presence_of :price, :discounted_price, :social_media_description, :if => Proc.new { |d| d.group_deal == true }

  validates_presence_of :voucher_end_date, :if => Proc.new { |d| d.voucher_enabled == true and d.voucher_until_type == 0 }
  validates_presence_of :voucher_number_of_weeks, :if => Proc.new { |d| d.voucher_enabled == true and d.voucher_until_type == 1 }
  validates_numericality_of :voucher_number_of_weeks, :greater_than_or_equal_to => 1, :only_integer => true, :if => Proc.new { |d| d.voucher_enabled == true and d.voucher_until_type == 1 }
  validates_presence_of :voucher_max_number, :if => Proc.new { |d| d.voucher_enabled == true }
  validates_numericality_of :voucher_max_number, :greater_than_or_equal_to => 1, :only_integer => true, :if => Proc.new { |d| d.voucher_enabled == true }
  validate :voucher_max_number_greater_or_equal_not_new_voucher_numbers

  validate :deal_admin_presence, :unless => Proc.new { |d| d.new_record? }

  before_create :create_uniq_deal_category, :set_default_max_auto_buy
  after_create :certify_for_unknown_email, :assign_deal_admin, :set_deal_unique_id
  before_save :set_dates, :check_deal_request_details_email_template, :set_enabled_from, :handle_max_auto_buy
  after_save :set_voucher_numbers

  attr_accessor :creation_step, :use_company_name_as_category

  accepts_nested_attributes_for :logo, :reject_if => proc { |attributes| attributes['asset'].blank? }
  accepts_nested_attributes_for :images, :reject_if => proc { |attributes| attributes['asset'].blank? }
  accepts_nested_attributes_for :materials, :reject_if => proc { |attributes| attributes['asset'].blank? }
  accepts_nested_attributes_for :voucher_heading_picture, :reject_if => proc { |attributes| attributes['asset'].blank? }
  accepts_nested_attributes_for :voucher_numbers

  ajaxful_rateable :stars => 5, :allow_update => false, :cache_column => :deal_average_rating
  acts_as_commentable

  def max_auto_buy_reached?
    leads.where("created_at >= ?", current_four_week_period_start_date).count >= max_auto_buy.to_i
  end

  def handle_max_auto_buy
    if max_auto_buy_changed? and published?
      check_max_auto_buy
    end
  end

  def check_max_auto_buy
    if max_auto_buy_reached? and enabled?
      disable
    elsif !max_auto_buy_reached? and !enabled?
      enable
    end
  end

  def check_max_auto_buy!
    check_max_auto_buy
    self.save
  end

  def enabled?
    enabled_from <= Date.today
  end

  def enable
    self.enabled_from =  Date.today
  end

  def disable
    self.enabled_from = current_four_week_period_end_date+1
  end

  def active?
    published? and start_date <= Date.today and end_date >= Date.today and enabled?
  end

  def deal_admin_presence
    self.errors.add(:deal_admin_email, :invalid) if !deal_admin or !deal_admin.has_any_role?(:agent, :call_centre, :call_centre_agent)
  end

  def assign_deal_admin
    update_attribute(:deal_admin_email, (creator.has_any_role?(:agent, :call_centre, :call_centre_agent) ? creator.email : Settings.default_deal_admin_email))
  end

  def set_dates
    if end_date_changed?
      self.end_date = end_date.end_of_day
    end
  end

  def self.new_for_user(user)
    Deal.new(
        :company_name => user.company_name,
        :contact_name => user.full_name,
        :email_address => user.email,
        :phone_number => user.phone,
        :address_line_1 => user.with_role.address.address_line_1,
        :address_line_2 => user.with_role.address.address_line_2,
        :address_line_3 => user.with_role.address.address_line_3,
        :zip_code => user.with_role.address.zip_code,
        :country_id => user.with_role.address.country_id,
        :region_id => user.with_role.address.region_id,
        :start_date => Date.today,
        :end_date => Date.today + 1.year,
        :price => 0,
        :max_auto_buy => Settings.default_max_auto_buy_per_4_weeks.to_i)
  end

  def self.until_type_for_radio
    [[I18n.t("models.deal.until_type_for_radio.end_date"), VOUCHER_UNTIL_TYPE_DATE], [I18n.t("models.deal.until_type_for_radio.number_of_weeks"), VOUCHER_UNTIL_TYPE_WEEKS]]
  end

  def build_supplier(params={})
    if supplier
      supplier
    else
      existing_users_count = User::Supplier.where(:screen_name => contact_name).count
      contact_name_arr = contact_name.strip.split(" ")
      contact_name_arr = contact_name_arr.size == 1 ? contact_name_arr : [contact_name_arr.first, contact_name_arr[1..-1].join(' ')]
      user = User::Supplier.new({:email => email_address, :company_name => company_name, :phone => phone_number,
                                 :screen_name => "#{contact_name}#{existing_users_count.zero? ? '' : existing_users_count+1}",
                                 :agreement_read => true, :first_name => contact_name_arr.first, :last_name => contact_name_arr.last,
                                 :assign_free_subscription_plan => true}.merge(params))
      user.skip_email_verification = "1"
      user.address = Address.new(:address_line_1 => address_line_1, :address_line_2 => address_line_2, :address_line_3 => address_line_3,
                                 :zip_code => zip_code, :country_id => country_id, :region_id => region_id)
      user
    end
  end

  def self.group_deals_for_select
    group_deals.without_inactive.map { |gd| [gd.to_s_for_group_deals_for_select, gd.id] }
  end

  def self.all_deals_for_select
    without_inactive.map { |gd| [gd.to_s_for_group_deals_for_select, gd.id] }
  end

  def to_s_for_group_deals_for_select
    "#{header} (#{start_date.strftime("%d.%m.%Y")}-#{end_date.strftime("%d.%m.%Y")})"
  end

  def supplier
    creator.supplier? ? creator : User::Supplier.where(:email => email_address).first
  end

  def has_unread_comments_for_user?(user)
    user ? comment_threads.unread_by_user(user).count > 0 : false
  end

  def requested_by?(user)
    leads.where(:requested_by => user.id).any?
  end

  def current_dcr
    deal_certification_requests.last
  end

  def certified?
    !deal_certification_requests.blank? and current_dcr.approved?
  end

  def saving
    if (deal_price.to_f > 0 and discounted_price.to_f > 0 and deal_price > discounted_price)
      "#{(100 - discounted_price * 100 / deal_price).to_i}%"
    elsif general_discount?
      "#{(discounted_price.to_f <= 100 and discounted_price.to_f > 0) ? discounted_price.to_i : 100}%"
    else
      "0%"
    end
  end

  def saving_in_money
    if (deal_price.to_f > 0 and discounted_price.to_f > 0 and deal_price > discounted_price)
      (deal_price - discounted_price).to_f
    elsif general_discount?
      discounted_price.to_f
    else
      0
    end
  end

  def general_discount?
    deal_price.to_f == 0 or discounted_price.to_f == 0
  end

  def assign_lead_category_to_supplier!
    if supplier and lead_category.is_customer_unique?
      supplier.update_attribute(:deal_category_id, lead_category.id)
      lead_category.customers << supplier
      lead_category.save
    end
  end

  def send_supplier_welcome_email(password)
    template = EmailTemplate.find_by_uniq_id("deal_certification_buyer_welcome")
    TemplateMailer.delay.new(supplier.email, :blank_template, Country.get_country_from_locale,
                                       {:subject_content => template.subject, :body_content => template.render({:user => supplier, :password => password}),
                                        :bcc_recipients => template.bcc, :cc_recipients => template.cc,
                                        :sender_id => User.get_current_user_id, :email_template_uniq_id => template.uniq_id})
  end

  def slug
    "#{id}#{ '-' + header unless header.blank?}".to_url
  end

  def current_four_week_period_start_date
    time_diff = ((Time.now.to_i) - (created_at.to_i)) / (24 * 60 * 60)
    (published_at + ((time_diff / 28).to_i * 28).days).to_date
  end

  def current_four_week_period_end_date
    current_four_week_period_start_date + 28.days
  end  
  
  def next_group_deal
    if deal = Deal.without_inactive.order("id ASC").where("id > ?", self.id).first
      deal
    else
      Deal.without_inactive.order("id ASC").first
    end
  end

  def previous_group_deal
    if deal = Deal.without_inactive.order("id DESC").where("id < ?", self.id).first
      deal
    else
      Deal.without_inactive.order("id DESC").first
    end
  end

  def can_be_managed_by?(user)
    user.has_role?(:admin) or creator == user or email_address == user.email or (user.has_role?(:call_centre) and user.with_role.subaccounts.map(&:id).include?(creator.id))
  end

  def generate_deal_unique_id
    DecimalToOtherSystemsConverter.convert_to_alphabetical(id, 4)
  end

  def create_missing_voucher_numbers
    if voucher_enabled and voucher_max_number > voucher_numbers.size
      (voucher_max_number - voucher_numbers.size).times do
        voucher_numbers.create
      end
    end
  end

  def remove_to_many_voucher_numbers
    if voucher_enabled and voucher_max_number < voucher_numbers.size
      voucher_numbers.can_be_deleted(Time.now)[0..voucher_numbers.size-voucher_max_number-1].each { |vn| vn.destroy }
    end
  end

  def remove_voucher_numbers_if_disable
    voucher_numbers.can_be_deleted(Time.now).delete_all unless voucher_enabled
  end

  def voucher_can_be_disabled
    voucher_numbers.can_not_be_deleted(Time.now).size == 0
  end

  def can_be_editable_by(current_user)
    current_user.id == creator.id or current_user.email == email_address or current_user.email == deal_admin_email or current_user.admin?
  end

  def deal_code_is_url?
    deal_code ? !(deal_code.match(/http:\/\//) or deal_code.match(/www./)).nil? : false
  end

  def deal_code_as_url
    deal_code.to_s.match(/http:\/\//).nil? ? "http://#{deal_code}" : deal_code
  end

  def brutto_discounted_price(user)
    vat_rate = user.not_charge_vat? ? 0 : Seller.default.vat_rate
    vat_rate > 0 ? discounted_price + (discounted_price * BigDecimal(vat_rate.to_s).div(100,4)) : discounted_price
  end

  private

  def set_enabled_from
    self.enabled_from = Date.today unless enabled_from
  end

  def check_deal_request_details_email_template
    unless deal_request_details_email_template
      global_template = EmailTemplate.global.where(:uniq_id => 'deal_request_details').first
      self.deal_request_details_email_template = global_template.clone
      global_template.translations.each do |translation|
        self.deal_request_details_email_template.translations << translation.clone
      end
      self.save
    end
  end

  def process_for_lead_information?
    true
  end

  def cache_creator_name
    update_attribute(:creator_name, creator.full_name) unless creator_name
  end

  def create_uniq_deal_category
    if (supplier and creator.supplier?) or ActiveRecord::ConnectionAdapters::Column.value_to_boolean(use_company_name_as_category)
      if supplier
        lead_category = supplier.deal_category_id ? LeadCategory.find(supplier.deal_category_id) : LeadCategory.create(:name => supplier.company_name, :currency => Currency.default_currency)
      else
        lead_category = LeadCategory.create(:name => company_name, :currency => Currency.default_currency)
      end

      supplier.update_attribute(:deal_category_id, lead_category.id) if supplier and supplier.deal_category_id.blank?
      lead_category.update_attribute(:is_customer_unique, true) unless lead_category.is_customer_unique
      if supplier and !lead_category.customers.map(&:id).include?(supplier.id)
        lead_category.customers << User.find(supplier.id)
        lead_category.save
      end
      lead_category.update_attribute(:auto_buy, true) if !lead_category.auto_buy? and supplier and supplier.big_buyer?
      self.lead_category_id = lead_category.id
    end
  end

  def certify_for_unknown_email
    if creator.agent? or creator.admin? and supplier.nil?
      deal_certification_requests.create
    end
  end

  def set_default_max_auto_buy
    self.max_auto_buy = Settings.default_max_auto_buy_per_4_weeks.to_i unless max_auto_buy
  end

  def set_deal_unique_id
    self.update_attribute(:deal_unique_id, generate_deal_unique_id)
  end

  def set_voucher_numbers
    self.create_missing_voucher_numbers
    self.remove_voucher_numbers_if_disable
    self.remove_to_many_voucher_numbers
  end

  def voucher_max_number_greater_or_equal_not_new_voucher_numbers
    errors.add(:voucher_max_number, I18n.t("models.deal.voucher_max_number_validation")) if self.voucher_max_number < self.voucher_numbers.can_not_be_deleted(Time.now).size
  end
end