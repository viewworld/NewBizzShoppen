require 'spec_helper'

describe NewsletterCampaign do
  fixtures :all

  before(:each) do
    CreateSend::Client.expects(:create).returns("ClientId10123123").at_least_once
    @user = User::Admin.make!

    CreateSend::List.stubs(:create).once().returns("List1023456")
    CreateSend::List.any_instance.stubs(:details).returns(false).then.returns(Hashie::Mash.new(:ListID => "List1023456"))
    NewsletterSynch.any_instance.expects(:all_cm_subscribers).returns([])
    @list = NewsletterList.make!(:owner_email => @user.email)

    @campaign = NewsletterCampaign.make!(:owner => @user)
    @campaign.newsletter_lists << @list
    @campaign.save
  end

  it "should initially be a draft" do
    @campaign.status.should == NewsletterCampaign::SAVED_AS_DRAFT
  end

  it "should have template key generated" do
    @campaign.template_key.should_not be_nil
  end

  it "should generate correct link to template for html and text" do
    @campaign.link_to_template.should == "http://fairleads.com/newsletters/newsletter_campaigns/#{@campaign.template_key}"
    @campaign.link_to_template(true).should == "http://fairleads.com/newsletters/newsletter_campaigns/#{@campaign.template_key}?txt=1"
  end

  it "should synchronise to CM" do
    CreateSend::Campaign.expects(:create).with(@user.cm_client_id, instance_of(String), instance_of(String), "Fairleads.com", "admin@fairleads.com",
                                                "admin@fairleads.com", instance_of(String), instance_of(String), [@list.cm_list_id], []).returns("CampaignId948484848")

    CreateSend::Campaign.any_instance.expects(:summary).returns(nil)
    CreateSend::Campaign.any_instance.expects(:send).with(Settings.cm_confirmation_email)

    @campaign.send(:cm_synchronize!)

    @campaign.cm_campaign_id.should == "CampaignId948484848"
    @campaign.should be_sent
  end
end