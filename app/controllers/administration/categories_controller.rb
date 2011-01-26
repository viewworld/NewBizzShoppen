class Administration::CategoriesController < Administration::AdministrationController
  inherit_resources

  set_tab "categories"

  def create
    @category = Category.new(params[:category])
    @category.lead_templates.select { |lt| lt.new_record? }.each { |lt| lt.creator = current_user }
    create! do |success, failure|
      success.html { redirect_to administration_categories_path }
      failure.html { render 'new' }
    end
  end

  def update
    @category = Category.find(params[:id])
    @category.attributes = params[:category]
    @category.lead_templates.select { |lt| lt.new_record? }.each { |lt| lt.creator = current_user }
    respond_to do |format|
      if @category.save
        format.html { redirect_to administration_categories_path }
      else
        format.html { render 'edit' }
      end
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
