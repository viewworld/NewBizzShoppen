class LeadTemplateValue < ActiveRecord::Base
  belongs_to :lead_template_field
  belongs_to :lead
end
