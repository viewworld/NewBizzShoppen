class Suppliers::DealCertificationRequestsController < Suppliers::BasicSupplierController

  before_filter :set_deal, :only => [:edit, :update]

  include ::DealCertificationRequestActions

  def index
    @deal_certification_requests = current_user.deal_certification_requests
  end

end