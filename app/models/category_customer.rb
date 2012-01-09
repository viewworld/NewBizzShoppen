class CategoryCustomer < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  after_create :assign_category_to_supplier_interests

  def supplier
    user.with_role
  end

  def assign_category_to_supplier_interests
    unless user.deal_category_id == category.id
      supplier.categories << category unless supplier.categories.include?(category)
      supplier.save
    end
  end
end