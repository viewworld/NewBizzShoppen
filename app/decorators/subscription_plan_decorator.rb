class SubscriptionPlanDecorator < ApplicationDecorator
  def use_paypal?
    object.use_paypal? ? t("common.yes_label") : t("common.no_label")
  end

  def is_active?
    object.is_active? ? t("common.yes_label") : t("common.no_label")
  end

  def is_public?
    object.is_public? ? t("common.yes_label") : t("common.no_label")
  end
end
