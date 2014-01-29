require 'spec_helper'

describe ChainMailsController do
  include RSpec::Rails::ControllerExampleGroup
  include Devise::TestHelpers
  fixtures :all

  before(:each) do
    @chain_mail = ChainMail.make!
  end

  context "create" do
    it "should register click and redirect" do
      @chain_mail.last_link_clicked_at.should be_nil
      get :show, :id => @chain_mail.id, :redirect => "http://some.fake.url"
      @chain_mail.reload
      @chain_mail.last_link_clicked_at.to_date.should == Date.today
      response.header["Location"].should == "http://some.fake.url"
    end
  end
end