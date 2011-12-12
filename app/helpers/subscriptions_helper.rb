module SubscriptionsHelper

  def subscription_upgrade_or_downgrade?(current_subscription, other_subscription)
    if other_subscription.billing_price.to_f >= current_subscription.billing_price.to_f
      :upgrade
    else
      :downgrade
    end
  end

end