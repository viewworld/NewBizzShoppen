class AbstractLead < ActiveRecord::Base
  set_table_name "leads"

  translates :header, :description, :hidden_description  

  include ScopedSearch::Model

  belongs_to :country
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  belongs_to :region
  belongs_to :category
  belongs_to :currency
  has_many :lead_translations, :foreign_key => :lead_id, :dependent => :destroy
  has_many :lead_purchases, :foreign_key => :lead_id
  has_many :lead_template_values, :foreign_key => :lead_id
  
  liquid_methods :header, :description, :company_name, :contact_name, :phone_number, :email_address, :address, :www_address
  #TODO ???
  liquid :header

  attr_protected :published
  attr_accessor :category_is_changed
  attr_accessor :tmp_creator_id
  attr_accessor :current_user
  attr_accessor :notify_buyers_after_update

  validates_presence_of :header, :description, :price, :company_name, :contact_name, :phone_number, :sale_limit, :category_id, :purchase_decision_date, :country_id, :currency, :address_line_1, :address_line_3, :zip_code, :if => :process_for_lead_information?
  validates_presence_of :hidden_description, :unless => Proc.new{|l| l.created_by?('PurchaseManager')}, :if => :process_for_lead_information?
  validates_inclusion_of :sale_limit, :in => 0..10, :if => :process_for_lead_information?
  validate :check_category, :check_lead_templates, :if => :process_for_lead_information?

  after_create :cache_creator_name
  before_save :change_creator
  before_save :set_published_at

  accepts_nested_attributes_for :lead_translations, :allow_destroy => true
  accepts_nested_attributes_for :lead_template_values, :allow_destroy => true



  def lead_templates(with_mandatory_only=nil)
    self.creator = current_user if creator.nil?
    templates = LeadTemplate.with_category_and_its_ancestors(category).where("is_active = ?", true).
        where("(is_global = ? or (creator_id = ? and creator_type = ?) or (creator_id = ? and creator_type = ?) or creator_type = ? or creator_id in (?))",
                 true, creator.parent_id, creator.parent.nil? ? "" : creator.parent.send(:casted_class).to_s, creator.id, creator.class.to_s, "User::Admin",
                 (creator.has_role?(:call_centre_agent) and creator.parent.present?) ? creator.parent.send(:casted_class).find(creator.parent_id).subaccounts : [])
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
    if category and category.is_agent_unique and !(creator.unique_categories.include?(category) or (creator.parent.present? and creator.parent.with_role.unique_categories.include?(category)))
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