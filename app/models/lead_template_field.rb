class LeadTemplateField < ActiveRecord::Base

  STRING = 0.freeze
  INTEGER = 1.freeze
  DATE = 2.freeze
  NOTE = 3.freeze
  FIELD_TYPES = [STRING, INTEGER, DATE, NOTE]

  belongs_to :lead_template
  has_many :lead_template_value

  validates_presence_of :name, :field_type

  translates :name

  def value_for_lead(lead)
    ltv = LeadTemplateValue.first(:conditions => ["lead_id = ? and lead_template_field_id = ?", lead.id, id])
    ltv.nil? ? "" : ltv.value
  end
end
