class Administration::CategoriesController < Administration::AdministrationController
  inherit_resources

  def collection
    @categories ||= end_of_association_chain.paginate(:page => params[:page])
  end

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
end
