class CategoryInterestsController < ApplicationController

  def create
    category = LeadCategory.find(params[:category_id])
    user = ::User::Customer::find_by_id(current_user.id)
    user.categories.include?(category) ? CategoryInterest.where(:user_id => user.id, :category_id => category.id).delete_all : user.categories << category
  end

end