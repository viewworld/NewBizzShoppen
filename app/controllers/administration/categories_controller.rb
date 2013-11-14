class Administration::CategoriesController < Administration::AdministrationWithSupplierController
  inherit_resources

  before_filter :set_category_type
  before_filter :set_tab, :only => [:new,:create]

  before_filter :filter_category_params_for_roles, :only => [:create, :update]

  def new
    @category = @category_type.constantize.new(:buyout_enabled => false)
  end

  def create
    @category = @category_type.constantize.new(params[:category])
    @category.customers = []
    @category.agents = []
    @category.is_customer_unique = true if current_user.supplier_non_admin?

    respond_to do |format|
      if @category.save
        @category.customer_ids = params[:category][:customer_ids]
        @category.agent_ids = params[:category][:agent_ids]
        @category.save
        @category.move_leads_to_subcategory
        flash[:notice] = I18n.t("flash.categories.create.notice")
        format.html { redirect_to @category_type == "LeadCategory" ? categories_path : deal_categories_path }
      else
        @category.customer_ids = params[:category][:customer_ids]
        @category.agent_ids = params[:category][:agent_ids]
        format.html { render 'new' }
      end
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to @category.is_a?(LeadCategory) ? categories_path : deal_categories_path }
      failure.html { render 'edit' }
    end
  end

  def destroy
    destroy! do |success, failure|
      success.html {
        flash[:notice] = I18n.t("flash.categories.destroy.notice")
        redirect_to categories_path }
      failure.html {
        flash[:notice] = I18n.t("flash.categories.destroy.error")
        redirect_to categories_path }
    end
  end

  private

  def filter_category_params_for_roles
    if current_user.supplier_non_admin? && params[:category]
      params[:category].delete(:is_customer_unique)
    end
  end

  def set_category_type
    @category_type = params[:category_type] || "LeadCategory"
  end

  def set_tab
    self.class.set_tab(@category_type == "LeadCategory" ? "browse_leads" : "browse_deals")
  end

  def resource
    @category = Category.find(params[:id])
    @category_type = @category.class.to_s
    set_tab
    @category
  end

end
