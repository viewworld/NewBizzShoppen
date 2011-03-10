class CategoryCustomer < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  after_create :assign_category_to_customer_interests

  def customer
    user.send(:casted_class).find(user_id)
  end

  def assign_category_to_customer_interests
    customer.categories << category unless customer.categories.include?(category)
    customer.save
  end
end