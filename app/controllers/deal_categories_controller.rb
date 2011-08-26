class DealCategoriesController < ApplicationController
  set_tab "browse_deals"

  before_filter :set_category_type

  private

  def set_category_type
    @category_type = "DealCategory"
  end
end