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

  it "export all subscribers from sources when new list is created" do
    CreateSend::List.expects(:create).returns("List1023456")
    @lead = Lead.make!(:category => @lead_category)
    @list = NewsletterList.make
    @list.newsletter_sources.build(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)
    @list.save
    CreateSend::Subscriber.expects(:add).with("List1023456", @lead.email_address, @lead.contact_name, [], true)
    Delayed::Worker.new.work_off
  end

end
