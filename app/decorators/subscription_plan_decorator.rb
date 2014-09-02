class SubscriptionPlanDecorator < ApplicationDecorator
  def use_paypal?
    h.translate_boolean(object.use_paypal?)
  end

  def is_active?
    h.translate_boolean(object.is_active?)
  end

  def is_public?
    h.translate_boolean(object.is_public?)
  end
end
