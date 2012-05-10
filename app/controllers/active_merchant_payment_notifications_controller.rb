class ActiveMerchantPaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create, :show]
  before_filter :authorize_with_http_basic_for_staging, :except => [:create, :show]


  def create
    if respond_to?(params[:msgtype], true)
      send params[:msgtype]
    else
      upn = ActiveMerchantUnknownPaymentNotification.create(:params => params, :buyer_id => params[:ordernumber].to_i, :status => QuickpayPayment::TRANSACTION_STATUSES[params[:qpstat]], :transaction_id => params[:transaction])
      EmailNotification.notify("Unhandled txn_type: #{params[:msgtype]}", "<p>ActiveMerchantUnknownPaymentNotification: #{upn.id}</p> <>br /> Backtrace: <p>#{upn.params.inspect}</p>")
    end
    render :nothing => true
  end

  def show
    create
  end

  private

  def capture
    case params[:ordernumber]
      when /^v_/
        ActiveMerchantVoucherPaymentNotification.process(params)
      when /^i_/
        ActiveMerchantInvoicePaymentNotification.process(params)
      else
        ActiveMerchantCartPaymentNotification.process(params)
    end
  end

  def subscribe
    ActiveMerchantSubscriptionPaymentNotification.process(params)
  end
end