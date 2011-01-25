class LeadTemplateValue < ActiveRecord::Base
  belongs_to :lead_template_field
  belongs_to :lead

  validates_presence_of :value
end
