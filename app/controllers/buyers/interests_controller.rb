class Buyers::InterestsController <  Buyers::BuyerController

  def edit
    @categories = Category.all
    @countries = Country.all(:order => "name")
  end

  def update
    @categories = params[:categories].nil? ? [] : Category.where(:id => params[:categories])
    @countries = params[:countries].nil? ? [] : Country.where(:id => params[:countries])

    @buyer.categories = @categories
    @buyer.countries = @countries
    @buyer.save
    @buyer.update_attributes(params[:user])

    flash[:notice] = "Interests configuration has been successfully saved."
    redirect_to edit_buyers_interests_path
  end
end
