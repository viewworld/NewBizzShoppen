class LeadTemplateField < ActiveRecord::Base

  STRING = 0.freeze
  INTEGER = 1.freeze
  DATE = 2.freeze
  FIELD_TYPES = [STRING, INTEGER, DATE]

  belongs_to :lead_template
  has_many :lead_template_value

  validates_presence_of :name, :field_type
end
