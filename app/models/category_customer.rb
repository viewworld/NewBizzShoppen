class CategoryCustomer < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  after_create :assign_category_to_supplier_interests

  def supplier
    user.send(:casted_class).find(user_id)
  end

  def assign_category_to_supplier_interests
    supplier.categories << category unless supplier.categories.include?(category)
    supplier.save
  end
end