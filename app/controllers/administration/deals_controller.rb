class Administration::DealsController < Administration::AdministrationController
  before_filter :set_deal, :only => [:edit, :update, :destroy]
  before_filter :prepare_assets, :only => [:edit, :update]

  include ::DealActions
  include ::DealCreateActions

  private

  def success(message)
    flash[:notice] = message
    success_redirect_to("administration")
  end
end