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
    CreateSend::Client.expects(:create).returns("ClientId10123123").at_least_once
    CreateSend::Client.any_instance.stubs(:details).returns(false).then.returns(Hashie::Mash.new(:BasicDetails => {:ClientID => "ClientId10123123"}))
    CreateSend::List.stubs(:create).once().returns("List1023456")
    CreateSend::List.any_instance.stubs(:create_custom_field).returns(true)
    CreateSend::List.any_instance.stubs(:details).returns(false).then.returns(Hashie::Mash.new(:ListID => "List1023456"))
    @list = NewsletterList.make!
    @list.cm_list_id.should == "List1023456"
  end

  it "should synchronize list after update" do
    CreateSend::List.stubs(:create).once().returns("List1023456")
    CreateSend::List.any_instance.stubs(:create_custom_field).returns(true)
    CreateSend::List.any_instance.stubs(:update).once().with("new_name", "", false, "")
    CreateSend::List.any_instance.stubs(:details).twice().returns(false).then.returns(Hashie::Mash.new(:ListID => "List1023456"))
    @list = NewsletterList.make!
    @list.update_attribute(:name, "new_name")
  end

  it "should create campaign monitor client when creating list for the first time" do
    CreateSend::Client.stubs(:create).twice().returns("CallCentre").then.returns("Admin")
    CreateSend::Client.any_instance.stubs(:details).returns(false).then.returns(Hashie::Mash.new(:BasicDetails => {:ClientID => "CallCentre"})).then.returns(Hashie::Mash.new(:BasicDetails => {:ClientID => "CallCentre"}))
    @client = User::CallCentre.make!
    @creator = User::Admin.make!

    CreateSend::List.any_instance.stubs(:details).once().returns(false)
    @list = NewsletterList.make!(:owner => @client, :creator => @creator)
    @list.owner.cm_client_id.should == "CallCentre"
  end

  it "should export all subscribers from sources when new list is created" do
    CreateSend::Client.expects(:create).returns("ClientId10123123").at_least_once
    CreateSend::Client.any_instance.stubs(:details).returns(false).then.returns(Hashie::Mash.new(:BasicDetails => {:ClientID => "ClientId10123123"}))
    CreateSend::List.any_instance.stubs(:details).returns(false)
    CreateSend::List.stubs(:create).returns("List1023456")
    CreateSend::List.any_instance.stubs(:create_custom_field).returns(true)
    CreateSend::List.any_instance.stubs(:details).returns(false).then.returns(Hashie::Mash.new(:ListID => "List1023456"))
    @lead = Lead.make!(:category => @lead_category)
    CreateSend::List.any_instance.stubs(:active).returns(Hashie::Mash.new(:RecordsOnThisPage => 0, :Results => []))
    CreateSend::Subscriber.stubs(:import).once()
    @list = NewsletterList.make
    @list.newsletter_sources.build(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)
    @list.save
    Delayed::Worker.new.work_off
  end

  it "when owner is changed then list is deleted and created again" do
    CreateSend::Client.expects(:create).returns("ClientId10123123").at_least_once
    CreateSend::Client.any_instance.stubs(:details).returns(false).then.returns(Hashie::Mash.new(:BasicDetails => {:ClientID => "ClientId10123123"})).returns(false).then.returns(Hashie::Mash.new(:BasicDetails => {:ClientID => "ClientId993939393993"}))
    CreateSend::List.stubs(:create).twice().returns("List1023456")
    CreateSend::List.any_instance.stubs(:create_custom_field).returns(true)
    CreateSend::List.any_instance.stubs(:delete).once.returns(true)
    CreateSend::List.any_instance.stubs(:details).returns(false).then.returns(Hashie::Mash.new(:ListID => "List1023456"))
    @list = NewsletterList.make!
    @list.cm_list_id.should == "List1023456"

    @list.owner = User::Admin.make!

    @list.save
  end
end
