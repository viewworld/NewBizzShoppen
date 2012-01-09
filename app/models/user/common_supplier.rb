module User::CommonSupplier
  def self.included(base)
    base.class_eval do
      has_many :category_customers, :foreign_key => "user_id"
      has_many :unique_categories, :through => :category_customers, :foreign_key => "user_id", :source => :category
      after_save :handle_auto_buy
      before_save :create_or_update_company_unique_category
      after_create :add_supplier_to_category_unique_customers
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

    def create_or_update_company_unique_category
      unless parent
        if company_unique_category.nil?
          uniq_category = LeadCategory.where(:name => company_name).first || LeadCategory.create(:name => company_name, :currency => Currency.default_currency, :buyout_enabled => false)
          self.company_unique_category = uniq_category
        elsif company_name_changed?
          company_unique_category.update_attribute(:name, company_name)
        end
        company_unique_category.update_attribute(:is_customer_unique, true) unless company_unique_category.is_customer_unique

        add_supplier_to_category_unique_customers

        if (has_role?(:category_supplier) or is_a?(User::CategorySupplier)) and !big_buyer?
          self.big_buyer = true
        end

        company_unique_category.update_attribute(:auto_buy, true) if big_buyer? and !company_unique_category.auto_buy?
      end
      true
    end

    def add_supplier_to_category_unique_customers
      if company_unique_category and !new_record? and !company_unique_category.customer_ids.include?(self.id)
        CategoryCustomer.create(:user => self, :category => company_unique_category)
      end
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