class LeadTemplate < ActiveRecord::Base
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  belongs_to :category
  has_many :lead_template_fields, :dependent => :destroy

  scope :with_creator, lambda { |creator_id| where("creator_id = ?", creator_id) }
  scope :with_keyword, lambda { |q| where("lower(name) like :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :with_category, lambda { |category_id| where("category_id = ?", category_id) }

  include ScopedSearch::Model

  before_destroy :can_be_removed

  validates_presence_of :name

  accepts_nested_attributes_for :lead_template_fields, :allow_destroy => true

  attr_accessor :current_user
  attr_protected :name, :is_mandatory, :is_active
  BLACK_LISTED_ATTRIBUTES = [:name, :is_mandatory, :is_active].freeze

  private

  def is_filled_out?
    LeadTemplateValue.first(:conditions => ["lead_template_fields.lead_template_id = ?", id], :joins => :lead_template_field)
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
end
