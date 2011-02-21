class Administration::CategoriesController < Administration::AdministrationController
  inherit_resources

  set_tab "categories"

  def create
    @category = Category.new(params[:category])
    @category.customers = []
    @category.agents = []
    respond_to do |format|
      if @category.save
        @category.customer_ids = params[:category][:customer_ids]
        @category.agent_ids = params[:category][:agent_ids]
        @category.save
        format.html { redirect_to administration_categories_path }
      else
        format.html { render 'new' }
      end
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to administration_categories_path }
      failure.html { render 'edit' }
    end
  end

  def destroy
    destroy! do |success, failure|
      success.html {
        flash[:notice] = I18n.t("flash.categories.actions.destroy.notice")
        redirect_to administration_categories_path }
      failure.html {
        flash[:notice] = I18n.t("flash.categories.actions.destroy.error")
        redirect_to administration_categories_path }
    end
  end
end
