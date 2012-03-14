require 'spec_helper'

describe NewsletterList do
  fixtures :all

  before(:each) do
    @lead_category = LeadCategory.make!
    @list = NewsletterList.make!

  end

  it "should be possible to add a source" do
    @list.newsletter_sources.create(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)
    @list.newsletter_sources.first.sourceable.should == @lead_category
  end
end
