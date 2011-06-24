module User::Subaccounts

  def self.included(base)
    base.class_eval do
      attr_accessor :lead_buyer_role_enabled_flag

      before_update :check_lead_buyer_role
      before_create :check_parent_for_category_buyer
    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods

    def lead_buyer_role_enabled
      if lead_buyer_role_enabled_flag.nil?
        self.lead_buyer_role_enabled_flag = self.has_role?(:lead_buyer) ? true : false
      end
      lead_buyer_role_enabled_flag
    end

    def lead_buyer_role_enabled=(enabled)
      self.lead_buyer_role_enabled_flag = enabled
    end

    private

    def set_lead_buyer_role_enabled
      self.lead_buyer_role_enabled_flag = self.has_role?(:lead_buyer) ? true : false
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

    def check_parent_for_category_buyer
      if parent and parent.has_role?(:category_buyer)
        self.roles << :category_buyer
      end
    end

  end
end