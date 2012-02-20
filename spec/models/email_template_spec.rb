require 'spec_helper'

describe EmailTemplate do

  it "should return correct set of variables for given template with class defined" do
    @template = EmailTemplate.find_by_uniq_id("deal_request_details")
    variables = @template.available_variables
    expected_variables = (Deal::LIQUID_METHODS.call(self).keys - ["show_lead_details_url"]).map { |v| "{{deal.#{v}}}" }

    expected_variables.each do |expected_variable|
      variables.should include(expected_variable)
    end
  end

  it "should return correct set of variables for given template with custom fields defined" do
     @template = EmailTemplate.find_by_uniq_id("category_request")
    variables = @template.available_variables
    expected_variables = ["request_type", "category_name", "lead_description", "leads_count_per_month", "can_be_contacted"].map { |v| "{{#{v}}}" }

    expected_variables.each do |expected_variable|
      variables.should include(expected_variable)
    end
  end

  it "should be possible to replace links for fairdeals with auto logins" do
    @member = User::Member.make!
    @member.generate_login_key!

    body = %{<a href="http://www.fairdeals.dk/deals/7484-business-coaching">Business Coaching</a>}
    result = StringUtils.replace_fairdeals_urls_for_auto_login_urls(@member, body)
    result.should == %{<a href="http://www.fairdeals.dk/login_keys/?key=#{@member.login_key}&redirect=http%3A%2F%2Fwww.fairdeals.dk%2Fdeals%2F7484-business-coaching">Business Coaching</a>}

    body = %{http://www.fairdeals.dk/login_keys/?key=#{@member.login_key}}
    result = StringUtils.replace_fairdeals_urls_for_auto_login_urls(@member, body)
    result.should == body

    body = %{http://www.otherpage.com/}
    result = StringUtils.replace_fairdeals_urls_for_auto_login_urls(@member, body)
    result.should == body
  end
end