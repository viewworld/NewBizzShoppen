module RoleChange

  def self.included(base)
    base.class_eval do
      attr_accessor :roles_to_remove, :roles_to_add
      before_save :check_changed_roles
    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    private
    def check_changed_roles
      if roles_to_remove.is_a?(Array) and roles_to_remove.any?
        roles_to_remove.each do |role_to_remove|
          send("remove_role_#{role_to_remove}")
        end
      end
      if roles_to_add.is_a?(Array) and roles_to_add.any?
        roles_to_add.each do |role_to_add|
          send("add_role_#{role_to_add}")
        end
      end
    end

    def remove_role_category_buyer
      self.buying_categories = []
      self.roles.delete(:category_buyer)
      User::LeadBuyer.find(subaccounts.map(&:id)).each do |sa|
        sa.roles.delete(:category_buyer)
        sa.save
      end
    end

    def add_role_category_buyer
      self.roles << :category_buyer
      subaccounts.map(&:with_role).each do |sa|
        sa.roles << :category_buyer
        sa.save
      end
    end
  end

end