class Administration::PaypalNotificationsController < Administration::AdministrationController

  inherit_resources


  def collection
    @search = PaymentNotification.scoped_search(params[:search])
    @paypal_notifications = @search.order("created_at DESC").paginate(:show_all => params[:show_all], :page => params[:page], :per_page => 30)
  end

  def show
    @paypal_notification = PaymentNotification.find(params[:id])
    @responses = ArchivedPaypalResponse.scoped_search(:with_txn_id => @paypal_notification.transaction_id).order("created_at DESC").paginate(:show_all => params[:show_all], :page => params[:page], :per_page => 30)
  end
end
