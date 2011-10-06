class Deal < AbstractLead
  include ScopedSearch::Model

  has_one :deal_request_details_email_template, :as => :resource, :class_name => "EmailTemplate", :conditions => "uniq_id = 'deal_request_details'", :dependent => :destroy
  has_one :logo, :class_name => "Asset::DealLogo", :as => :resource, :conditions => "asset_type = 'Asset::DealLogo'", :dependent => :destroy
  has_many :images, :class_name => "Asset::DealImage", :as => :resource, :conditions => "asset_type = 'Asset::DealImage'", :dependent => :destroy
  has_many :materials, :class_name => "Asset::DealMaterial", :as => :resource, :conditions => "asset_type = 'Asset::DealMaterial'", :dependent => :destroy
  has_many :leads, :class_name => "Lead", :foreign_key => "deal_id"
  has_many :comment_threads, :class_name => "Comment", :foreign_key => :commentable_id, :conditions => {:commentable_type => 'AbstractLead'}
  has_many :deal_certification_requests, :dependent => :destroy
  has_many :featured_deals
  has_and_belongs_to_many :deal_templates, :class_name => "LeadTemplate", :join_table => "leads_lead_templates", :foreign_key => "lead_id", :association_foreign_key => "lead_template_id"
  belongs_to :lead_category, :class_name => "Category", :foreign_key => "lead_category_id"
  belongs_to :deal_admin, :class_name => "User", :foreign_key => "deal_admin_email", :primary_key => "email"

  scope :without_inactive, where("leads.end_date >= ? and leads.start_date <= ?", Date.today, Date.today)
  scope :without_requested_by, lambda { |u| select("DISTINCT leads.*").joins("LEFT JOIN leads lr ON lr.deal_id = leads.id").where(["(lr.requested_by <> ? OR lr.requested_by IS NULL)", u.id]) if u }
  scope :active_is, lambda { |q| where("#{q == "1" ? "end_date >= ? and start_date <= ?" : "end_date < ? or start_date > ?"}", Date.today, Date.today) }
  scope :for_user, lambda { |q| where("creator_id = ?", q.id) }
  scope :group_deals, where(:group_deal => true)

  scoped_order :header, :end_date, :published, :created_at

  validates_presence_of :start_date, :end_date, :email_address
  validates_presence_of :deal_admin_email, :unless => Proc.new{|d| d.new_record? }

  validates_numericality_of :price, :greater_than_or_equal_to => 0, :if => Proc.new{|d| d.group_deal == true }
  validates_numericality_of :discounted_price, :greater_than_or_equal_to => 0, :if => Proc.new{|d| d.group_deal == true }
  validates_numericality_of :created_leads, :greater_than_or_equal_to => 0, :only_integer => true

  validates_presence_of :price, :discounted_price, :social_media_description, :if => Proc.new{|d| d.group_deal == true }

  validate :deal_admin_presence, :unless => Proc.new{|d| d.new_record? }

  before_create :create_uniq_deal_category, :set_default_max_auto_buy
  after_create :certify_for_unknown_email, :assign_deal_admin
  before_save :set_dates, :check_deal_request_details_email_template
  after_save :handle_disabled_deal

  attr_accessor :creation_step, :use_company_name_as_category

  accepts_nested_attributes_for :logo, :reject_if => proc { |attributes| attributes['asset'].blank? }
  accepts_nested_attributes_for :images, :reject_if => proc { |attributes| attributes['asset'].blank? }
  accepts_nested_attributes_for :materials, :reject_if => proc { |attributes| attributes['asset'].blank? }

  ajaxful_rateable :stars => 5, :allow_update => false, :cache_column => :deal_average_rating
  acts_as_commentable

  def active?
    published? and start_date <= Date.today and end_date >= Date.today
  end

  def handle_disabled_deal
    if !active? and !featured_deals.empty?
      self.featured_deals = []
      self.save
    end
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
  
  def build_buyer(params={})
    if buyer
      buyer
    else
      existing_users_count = User::Customer.where(:screen_name => contact_name).count
      contact_name_arr = contact_name.strip.split(" ")
      contact_name_arr = contact_name_arr.size == 1 ? contact_name_arr : [contact_name_arr.first, contact_name_arr[1..-1].join(' ')]
      user = User::Customer.new({:email => email_address, :company_name => company_name, :phone => phone_number,
                                 :screen_name => "#{contact_name}#{existing_users_count.zero? ? '' : existing_users_count+1}",
                                 :agreement_read => true, :first_name => contact_name_arr.first, :last_name => contact_name_arr.last}.merge(params))
      user.skip_email_verification = "1"
      user.address = Address.new(:address_line_1 => address_line_1, :address_line_2 => address_line_2, :address_line_3 => address_line_3,
                                 :zip_code => zip_code, :country_id => country_id, :region_id => region_id)
      user
    end
  end

  def self.group_deals_for_select
      [[]]+group_deals.without_inactive.map{|gd| [gd.to_s_for_group_deals_for_select, gd.id]}
  end

  def self.all_deals_for_select
      [[]]+without_inactive.map{|gd| [gd.to_s_for_group_deals_for_select, gd.id]}
  end

  def to_s_for_group_deals_for_select
    "#{header} (#{start_date.strftime("%d.%m.%Y")}-#{end_date.strftime("%d.%m.%Y")})"
  end

  def buyer
    creator.buyer? ? creator : User::Customer.where(:email => email_address).first
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
    (deal_price.to_f == 0 and discounted_price.to_f > 0) or (deal_price.to_f > 0 and discounted_price.to_f == 0)
  end
  
  def assign_lead_category_to_buyer!
    if buyer and lead_category.is_customer_unique?
      buyer.update_attribute(:deal_category_id, lead_category.id)
      lead_category.customers << buyer
      lead_category.save
    end
  end

  def send_buyer_welcome_email(password)
    template = EmailTemplate.find_by_uniq_id("deal_certification_buyer_welcome")
    TemplateMailer.delay.new(buyer.email, :blank_template, Country.get_country_from_locale,
                                       {:subject_content => template.subject, :body_content => template.render({:user => buyer, :password => password}),
                                        :bcc_recipients => template.bcc, :cc_recipients => template.cc})
  end

  def slug
    "#{id}#{ '-' + header unless header.blank?}".to_url
  end

  def current_four_week_period_start_date
    time_diff = ((Time.now.to_i) - (created_at.to_i)) / (24 * 60 * 60)
    (created_at + ((time_diff / 28).to_i * 28).days).to_date
  end
  
  def next_group_deal
    if Deal.group_deals.order("end_date ASC").where("end_date >= ? and id <> ?", self.end_date, self.id).any?
      Deal.group_deals.order("end_date ASC").where("end_date >= ? and id <> ?", self.end_date, self.id).first
    elsif Deal.group_deals.order("end_date ASC").where("id <> ?", self.id).any?
      Deal.group_deals.order("end_date ASC").where("id <> ?", self.id).first
    else
      self
    end
  end

  def previous_group_deal
    if Deal.group_deals.order("end_date DESC").where("end_date <= ? and id <> ?", self.end_date, self.id).any?
      Deal.group_deals.order("end_date DESC").where("end_date <= ? and id <> ?", self.end_date, self.id).first
    elsif Deal.group_deals.order("end_date DESC").where("id <> ?", self.id).any?
      Deal.group_deals.order("end_date DESC").where("id <> ?", self.id).first
    else
      self
    end
  end

  def can_be_managed_by?(user)
    user.has_role?(:admin) or creator == user or email_address == user.email or (user.has_role?(:call_centre) and user.with_role.subaccounts.map(&:id).include?(creator.id))
  end

  private

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
    if (buyer and creator.buyer?) or ActiveRecord::ConnectionAdapters::Column.value_to_boolean(use_company_name_as_category)
      if buyer
        lead_category = buyer.deal_category_id ? LeadCategory.find(buyer.deal_category_id) : LeadCategory.create(:name => buyer.company_name, :currency => Currency.default_currency)
      else
        lead_category = LeadCategory.create(:name => company_name)
      end

      buyer.update_attribute(:deal_category_id, lead_category.id) if buyer and buyer.deal_category_id.blank?
      buyer.update_attribute(:big_buyer, true) if buyer and !buyer.big_buyer?
      lead_category.update_attribute(:is_customer_unique, true) unless lead_category.is_customer_unique
      if buyer and !lead_category.customers.include?(buyer)
        lead_category.customers << buyer
        lead_category.save
      end
      lead_category.update_attribute(:auto_buy, true) unless lead_category.auto_buy?
      self.lead_category_id = lead_category.id
    end
  end

  def certify_for_unknown_email
    if creator.agent? or creator.admin? and buyer.nil?
      deal_certification_requests.create
    end
  end

  def set_default_max_auto_buy
    self.max_auto_buy = Settings.default_max_auto_buy_per_4_weeks.to_i unless max_auto_buy
  end
end