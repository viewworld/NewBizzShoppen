class LeadTemplateField < ActiveRecord::Base
  belongs_to :lead_template
  has_many :lead_template_value
end
