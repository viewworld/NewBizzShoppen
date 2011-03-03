class LeadTemplateValueTranslation < ActiveRecord::Base
  belongs_to :lead_template_value
  attr_accessor :cached_field_type

  def field_type
    if cached_field_type
      cached_field_type
    elsif lead_template_value
      lead_template_value.field_type
    else
      0
    end
  end
end