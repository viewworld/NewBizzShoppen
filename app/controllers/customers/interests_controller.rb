class Customers::InterestsController <  Customers::CustomerController
  set_tab "interests_tab"

  def edit
    @categories = Category.with_customer_unique(current_user)
    @countries = Country.all(:order => "name")
  end

  def update
    @categories = params[:categories].nil? ? [] : Category.with_customer_unique(current_user).where(:id => params[:categories])
    @countries = params[:countries].nil? ? [] : Country.where(:id => params[:countries])

    current_user.categories = @categories
    current_user.countries = @countries
    current_user.save
    current_user.update_attributes(params[:user])

    flash[:notice] = t("customer.interests.update.flash.interests_update_successful")
    redirect_to categories_path
  end
end
