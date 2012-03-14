require 'spec_helper'

describe NewsletterSubscriber do
  fixtures :all

  before(:each) do
    @list = NewsletterList.make!
  end

  context "Lead" do
    before(:each) do
      @lead_category = LeadCategory.make!
      @list.newsletter_sources.create(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)

      @lead = Lead.make!(:category => @lead_category)
    end

    it "should create subscriber when new lead created" do
      @lead.newsletter_subscriber.should_not be_nil
      @lead.newsletter_subscriber.subscribable.should == @lead
      @lead.newsletter_subscriber.newsletter_sources.first.should == @list.newsletter_sources.first

      @lead.newsletter_subscriber.email.should == @lead.email_address
      @lead.newsletter_subscriber.name.should == @lead.contact_name
    end

    it "should update subscriber when lead was updated" do
      @lead.update_attributes(:email_address => "new_email_1331638434@nbs.com", :contact_name => "Tom Jones")

      @lead.newsletter_subscriber.email.should == @lead.email_address
      @lead.newsletter_subscriber.name.should == @lead.contact_name
    end

    it "should be possible to add subscribers from lead source when leads were created before source was added" do
      pending
    end
  end

  context "Campaign" do

  end

  context "User role" do
    before(:each) do
      @role = Role.find(4)
      @list.newsletter_sources.create(:source_type => NewsletterSource::USER_ROLE_SOURCE, :sourceable => @role)

      @member = User::Member.make!
    end

    it "should create subscriber when new user of certain role is created" do
      puts @list.newsletter_sources.inspect
    end

  end

  context "User Subscription Type" do

  end

  context "Custom" do
    before(:each) do
      @contact = Contact.make!
    end

    it "should be possible to add selected subscribers to the list" do
      @contact.add_to_custom_source_of_newsletter_list!(@list)
      @contact.reload
      @contact.newsletter_subscriber.should_not be_nil
      @contact.newsletter_subscriber.newsletter_sources.first.should be_custom_source
      @contact.newsletter_subscriber.email.should == @contact.email_address
      @contact.newsletter_subscriber.name.should == @contact.contact_name
    end
  end
end