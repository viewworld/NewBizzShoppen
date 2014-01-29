require 'spec_helper'

describe SubscriptionPlanLine do
  fixtures :all

  def set_date_today_to(date)
    Date.stubs(:today).returns(date)
  end

  context "validations" do
  end

end