class CategoryUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  before_create :set_user_type
  after_create :assign_category_to_customer_interests
  before_destroy :unassign_category_to_customer_interests

  def set_user_type
    self.user_type = user.role.to_s
  end

  def customer
    user_type == "customer" ? user.send(:casted_class).find(user_id) : nil
  end

  def assign_category_to_customer_interests
    if customer
      customer.categories << category unless customer.categories.include?(category)
      customer.save
    end
  end

  def unassign_category_to_customer_interests
    if customer
      customer.categories.delete(category)
      customer.save
    end
  end
end
