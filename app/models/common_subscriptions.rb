module CommonSubscriptions

  def self.included(base)
    base.class_eval do
      before_save :cache_prices
    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    public

    def payable?
      subscription_period > 0
    end

    def total_billing
      subscription_plan_lines.sum(:price)
    end

    def is_free?
      !payable?
    end

    def cache_prices!
      cache_prices
      save!
      reload
    end

  end
end