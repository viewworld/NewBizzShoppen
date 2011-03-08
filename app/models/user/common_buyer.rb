module User::CommonBuyer
  def self.included(base)
    base.class_eval do
      has_many :category_customers, :foreign_key => "user_id"
      has_many :unique_categories, :through => :category_customers, :foreign_key => "user_id", :source => :category
    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods

    public

    def accessible_categories
      unique_categories.any? ? unique_categories : Category.without_locked
    end

  end
end