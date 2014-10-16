class CategoriesController < ApplicationController
  set_tab "browse_leads"

  before_filter :check_category_supplier
  before_filter :set_category_type

  def index
    if user_signed_in? and current_user.admin?
      params[:search] ||= {}
      params[:search][:with_unique] = "true" if params[:search][:with_unique].nil?
      params[:search][:with_public] = "true" if params[:search][:with_public].nil?
    end

    @search = @category_type.constantize.scoped_search(params[:search])
    @categories = @search.roots_for(current_user).with_translations.select('category_translations.name, categories.*').order('category_translations.name')
  end

  private

  def check_category_supplier
    if current_user and current_user.has_role?(:category_supplier)
      redirect_to category_home_page_path(current_user.parent_buying_categories.first.cached_slug)
    end
  end

  def set_category_type
    @category_type = "LeadCategory"
  end
end


