class LeadTemplateDecorator < ApplicationDecorator
  def admin_title
    "#{t('administration.lead_templates.edit.view.created_by')}: #{object.creator}"
  end
end
