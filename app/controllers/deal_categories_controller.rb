class DealCategoriesController < ApplicationController
  set_tab "browse_deals"

  before_filter :set_category_type

  def index
    @search = @category_type.constantize.scoped_search(params[:search])
    @categories = @search.roots_for(current_user).
      with_locale.
      with_translations.
      select('category_translations.name, categories.*').
      order('category_translations.name').uniq
  end

  private

  def set_category_type
    @category_type = "DealCategory"
  end
end
