module User::Subaccounts

  def self.included(base)
    base.class_eval do
      attr_accessor :lead_buyer_role_enabled

      before_update :check_lead_buyer_role
      after_find :set_lead_buyer_role_enabled
    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    private
    def set_lead_buyer_role_enabled
      self.lead_buyer_role_enabled = has_role?(:lead_buyer) ? true : false
    end

    def check_lead_buyer_role
      if lead_buyer_role_enabled
        self.lead_buyer_role_enabled = ActiveRecord::ConnectionAdapters::Column.value_to_boolean(lead_buyer_role_enabled)
        if has_role? :lead_buyer and !lead_buyer_role_enabled
           self.roles.delete(:lead_buyer)
        elsif has_role? :lead_user and lead_buyer_role_enabled
          self.roles << :lead_buyer
        end
      end
    end
  end
end