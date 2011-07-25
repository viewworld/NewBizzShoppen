class AbstractLead < ActiveRecord::Base
  set_table_name "leads"

  translates :header, :description, :hidden_description, :fine_print, :company_description

  include ScopedSearch::Model

  belongs_to :country
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  belongs_to :region
  belongs_to :category
  belongs_to :currency
  belongs_to :deal
  has_many :lead_translations, :foreign_key => :lead_id, :dependent => :destroy
  has_many :lead_purchases, :foreign_key => :lead_id
  has_many :lead_template_values, :foreign_key => :lead_id
  
  liquid_methods :show_lead_details_url, :category_name, :header, :description, :hidden_description, :company_name, :contact_name, :phone_number, :email_address, :address, :www_address, :direct_phone_number
  #TODO ???
  liquid :header

  attr_accessor :category_is_changed
  attr_accessor :tmp_creator_id
  attr_accessor :current_user
  attr_accessor :notify_buyers_after_update
  attr_accessor :validate_contact_email

  validates_presence_of :header, :description, :company_name, :contact_name, :phone_number, :country_id, :currency, :address_line_1, :address_line_3, :zip_code, :if => :process_for_lead_information?
  validates_presence_of :hidden_description, :unless => Proc.new{|l| l.created_by?('PurchaseManager')}, :if => :process_for_lead_information?
  validates_presence_of :email_address, :if => Proc.new{|l| l.validate_contact_email }
  validates_format_of :email_address, :allow_blank => true, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validate :check_category, :check_lead_templates, :if => :process_for_lead_information?

  after_create :cache_creator_name
  before_save :change_creator, :set_euro_price
  before_save :set_published_at

  scope :with_category, lambda { |q| where(:category_id => Category.find_by_id(q).self_and_descendants.map(&:id)) }
  scope :with_keyword, lambda { |q| where("lower(header) like :keyword OR lower(leads.description) like :keyword OR lower(creator_name) like :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :with_country, lambda { |country_id| where(:country_id => country_id) }
  scope :with_zip_code, lambda { |zip_code| where(:zip_code => zip_code) }
  scope :with_region, lambda { |region_id| where(:region_id => region_id.to_i) }
  scope :with_selected_categories, lambda { |q| where(:category_id => q) }
  scope :published_only, where(:published => true)
  scope :latest, order("created_at DESC")

  accepts_nested_attributes_for :lead_translations, :allow_destroy => true
  accepts_nested_attributes_for :lead_template_values, :allow_destroy => true


  def set_euro_price
    if price.to_i > 0 and currency.present? and price_changed?
      self.euro_price = currency.to_euro(price)
    end
  end

  def lead_templates(with_mandatory_only=nil)
    self.creator = current_user if creator.nil?
    templates = LeadTemplate.with_category_and_its_ancestors(category).where("is_active = ?", true).
        where("(is_global = ? or (creator_id = ? and creator_type = ?) or (creator_id = ? and creator_type = ?) or creator_type = ? or creator_id in (?) or lead_templates.id in (?))",
                 true, creator.parent_id, creator.parent.nil? ? "" : creator.parent.send(:casted_class).to_s, creator.id, creator.class.to_s, "User::Admin",
                 (creator.has_role?(:call_centre_agent) and creator.parent.present?) ? creator.parent.send(:casted_class).find(creator.parent_id).subaccounts : [], deal.present? ? deal.deal_template_ids : [])
    templates = templates.where("is_mandatory = ?", with_mandatory_only) unless with_mandatory_only.nil?
    templates.order("lead_templates.name")
  end

  def all_lead_template_values(selected_template=nil)
    templates = selected_template.nil? ? lead_templates : [LeadTemplate.find(selected_template)]
    templates.map do |template|
      template.lead_template_fields.map do |field|
        lead_template_value = lead_template_values.detect { |ltv| ltv.lead_template_field == field }
        lead_template_value = LeadTemplateValue.new(:lead_template_field => field) if lead_template_value.nil?
        lead_template_value
      end
    end.flatten.compact
  end

  def lead_templates_and_values
    templates = LeadTemplate.select("DISTINCT(lead_templates.*)").
        where("lead_template_values.lead_id = ? and lead_template_values.value IS NOT NULL", id).
        joins("inner join lead_template_fields on lead_templates.id=lead_template_fields.lead_template_id inner join lead_template_values on lead_template_fields.id=lead_template_values.lead_template_field_id")
    templates.map do |template|
      [template, lead_template_values.select { |ltv| ltv.lead_template_field.lead_template_id == template.id and ltv.value.present? }]
    end.select { |t| !t.last.empty? }
  end

  def facebook_url_present?
    !facebook_url.blank? and facebook_url != "http://"
  end

  def linkedin_url_present?
    !linkedin_url.blank? and linkedin_url != "http://"
  end

  def lead_template_values_present?
    !LeadTemplateValue.where("value IS NOT NULL AND value NOT like '' AND lead_id = ? AND lead_templates.id in (?)", id, lead_templates.map(&:id)).joins("inner join lead_template_fields on lead_template_values.lead_template_field_id=lead_template_fields.id inner join lead_templates on lead_template_fields.lead_template_id=lead_templates.id").limit(1).empty?
  end

  def created_by?(creator_type)
    self.creator_type == "User::#{creator_type}"
  end

  def address
    [address_line_1, address_line_2, zip_code, address_line_3].join(" ")
  end

  private
  def check_category
    self.creator = current_user if creator.nil?
    if category and category.is_agent_unique and !creator.has_role?(:admin) and !(creator.unique_categories.include?(category) or (creator.parent.present? and creator.parent.with_role.unique_categories.include?(category)))
      self.errors.add(:category_id, "Incorrect category!")
    end
  end

  def check_lead_templates
    if category_id_changed?
      lead_template_fields = lead_templates(true).map{ |lt| lt.lead_template_fields }.flatten.select { |f| f.is_mandatory }
      unless lead_template_values.select { |ltv| lead_template_fields.map(&:id).include?(ltv.lead_template_field_id) }.size == lead_template_fields.size
        self.errors.add(:category_id, I18n.t("shared.leads.form.not_all_templates_filled"))
      end
    end
  end

  def cache_creator_name
    update_attribute(:creator_name, creator.name) unless creator_name
  end

  def change_creator
    if tmp_creator_id.present? and tmp_creator_id != creator_id
      self.creator = User.find(tmp_creator_id).send(:casted_class).find(tmp_creator_id)
      self.creator_name = creator.name
    end
  end

  def set_published_at
    if published_changed?
      self.published_at = published ? Time.now : nil
    end
  end

end