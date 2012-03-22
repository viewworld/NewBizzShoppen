require 'spec_helper'

describe NewsletterSource do
  fixtures :all

  before(:each) do
    @lead_category = LeadCategory.make!
    @list = NewsletterList.make!
  end

  it "should be possible to add a source" do
  end
end
