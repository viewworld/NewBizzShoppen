class ActiveMerchantPaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create, :show]
  before_filter :authorize_with_http_basic_for_staging, :except => [:create, :show]


  def create
    if respond_to?(params[:txn_type], true)
      send params[:txn_type]
    else
      upn = ActiveMerchantUnknownPaymentNotification.create(:params => params, :buyer_id => params[:invoice].to_i, :status => params[:payment_status], :transaction_id => params[:txn_id])
      EmailNotification.notify("Unhandled txn_type: #{params[:txn_type]}", "<p>ActiveMerchantUnknownPaymentNotification: #{upn.id}</p> <>br /> Backtrace: <p>#{upn.params.inspect}</p>")
    end
    render :nothing => true
  end

  def show
    create
  end

  private

  def cart
    case params[:invoice]
      when /^v_/
        ActiveMerchantVoucherPaymentNotification.process(params)
      when /^i_/
        ActiveMerchantInvoicePaymentNotification.process(params)
      else
        ActiveMerchantCartPaymentNotification.process(params)
    end
  end
end