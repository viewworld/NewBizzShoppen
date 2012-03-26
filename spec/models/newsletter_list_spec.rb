require 'spec_helper'

describe NewsletterList do
  fixtures :all

  before(:each) do
    Delayed::Worker.delay_jobs = true
    @lead_category = LeadCategory.make!
  end

  it "should be possible to add a source" do
    @list = NewsletterList.make!
    @list.newsletter_sources.create(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)
    @list.newsletter_sources.first.sourceable.should == @lead_category
  end

  it "should create in campaign monitor new lists" do
    CreateSend::List.expects(:create).returns("List1023456")
    @list = NewsletterList.make!
    @list.cm_list_id.should == "List1023456"
  end

  it "should synchronize list after update" do
    CreateSend::List.expects(:create).returns("List1023456")
    CreateSend::List.any_instance.expects(:update).with("new_name", "", false, "")
    @list = NewsletterList.make!
    @list.update_attribute(:name, "new_name")
  end

  it "should create campaign monitor client when creating list for the first time" do
    CreateSend::Client.expects(:create).twice().returns("ClientId10123123")
    @list = NewsletterList.make!
    @list.owner.cm_client_id.should == "ClientId10123123"
  end

  it "should export all subscribers from sources when new list is created" do
    CreateSend::List.expects(:create).returns("List1023456")
    @lead = Lead.make!(:category => @lead_category)
    @list = NewsletterList.make
    @list.newsletter_sources.build(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)
    @list.save
    CreateSend::Subscriber.expects(:add).with("List1023456", @lead.email_address, @lead.contact_name, [], true)
    Delayed::Worker.new.work_off
  end

  it "should export all new subscribers in sources" do
    CreateSend::List.expects(:create).times(3).returns("List#{rand(999)}")

    @list_lead_category = NewsletterList.make!
    @list_lead_category.newsletter_sources.create(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)

    @campaign = Campaign.make!
    @list_campaign = NewsletterList.make!
    @list_campaign.newsletter_sources.create(:source_type => NewsletterSource::CAMPAIGN_SOURCE, :sourceable => @campaign)

    @role = Role.find(4)
    @list_role = NewsletterList.make!
    @list_role.newsletter_sources.create(:source_type => NewsletterSource::USER_ROLE_SOURCE, :sourceable => @role)

    @lead = Lead.make!(:category => @lead_category)
    CreateSend::Subscriber.expects(:add).with(@list_lead_category.cm_list_id, @lead.email_address, @lead.contact_name, [], true)

    @contact = Contact.make!(:campaign => @campaign)
    CreateSend::Subscriber.expects(:add).with(@list_campaign.cm_list_id, @contact.email_address, @contact.contact_name, [], true)

    @member = User::Member.make!
    CreateSend::Subscriber.expects(:add).with(@list_role.cm_list_id, @member.email, @member.full_name, [], true)

    Delayed::Worker.new.work_off
  end

  it "should remove subscriber from campaign monitor when object is deleted from sources" do
    CreateSend::List.expects(:create).once().returns("List123")
    @list_lead_category = NewsletterList.make!
    @list_lead_category.newsletter_sources.create(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)
    @lead = Lead.make!(:category => @lead_category)
    CreateSend::Subscriber.expects(:add).with(@list_lead_category.cm_list_id, @lead.email_address, @lead.contact_name, [], true)
    Delayed::Worker.new.work_off

  end

end
