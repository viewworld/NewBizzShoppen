class Result < ActiveRecord::Base

  PENDING_RESULTS = [:call_back, :not_interested_now]

  has_many :call_results
  has_many :contacts, :through => :call_results
  has_many :campaigns_results, :foreign_key => "result_id"
  has_many :campaigns, :through => :campaigns_results, :foreign_key => "result_id"
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"

  has_many :result_fields, :dependent => :destroy
  accepts_nested_attributes_for :result_fields, :allow_destroy => true
  accepts_nested_attributes_for :campaigns_results

  scope :call_log_results, where(:final => false)
  scope :final_results, where(:final => true)
  scope :generic_results, where(:generic => true)
  scope :custom_results, where(:generic => false)
  scope :not_in_result, where("name = 'Not in'")
  scope :not_archived_or_assigned_to_campaign, lambda { |campaign| joins(:campaigns_results).where("campaigns_results.campaign_id = ? or results.is_archived is false", campaign.id).select("distinct(results.id), results.*") }
  scope :with_keyword, lambda { |q| where("lower(name) like ?", "%#{q.to_s.downcase}%") }
  scope :with_archived, lambda{ |q| where("is_archived = ?", q.to_i == 1) }
  scope :for_campaigns, lambda { |campaign_ids| joins(:campaigns_results).where(:campaign_id => campaign_ids).select("distinct(results.id), results.*")  }
  scope :with_reported, where("is_reported is true")

  validates :name, :presence => true
  #validate :check_is_reported_and_is_success

  include ScopedSearch::Model

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
    result_fields.map(&:name).join(", ")
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

  #private
  #
  #def check_is_reported_and_is_success
  #  if call_results.any?
  #    if !is_reported? and is_reported_changed?
  #      self.errors.add(:is_reported, I18n.t("models.result_field.is_reported_cannot_be_disabled"))
  #    end
  #    if !is_success? and is_success_changed?
  #      self.errors.add(:is_success, I18n.t("models.result_field.is_success_cannot_be_disabled"))
  #    end
  #  end
  #end
end