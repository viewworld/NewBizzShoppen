class Administration::PaypalNotificationsController < Administration::AdministrationController

  inherit_resources


  def collection
    @search = PaymentNotification.scoped_search(params[:search])
    @paypal_notifications = @search.order("created_at DESC").paginate(:page => params[:page], :per_page => 30)
  end

  def resource
    @paypal_notification = PaymentNotification.find(params[:id])
  end
end
