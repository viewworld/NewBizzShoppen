class CategoriesController < ApplicationController
  set_tab "browse_leads"

  before_filter :check_category_buyer
  before_filter :set_category_type

  private

  def check_category_buyer
    if current_user and current_user.has_role?(:category_buyer)
      redirect_to category_home_page_path(current_user.parent_buying_categories.first.cached_slug)
    end
  end

  def set_category_type
    @category_type = "LeadCategory"
  end

  public

end


