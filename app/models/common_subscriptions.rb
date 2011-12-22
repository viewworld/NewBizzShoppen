module CommonSubscriptions

  def self.included(base)
    base.class_eval do
      scope :without_paypal, where(:use_paypal => false)
      scope :with_paypal, where(:use_paypal => true)
    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    public

    def payable?
      subscription_period.to_i > 0
    end

    def total_billing
      periods = (is_a?(SubscriptionPlan) or is_a?(SubscriptionSubPeriod)) ? 1 : number_of_periods
      subscription_plan_lines.sum(:price) * periods
    end

    def is_free?
      !payable? or (respond_to?(:unconfirmed_paypal?) and unconfirmed_paypal?)
    end

    def cache_prices!
      cache_prices
      save!
      reload
    end

    def number_of_periods
      !is_free? ? subscription_period / billing_cycle : 1
    end

    def total_billing_for_subperiod
      total_billing
    end
  end
end