class DealsController < ApplicationController
  inherit_resources
  actions :index, :show, :update
  set_tab "browse_deals"

  include ::DealCertificationRequestActions
  before_filter :set_deal, :only => [:edit, :update]

  def collection
    @search = Deal.scoped_search(params[:search])
    @search.published_only = true
    @search.without_inactive = true

    @category = Category.find_by_id(@search.with_category)
    @countries = (current_user and current_user.has_accessible_categories?) ? Country.with_leads.within_accessible_categories(current_user) : Country.with_leads
    @deals = @search.paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)

    if user_signed_in? and current_user.has_role?(:admin)
      @categories_scope = Category.scoped
    elsif user_signed_in?
      @categories_scope = current_user.has_accessible_categories? ? Category.within_accessible(current_user).without_locked_and_not_published : current_user.has_role?(:customer) ? Category.without_locked_and_not_published.with_customer_unique(current_user).scoped : Category.without_locked_and_not_published.with_agent_unique(current_user).scoped
    else
      @categories_scope = Category.without_locked_and_not_published.without_unique.scoped
    end

    if @search.with_category.present?
      @category = @categories_scope.find(@search.with_category)
      @category = @category.root unless @category.root?
    elsif @search.with_selected_categories.present?
      category = @categories_scope.where("categories.id in (?)", @search.with_selected_categories).first
      @category = category ? category.root : nil
    end
    @categories = @category ? @categories_scope.with_leads.where("categories.id in (?)", @category.self_and_descendants.map(&:id)) : []
  end

  def rate
    @deal = Deal.find(params[:id])
    @deal.rate(params[:stars], current_user, params[:dimension])
    render :update do |page|
      page << %{$('##{@deal.wrapper_dom_id(params)}').html('#{ratings_for(@deal, params.merge(:wrap => false))}');}.html_safe
      page << %{$('##{@deal.wrapper_dom_id(params)}').effect('highlight', {}, 3000);}.html_safe
    end
  end
end