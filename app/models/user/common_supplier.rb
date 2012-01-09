module User::CommonSupplier
  def self.included(base)
    base.class_eval do
      has_many :category_customers, :foreign_key => "user_id"
      has_many :unique_categories, :through => :category_customers, :foreign_key => "user_id", :source => :category
      after_save :handle_auto_buy
      after_create :create_company_unique_category
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

    def create_company_unique_category

    end

    public

    def accessible_categories
      unique_categories.any? ? unique_categories : LeadCategory.without_locked
    end

    def can_auto_buy?(lead)
      if lead.deal.present?
        if lead.deal.max_auto_buy.to_i > 0
          LeadPurchase.where("leads.category_id = ? and lead_purchases.owner_id = ? and lead_purchases.created_at::DATE BETWEEN ? AND ? and leads.deal_id = ?",
                             lead.category_id, self.id, lead.deal.current_four_week_period_start_date, Date.today, lead.deal_id).joins(:lead).count < lead.deal.max_auto_buy
        else
          false
        end
      else
        true
      end
    end

  end
end