class LeadTemplate < ActiveRecord::Base
  include ScopedSearch::Model

  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  belongs_to :category
  has_many :lead_template_fields, :dependent => :destroy, :order => "name"
  has_and_belongs_to_many :deals, :class_name => "Deal", :join_table => "leads_lead_templates", :foreign_key => "lead_template_id", :association_foreign_key => "lead_id"

  scope :with_creator, lambda { |creator_id| where("creator_id = ?", creator_id) }
  scope :with_keyword, lambda { |q| where("lower(name) like :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :with_category, lambda { |category_id| where("category_id = ?", category_id) }
  scope :with_category_and_its_ancestors, lambda { |category| where("lead_templates.category_id in (?)", category.self_and_ancestors.map(&:id)).joins(:category) }

  before_destroy :can_be_removed

  validates_presence_of :name

  accepts_nested_attributes_for :lead_template_fields, :allow_destroy => true

  attr_accessor :current_user
  attr_protected :name, :is_mandatory, :is_active
  BLACK_LISTED_ATTRIBUTES = [:name, :is_mandatory, :is_active].freeze

  translates :name

  private

  def is_filled_out?
    !lead_template_fields.detect { |ltf| !ltf.lead_template_values.empty? }.nil?
  end

  def can_be_removed
    current_user and current_user == creator and !is_filled_out?
  end

  def mass_assignment_authorizer(role = :default)
    if self.current_user and (self.current_user.has_role?(:admin) or self.current_user == self.creator)
      self.class.protected_attributes.reject! { |a| BLACK_LISTED_ATTRIBUTES.include?(a.to_sym)  }
      self.class.protected_attributes
    else
      super
    end
  end

  public

  def is_filled_out_for(lead)
    return false if lead.nil?
    values = lead.lead_template_values.select { |ltv| ltv.lead_template_field.lead_template_id == id }
    !values.map(&:value).detect { |v| !v.blank? }.nil?
  end

  def duplicate_fields(template, with_values=false, lead=nil)
    if template
      ["name", "is_mandatory"].each do |field|
         self.send("#{field}=".to_sym, template.send(field.to_sym))
      end

      template.lead_template_fields.each do |field|
        if with_values
          lead_template_field = field.deep_clone({:include => [:lead_template_field_translations] })
          lead_template_field.lead_template_field_translations.each { |ltft| ltft.lead_template_field = lead_template_field }
        else
          lead_template_field = LeadTemplateField.new
        end
        ["name", "field_type", "is_mandatory", "is_hidden"].each do |f_field|
          lead_template_field.send("#{f_field}=".to_sym, field.send(f_field.to_sym))
        end
        self.lead_template_fields << lead_template_field
        if with_values
          if lt_value = field.lead_template_values.detect { |ltv| ltv.lead_id == lead.id }
            lt_value_new = lt_value.deep_clone({:include => [:lead_template_value_translations]})
            lt_value_new.lead_template_value_translations.each { |ltvt| ltvt.lead_template_value = lt_value_new }
            lt_value_new.attributes = {:lead_template_field => lead_template_field, :lead => lead, :value => lt_value.value}
            lead_template_field.lead_template_values << lt_value_new
          end
        end
      end

      if with_values
        self.is_mandatory = false
        self.save
        self.lead_template_fields.each do |field|
          field.lead_template_field_translations.each { |ltft| ltft.lead_template_field = field; ltft.save }
          field.lead_template_values.each do |t_value|
            t_value.lead_template_field_id = field.id
            t_value.save
            t_value.lead_template_value_translations.each { |ltvt| ltvt.lead_template_value_id = t_value.id; ltvt.save }
          end
        end
      end
    end
  end
end
