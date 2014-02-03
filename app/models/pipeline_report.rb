class PipelineReport < ActiveRecord::Base
  belongs_to :user, :foreign_key => :owner_id

  FIELDS_FOR_DISPLAY = %w(company_name lead_header contact_name decision_date state value estimate pipeline_value)

  def state_for_display
    I18n.t(LeadPurchase::STATUSES[state], :scope => 'lead_purchases.statuses')
  end

  def euro_value_for_currency(currency)
    currency.from_euro(euro_value)
  end

  def euro_pipeline_value_for_currency(currency)
    currency.from_euro(euro_pipeline_value)
  end
end
