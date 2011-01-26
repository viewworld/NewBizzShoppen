class Administration::CategoriesController < Administration::AdministrationController
  inherit_resources

  set_tab "categories"

  def create
    create! do |success, failure|
      success.html { redirect_to administration_categories_path }
      failure.html { render 'new' }
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
