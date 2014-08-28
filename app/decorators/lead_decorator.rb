class LeadDecorator < Draper::Decorator
  delegate_all

  def admin_title
    "#{h.t('administration.leads.edit.view.created_by')} #{object.creator.company_name} - #{object.creator.email}"
  end
end
