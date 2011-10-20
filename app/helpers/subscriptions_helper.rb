module SubscriptionsHelper

  def subscription_upgrade_or_downgrade?(current_subscription, other_subscription)
    if other_subscription.billing_price >= current_subscription.billing_price
      :upgrade
    else
      :downgrade
    end
  end

end