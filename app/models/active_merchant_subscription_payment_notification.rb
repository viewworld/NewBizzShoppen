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
        user = active_subscription.user
        if active_subscription.unconfirmed_payment?
          active_subscription.confirm_payment!
          update_subscription(user.active_subscription, payment_notification, params)
        elsif subscription_plan and active_subscription.total_billing < subscription_plan.total_billing
          user.upgrade_subscription!(subscription_plan)
          update_subscription(user.active_subscription, payment_notification, params)
        elsif subscription_plan and active_subscription.total_billing > subscription_plan.total_billing
          user.downgrade_subscription!(subscription_plan)
          if user.errors.empty?
            update_subscription(user.subscriptions.order("created_at").last, payment_notification, params)
          else
            ActiveMerchantRecurringProfile.new(payment_notification.transaction_id).cancel_profile
            user.notify!(:title => I18n.t("notifications.subscription.downgrade_failed.title"), :text => I18n.t("notifications.subscription.downgrade_failed.body", :error => user.errors.full_messages))
          end
        else
          EmailNotification.notify("Quickpay subscription confirmation failed: target subscription not found", "<p>ActiveMerchantSubscriptionPaymentNotification: #{payment_notification.id}</p> <>br /> Backtrace: <p>#{payment_notification.params.inspect}</p>")
          return false
        end
      else
        EmailNotification.notify("Quickpay subscription confirmation failed: subscription not found", "<p>ActiveMerchantSubscriptionPaymentNotification: #{payment_notification.id}</p> <>br /> Backtrace: <p>#{payment_notification.params.inspect}</p>")
      end
    end
  end

  def self.update_subscription(subscription, payment_notification, params)
    subscription.update_attributes(:payment_profile_id => payment_notification.transaction_id, :payment_type => Subscription::QUICKPAY_PAYMENT_TYPE,
                                   :payment_order_number => params[:ordernumber])
  end
end