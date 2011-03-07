class LeadTemplate < ActiveRecord::Base
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  belongs_to :category
  has_many :lead_template_fields, :dependent => :destroy

  scope :with_creator, lambda { |creator_id| where("creator_id = ?", creator_id) }
  scope :with_keyword, lambda { |q| where("lower(name) like :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :with_category, lambda { |category_id| where("category_id = ?", category_id) }
  scope :with_category_and_its_ancestors, lambda { |category| where("lead_templates.category_id in (?)", category.self_and_ancestors.map(&:id)).joins(:category) }

  include ScopedSearch::Model

  before_destroy :can_be_removed

  validates_presence_of :name

  accepts_nested_attributes_for :lead_template_fields, :allow_destroy => true

  attr_accessor :current_user
  attr_protected :name, :is_mandatory, :is_active
  BLACK_LISTED_ATTRIBUTES = [:name, :is_mandatory, :is_active].freeze

  translates :name

  private

  def is_filled_out?
    !LeadTemplateValue.first(:conditions => ["lead_template_field_id in (?)", lead_template_fields.map(&:id)]).nil?
  end

  def can_be_removed
    current_user and current_user == creator and !is_filled_out?
  end

  def mass_assignment_authorizer
    if self.current_user and (self.current_user.has_role?(:admin) or self.current_user == self.creator)
      attr_array = self.current_user == self.creator ? BLACK_LISTED_ATTRIBUTES : [:is_mandatory]
      self.class.protected_attributes.reject! { |a| attr_array.include?(a.to_sym)  }
      self.class.protected_attributes
    else
      super
    end
  end

  public

  def is_filled_out_for(lead)
    values = lead.lead_template_values.select { |ltv| ltv.lead_template_field.lead_template_id == id }
    !values.map(&:value).detect { |v| !v.blank? }.nil?
  end
end
