class CategoryCustomer < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  after_create :assign_category_to_supplier_interests

  def supplier
    user.with_role
  end

  def assign_category_to_supplier_interests
    unless supplier.category_ids.include?(category.id)
      supplier.categories << category
      supplier.save
    end
  end
end