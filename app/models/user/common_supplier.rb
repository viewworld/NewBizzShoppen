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

    def make_buying_categories_unique
      if auto_buy_enabled? and is_category_supplier?
        (respond_to?(:buying_categories) ? buying_categories : with_role.buying_categories).select { |c| !c.is_customer_unique? }.each do |category|
          category.update_attribute(:is_customer_unique, true)
          CategoryCustomer.create(:user => self, :category => category)
        end
      end
    end

    def handle_auto_buy
      make_buying_categories_unique
      if unique_categories.any? and big_buyer? and (!is_category_supplier? or (is_category_supplier? and auto_buy_enabled?))
        unique_categories.select{ |c| !c.auto_buy }.each do |category|
          category.update_attribute(:auto_buy, true) if category.customers.size == 1
        end
      elsif unique_categories.any? and (!big_buyer? or (!is_category_supplier? or (is_category_supplier? and !auto_buy_enabled?)))
        unique_categories.select{ |c| c.auto_buy }.each do |category|
          category.update_attribute(:auto_buy, false)
        end
      end
    end

    def create_or_update_company_unique_category
      unless parent
        if company_unique_category.nil?
          uniq_category = LeadCategory.for_company_name(company_name)
          self.company_unique_category = uniq_category
        elsif company_name_changed?
          company_unique_category.update_attribute(:name, company_name)
        end
        company_unique_category.update_attribute(:is_customer_unique, true) unless company_unique_category.is_customer_unique

        add_supplier_to_category_unique_customers

        if (has_role?(:category_supplier) or is_a?(User::CategorySupplier)) and auto_buy_enabled? and !big_buyer?
          self.big_buyer = true
        end

        if big_buyer? and auto_buy_enabled? and company_unique_category.customers.count <= 1 and !company_unique_category.auto_buy?
          company_unique_category.update_attribute(:auto_buy, true)
        elsif (!big_buyer? or !auto_buy_enabled?) and company_unique_category.auto_buy?
          company_unique_category.update_attribute(:auto_buy, false)
        end

      end
      true
    end

    def add_supplier_to_category_unique_customers
      if company_unique_category and !new_record? and company_unique_category.customers.empty?
        CategoryCustomer.create(:user => self, :category => company_unique_category)
      end
    end

    public

    def is_category_supplier?
      (has_role?(:category_supplier) or is_a?(User::CategorySupplier))
    end

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

    def deals
      Deal.where("creator_id = ? or email_address = ?", id, email)
    end

    def link_to_campaign_monitor_account
      "https://fairleads.createsend.com/login.aspx?ReturnUrl=%2f&username=#{cm_username}&password=#{cm_password}"
    end
  end
end