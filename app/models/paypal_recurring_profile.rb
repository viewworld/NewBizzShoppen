class PaypalRecurringProfile

  attr_accessor :result

  def initialize(profile_id)
    @nvp = PaypalNVP.new(!Rails.env.production?, { :user => APP_CONFIG[:paypal_api_email],
                                                   :pass => APP_CONFIG[:paypal_api_password],
                                                   :cert => APP_CONFIG[:paypal_api_key],
                                                   :url => APP_CONFIG[:paypal_api_url] })
    @profile_id = profile_id
  end

  def update_profile(options)
    data = {
    :method => "UpdateRecurringPaymentsProfile",
    :profileid => @profile_id,
    }.merge(options)

    call_paypal(data, "update_profile")
  end

  def cancel_profile
    data = {
    :method => "ManageRecurringPaymentsProfileStatus",
    :profileid => @profile_id,
    :action => "Cancel"
    }

    call_paypal(data, "cancel_profile")
  end

  private

  def call_paypal(data, call_type)
    @result = @nvp.call_paypal(data)
    unless @result["ACK"] == "Success"
      EmailNotification.notify("Paypal recurring profile: #{call_type} failed",
                               "<p>Profile ID: #{@profile_id}</p><br />Backtrace:<p>#{@result.to_yaml.gsub("\n", "<br />")}</p>")
      return false
    end
    true
  end
end