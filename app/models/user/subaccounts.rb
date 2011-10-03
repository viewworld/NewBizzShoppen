module User::Subaccounts

  def self.included(base)
    base.class_eval do
      attr_accessor :lead_supplier_role_enabled_flag

      before_update :check_lead_supplier_role
      before_create :check_parent_for_category_supplier
    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods

    def lead_supplier_role_enabled
      if lead_supplier_role_enabled_flag.nil?
        self.lead_supplier_role_enabled_flag = self.has_role?(:lead_supplier) ? true : false
      end
      lead_supplier_role_enabled_flag
    end

    def lead_supplier_role_enabled=(enabled)
      self.lead_supplier_role_enabled_flag = enabled
    end

    private

    def check_lead_supplier_role
      if lead_supplier_role_enabled
        self.lead_supplier_role_enabled = ActiveRecord::ConnectionAdapters::Column.value_to_boolean(lead_supplier_role_enabled)
        if has_role? :lead_supplier and !lead_supplier_role_enabled
           self.roles.delete(:lead_supplier)
        elsif has_role? :lead_user and lead_supplier_role_enabled
          self.roles << :lead_supplier
        end
      end
    end

    def check_parent_for_category_supplier
      if parent and parent.has_role?(:category_supplier)
        self.roles << :category_supplier
      end
    end

  end
end