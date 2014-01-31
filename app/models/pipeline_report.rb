class PipelineReport < ActiveRecord::Base
  belongs_to :user, :foreign_key => :owner_id

  def state_for_display
    I18n.t("lead_purchases.statuses.#{LeadPurchase::STATUSES[state]}")
  end
end
