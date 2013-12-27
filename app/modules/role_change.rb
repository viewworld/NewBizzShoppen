module RoleChange

  def self.included(base)
    base.class_eval do
      attr_accessor :roles_to_remove, :roles_to_add
      before_save :check_changed_roles
      after_update :assign_buying_categories
      before_update :keep_address
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
      errors.empty?
    end

    def remove_role_category_supplier
      self.buying_categories = []
      self.roles.delete(:category_supplier)
      User::LeadUser.find(subaccounts.map(&:id)).each do |sa|
        sa.roles.delete(:category_supplier)
        sa.save
      end
    end

    def add_role_category_supplier
      if unique_categories.empty?
        self.errors.add(:base, I18n.t("activerecord.attributes.user.supplier.base.must_have_unique_categories"))
      else
        self.roles << :category_supplier
        subaccounts.map(&:with_role).each do |sa|
          sa.roles << :category_supplier
          sa.save
        end
      end
    end

    def assign_buying_categories
      if roles_mask_changed? and supplier? and !parent
        new_category_supplier = self.with_role
        new_category_supplier.buying_categories = unique_categories
      end
    end

    def keep_address
      if roles_mask_changed? and !parent
        if self.address
          self.address.addressable_type = "User::#{role.to_s.classify}"
        end
      end
    end
  end

end