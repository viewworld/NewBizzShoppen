class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]
  before_filter :authorize_with_http_basic_for_staging, :except => [:create]

  def create
    params[:invoice].match(/^v_/) ? VoucherPaymentNotification.process(params) : CartPaymentNotification.process(params)
    render :nothing => true
  end

end