module User::CommonBuyer
  def self.included(base)
    base.class_eval do
      has_many :category_customers, :foreign_key => "user_id"
      has_many :unique_categories, :through => :category_customers, :foreign_key => "user_id", :source => :category
      after_save :handle_auto_buy
    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods

    private

    def handle_auto_buy
      if unique_categories.any? and big_buyer?
        unique_categories.select{ |c| !c.auto_buy }.each do |category|
          category.update_attribute(:auto_buy, true) if category.customers.size == 1
        end
      elsif unique_categories.any? and !big_buyer?
        unique_categories.select{ |c| c.auto_buy }.each do |category|
          category.update_attribute(:auto_buy, false)
        end
      end
    end

    public

    def accessible_categories
      unique_categories.any? ? unique_categories : LeadCategory.without_locked
    end

  end
end