class Administration::SellersController < Administration::AdministrationController
  inherit_resources

  set_tab "sellers"

  def destroy
    super do |success,failure|
      success.html do
        redirect_to administration_sellers_path
      end
      failure.html do
        redirect_to :back
      end
    end
  end

end