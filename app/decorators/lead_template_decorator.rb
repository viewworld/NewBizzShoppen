class LeadTemplateDecorator < Draper::Decorator
  delegate_all

  def admin_title
    "#{h.t('administration.lead_templates.edit.view.created_by')}: #{object.creator}"
  end
end
