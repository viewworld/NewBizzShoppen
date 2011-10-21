module CommonSubscriptions

  def self.included(base)
    base.class_eval do

    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    public

    def payable?
      billing_cycle > 0
    end

    def total_billing
      subscription_plan_lines.inject(0.0){ |result, line| line.price.to_f + result}
    end

    def is_free?
      !payable?
    end

  end
end