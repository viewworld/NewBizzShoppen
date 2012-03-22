require 'spec_helper'

describe NewsletterList do
  fixtures :all

  before(:each) do
    CreateSend::Client.expects(:create).returns("ClientId10123123")
    @lead_category = LeadCategory.make!
    CreateSend::List.expects(:create).returns("List1023456")
    @list = NewsletterList.make!
  end

  it "should be possible to add a source" do
    @list.newsletter_sources.create(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)
    @list.newsletter_sources.first.sourceable.should == @lead_category
  end

  it "should create in campaign monitor new lists" do
    @list.cm_list_id.should == "List1023456"
  end

  it "should synchronize list after update" do
    CreateSend::List.any_instance.expects(:update).with("new_name", "", false, "")
    @list.update_attribute(:name, "new_name")
  end

  it "should create campaign monitor client when creating list for the first time" do
    @list.owner.cm_client_id.should == "ClientId10123123"
  end

end
