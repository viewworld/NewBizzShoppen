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
      @lead.update_attributes!(:email_address => "new_email_1331638434@nbs.com", :contact_name => "Tom Jones")

      @lead.newsletter_subscriber.email.should == @lead.email_address
      @lead.newsletter_subscriber.name.should == @lead.contact_name
    end

    it "should be possible to add subscribers from lead source when leads were created before source was added" do
      pending
    end
  end

  context "Campaign" do
    before(:each) do
      @campaign = Campaign.make!
      @list.newsletter_sources.create(:source_type => NewsletterSource::CAMPAIGN_SOURCE, :sourceable => @campaign)

      @contact = Contact.make!(:campaign => @campaign)
    end

    it "should create subscriber when new contact created" do
      @contact.newsletter_subscriber.should_not be_nil
      @contact.newsletter_subscriber.subscribable.should == @contact
      @contact.newsletter_subscriber.newsletter_sources.first.should == @list.newsletter_sources.first

      @contact.newsletter_subscriber.email.should == @contact.email_address
      @contact.newsletter_subscriber.name.should == @contact.contact_name
    end

    it "should update subscriber when contact was updated" do
      @contact.update_attributes!(:email_address => "new_email_1331638434@nbs.com", :contact_name => "Tom Jones")

      @contact.newsletter_subscriber.email.should == @contact.email_address
      @contact.newsletter_subscriber.name.should == @contact.contact_name
    end

    it "should be possible to add subscribers from campaign source when contacts were created before source was added" do
      pending
    end
  end

  context "User role" do
    before(:each) do
      @role = Role.find(4)
      @list.newsletter_sources.create(:source_type => NewsletterSource::USER_ROLE_SOURCE, :sourceable => @role)

      @member = User::Member.make!
    end

    it "should create subscriber when new user of certain role is created" do
      @member.newsletter_subscriber.should_not be_nil
      @member.newsletter_subscriber.subscribable.should == @member
      @member.newsletter_subscriber.newsletter_sources.first.should == @list.newsletter_sources.first

      @member.newsletter_subscriber.email.should == @member.email
      @member.newsletter_subscriber.name.should == @member.full_name
    end

    it "should update subscriber when user was updated" do
      @member.update_attributes!(:email => "new_email_1331638434@nbs.com", :first_name => "Tom")

      @member.newsletter_subscriber.email.should == @member.email
      @member.newsletter_subscriber.name.should == @member.full_name
    end

    it "should be possible to add subscribers from user role source when users were created before source was added" do
      pending
    end
  end

  context "User Subscription Type" do
    before(:each) do
      @payable_subscription = SubscriptionPlan.make!(:assigned_roles => [:supplier], :subscription_period => 12, :billing_cycle => 3, :can_be_upgraded => false)
      @payable_subscription.subscription_plan_lines.make!(:price => 25)
      @payable_subscription.subscription_plan_lines.make!(:price => 5)

      @list.newsletter_sources.create(:source_type => NewsletterSource::SUBSCRIPTION_TYPE_SOURCE, :sourceable => @payable_subscription)

      @supplier = User::Supplier.make!(:subscription_plan_id => @payable_subscription.id)
    end

    it "should create subscriber when new user of certain subscription type is created" do
      @supplier.newsletter_subscriber.should_not be_nil
      @supplier.newsletter_subscriber.subscribable.should == @supplier
      @supplier.newsletter_subscriber.newsletter_sources.first.should == @list.newsletter_sources.first

      @supplier.newsletter_subscriber.email.should == @supplier.email
      @supplier.newsletter_subscriber.name.should == @supplier.full_name
    end

    it "should update subscriber when user was updated" do
      @supplier.update_attributes!(:email => "new_email_1331638434@nbs.com", :first_name => "Tom")

      @supplier.newsletter_subscriber.email.should == @supplier.email
      @supplier.newsletter_subscriber.name.should == @supplier.full_name
    end

    it "should be possible to add subscribers from user subscription type source when users were created before source was added" do
      pending
    end
  end

  context "Custom" do
    before(:each) do
      @contact = Contact.make!
      @contact.add_to_custom_source_of_newsletter_list!(@list)
      @contact.reload
    end

    it "should create subscriber when object was added to custom source of the list" do
      @contact.newsletter_subscriber.should_not be_nil
      @contact.newsletter_subscriber.newsletter_sources.first.should be_custom_source
      @contact.newsletter_subscriber.email.should == @contact.email_address
      @contact.newsletter_subscriber.name.should == @contact.contact_name
    end

    it "should update object added to custom source of the list" do
      @contact.update_attributes!(:email_address => "new_email_1331638434@nbs.com", :contact_name => "Tom Jones")

      @contact.newsletter_subscriber.email.should == @contact.email_address
      @contact.newsletter_subscriber.name.should == @contact.contact_name
    end
  end

  context "Tags" do

  end

end