class DealsController < ApplicationController
  inherit_resources
  actions :index, :show, :update
  set_tab "browse_deals"

  include ::DealCertificationRequestActions
  before_filter :check_slug, :only => [:index]
  before_filter :set_deal, :only => [:edit, :update]

  private

  def check_slug
    params[:search] ||= {}
    if params[:search] and !params[:search][:with_keyword].blank? and params[:slag]
      redirect_to deals_path(:search => params[:search].except(:with_category))
    elsif params[:slag] and deal_category = DealCategory.where(:cached_slug => params[:slag]).first
      params[:search][:with_category] = deal_category.id
    end
  end

  public

  def collection
    @countries = (current_user and current_user.has_accessible_categories?) ? Country.within_accessible_categories(current_user) : Country.all

    @search = Deal.scoped_search(params[:search])
    @search.published_only = true
    @search.without_inactive = true
    @search.not_blocked_by_sold_out_vouchers = true

    @deals = @search.order("group_deal DESC, header").paginate(:page => params[:page], :per_page => Settings.default_leads_per_page, :show_all => params[:show_all] == "1")

    if user_signed_in? and current_user.has_role?(:admin)
      categories_scope = Category.scoped
    elsif user_signed_in?
      categories_scope = current_user.has_accessible_categories? ? Category.within_accessible(current_user).without_locked : current_user.has_role?(:supplier) ? Category.without_locked.with_supplier_unique(current_user).scoped : Category.without_locked_and_not_published.with_agent_unique(current_user).scoped
    else
      categories_scope = Category.without_locked.without_unique.scoped
    end

    @category = categories_scope.where(:id => @search.with_category).first
    @categories = (params[:slag].present? and @category) ? categories_scope.where("categories.id in (?)", @category.self_and_descendants.map(&:id)) : categories_scope.all

    @search.with_selected_categories = (params[:slag].present? and @category) ? @categories.all : nil
  end

  def index
    index! do |format|
      if params[:slag].present? and !@category
        format.html { redirect_to deal_categories_path }
      else
        format.html { render :action => :index }
      end
    end
  end

  def show
    @deal = Deal.find(params[:id].split("-").first)
  end

  def rate
    @deal = Deal.find(params[:id])
    @deal.rate(params[:stars], current_user, params[:dimension]) unless @deal.rated_by?(current_user, params[:dimension])
    render :update do |page|
      page << %{$('##{@deal.wrapper_dom_id(params)}').html('#{ratings_for(@deal, params.merge(:wrap => false))}');}.html_safe
      page << %{$('##{@deal.wrapper_dom_id(params)}').effect('highlight', {}, 3000);}.html_safe
    end
  end

  def show_all
    @deals = Deal.without_inactive

    respond_to do |format|
      format.js {  }
    end
  end
end