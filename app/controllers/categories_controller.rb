class CategoriesController < ApplicationController
  set_tab "browse_leads"

  before_filter :check_category_supplier
  before_filter :set_category_type

  def index
    params[:search] ||= {}
    params[:search][:with_roots] = true

    if user_signed_in? and current_user.admin?
      params[:search][:with_unique] = "true" if params[:search][:with_unique].nil?
      params[:search][:with_public] = "true" if params[:search][:with_public].nil?
    end

    @search = @category_type.constantize.scoped_search(params[:search])
    @categories = @search.order("name")
  end

  private

  def check_category_supplier
    # left intentionally blank to remove logic from inherited controller
  end

  def set_category_type
    @category_type = "LeadCategory"
  end
end


