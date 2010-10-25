require "method_delegator"

ActiveRecord::Base.send :include, ETemplate::MethodDelegator