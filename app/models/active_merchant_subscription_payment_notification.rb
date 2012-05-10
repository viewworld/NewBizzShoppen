class ActiveMerchantSubscriptionPaymentNotification < SubscriptionPaymentNotification

  include QuickpayPayment

  def self.process(params)
    subscription_id = params[:ordernumber].split("_").last
    active_subscription = Subscription.find_by_id(subscription_id)
    subscription_plan = SubscriptionPlan.find_by_id(params[:target_subscription_plan_id])
    payment_notification = ActiveMerchantSubscriptionPaymentNotification.create!(:params => params, :buyer_id => active_subscription.user_id, :status => TRANSACTION_STATUSES[params[:qpstat]], :transaction_id => params[:transaction])

    if payment_notification.status == TRANSACTION_STATUSES[APPROVED] && params[:md5check] == payment_notification.calculate_md5_check(params, :window_response) &&
            params[:merchantemail] == APP_CONFIG[:quickpay_email]

      if active_subscription
        if active_subscription.unconfirmed_payment?
          active_subscription.confirm_payment!
        elsif subscription_plan and active_subscription.total_billing < subscription_plan.total_billing
          active_subscription.user.upgrade_subscription!(subscription_plan)
        elsif subscription_plan and active_subscription.total_billing > subscription_plan.total_billing
          active_subscription.user.downgrade_subscription!(subscription_plan)
        else
          EmailNotification.notify("Quickpay subscription confirmation failed: target subscription not found", "<p>ActiveMerchantSubscriptionPaymentNotification: #{payment_notification.id}</p> <>br /> Backtrace: <p>#{payment_notification.params.inspect}</p>")
        end
      else
        EmailNotification.notify("Quickpay subscription confirmation failed: subscription not found", "<p>ActiveMerchantSubscriptionPaymentNotification: #{payment_notification.id}</p> <>br /> Backtrace: <p>#{payment_notification.params.inspect}</p>")
      end
    end
  end
end