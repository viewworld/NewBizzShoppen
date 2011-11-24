module CommonSubscriptions

  def self.included(base)
    base.class_eval do

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

  end
end