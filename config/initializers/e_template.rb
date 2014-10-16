module ETemplate
  module MethodDelegator
    def self.included(base)
      base.send :extend, ClassMethods
    end

    module InstanceMethods
      def to_liquid
        self.class.const_get("LIQUID_METHODS").call(self)
      end
    end

    module ClassMethods
      def liquid *args
        _lambda = lambda do |obj|
          args.inject({}) do |methods_hash, method_name|
            methods_hash.merge({method_name.to_s => (obj.respond_to?(method_name) ? obj.send(method_name) : nil)})
          end
        end
        self.const_set("LIQUID_METHODS", _lambda)
        self.send :include, ETemplate::MethodDelegator::InstanceMethods
      end
    end
  end
end

ActiveRecord::Base.send :include, ETemplate::MethodDelegator
