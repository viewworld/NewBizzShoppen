module Administration::SupplierInterestsHelper
  def all_categories_for_interests
    (LeadCategory.without_unique - @user.category_interests).map { |c| [c.name.to_s, c.id] }.sort
  end

  def user_supplier_categories
    (@user.categories - @user.unique_categories).map { |c| [c.name.to_s, c.id] }.sort
  end
end
