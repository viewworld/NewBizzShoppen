class Result < ActiveRecord::Base

  serialize :settings

  has_many :call_results
  has_many :contacts, :through => :call_results
  has_many :campaigns_results, :foreign_key => "result_id"
  has_many :campaigns, :through => :campaigns_results, :foreign_key => "result_id"
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  before_destroy :check_call_results

  has_many :result_fields, :dependent => :destroy
  accepts_nested_attributes_for :result_fields, :allow_destroy => true
  accepts_nested_attributes_for :campaigns_results

  scope :call_log_results, where(:final => false)
  scope :final_results, where(:final => true)
  scope :generic_results, where(:generic => true)
  scope :custom_results, where(:generic => false)
  scope :not_in_result, where("name = 'Not in'")
  scope :not_archived_or_assigned_to_campaign, lambda { |campaign| joins("LEFT JOIN campaigns_results ON campaigns_results.result_id = results.id").
        joins("LEFT JOIN result_fields ON result_fields.result_id = results.id AND result_fields.field_type = '6'").
        where("(result_fields.survey_id in (?) or result_fields.id is NULL) and (campaigns_results.campaign_id = ? or (results.is_global is true and results.is_archived is false))", campaign.survey_ids, campaign.id).select("distinct(results.id), results.*") }
  scope :with_keyword, lambda { |q| where("lower(name) like ?", "%#{q.to_s.downcase}%") }
  scope :with_archived, lambda{ |q| where("is_archived = ?", q.to_i == 1) }
  scope :for_campaigns, lambda { |campaign_ids| joins(:campaigns_results).where("campaigns_results.campaign_id IN (?)", campaign_ids).select("distinct(results.id), results.*")  }
  scope :with_reported, where("is_reported is true")

  validates :name, :presence => true

  validate :check_is_global
  validate :check_survey_fields_quantity

  include ScopedSearch::Model

  acts_as_taggable

  after_initialize do
    self.settings ||= {}
  end

  def to_s
    name
  end

  def label
    name.gsub(" ","_").downcase.to_sym
  end

  def created_by_or_admin?(user)
    creator_id == user.id or user.has_role?(:admin)
  end

  def can_be_managed_by?(user)
    (created_by_or_admin?(user) or user.has_role?(:call_centre))
  end

  def list_of_fields
    result_fields.order(:created_at).map(&:name).join(", ")
  end

  def send_material?
    result_fields.map(&:field_type).include?(ResultField::MATERIAL.to_s)
  end

  def upgrades_to_category_supplier?
    name == "Upgrade to category supplier"
  end

  def upgrades_to_supplier?
    name == "Upgrade to supplier"
  end

  def upgrades_to_member?
    name == "Upgrade to member"
  end

  def upgrades_to_any_user?
    upgrades_to_category_supplier? or upgrades_to_supplier? or upgrades_to_member?
  end

  def upgrades_to_user_role
    if upgrades_to_category_supplier?
      :category_supplier
    elsif upgrades_to_supplier?
      :supplier
    elsif upgrades_to_member?
      :member
    end
  end

  def email_template_name_for_type
    if upgrades_to_member?
      "upgrade_contact_to_member"
    elsif upgrades_to_supplier?
      "upgrade_contact_to_buyer"
    elsif upgrades_to_category_supplier?
      "upgrade_contact_to_category_buyer"
    elsif send_material?
      "result_send_material"
    end
  end

  def email_template_variables_for_type
    template = EmailTemplate.find_by_uniq_id(email_template_name_for_type)
    template ? template.available_variables : []
  end

  def available_variables
    vars = EmailTemplate.available_variables_for((upgrades_to_any_user? or upgrades_to_lead?) ? name.downcase.gsub(" ", "_") : "common_result")
    vars = vars - ["{{user.category_supplier_category_home_url}}"] if upgrades_to_member? or upgrades_to_supplier?
    vars
  end

  def has_any_call_results?(campaign)
    CallResult.joins(:contact).where("result_id = ? and campaign_id = ?", id, campaign.id).first
  end

  def can_be_local?
    campaigns_results.count <= 1
  end

  def check_is_global
    if is_global_changed? and !is_global? and !can_be_local?
      self.errors.add(:is_global, I18n.t("models.result.is_global_cannot_be_disabled"))
    end
  end

  def check_survey_fields_quantity
    if (survey_fields = result_fields.select { |rf| rf.field_type.to_i == ResultField::SURVEY }) and survey_fields.size > 1
      self.errors.add(:name, I18n.t("models.result.survey_result_fields_quantity"))
    end
  end

  def assign_to_campaign_if_local(campaign)
    unless is_global?
      campaign.results << self
      campaign.save
    end
  end

  def check_call_results
    !call_results.present?
  end

  class << self
    def call_back_private
      generic_results.find_by_name("Call back private")
    end
  end
end