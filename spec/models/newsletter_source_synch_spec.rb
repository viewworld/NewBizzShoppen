require 'spec_helper'

describe NewsletterSourceSynch do
  fixtures :all

  before(:each) do
    Delayed::Worker.delay_jobs = true
    @lead_category = LeadCategory.make!
  end

  context "sources synchronisation" do
    before(:each) do
      @list = NewsletterList.make!
      @list.newsletter_sources.create(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)
      @list.newsletter_sources.create(:source_type => NewsletterSource::USER_ROLE_SOURCE, :sourceable => Role.find(7))
      @list.newsletter_sources.first.sourceable.should == @lead_category

      @lead1 = Lead.make!(:category => @lead_category)
      @lead2 = Lead.make!(:category => @lead_category)
      @member = User::Member.first
    end

    it "should be taking objects from view" do
      @list.newsletter_subscribers.count.should == 3
    end

    it "should copy new objects from sources to lists" do
      @list.newsletter_list_subscribers.count.should == 0
      @list.synchronize!(:campaign_monitor_synch => false, :use_delayed_job => false)
      @list.reload
      @list.newsletter_list_subscribers.count.should == 3

      @list.newsletter_list_subscribers.map(&:email_address).sort.should == @list.newsletter_subscribers.map(&:email_address).sort
    end

    it "should update objects during synchronisation" do
      @list.synchronize!(:campaign_monitor_synch => false, :use_delayed_job => false)
      @list.newsletter_list_subscribers.find_by_email_address(@member.email).company_name.should == @member.company_name
      @member.update_attribute(:company_name, "Atlas & Co")

      @list.synchronize!(:campaign_monitor_synch => false, :use_delayed_job => false)

      @list.newsletter_list_subscribers.find_by_email_address(@member.email).company_name.should == "Atlas & Co"
    end

    it "should not delete subscribers when original object is deleted" do
      @list.synchronize!(:campaign_monitor_synch => false, :use_delayed_job => false)
      @list.newsletter_list_subscribers.count.should == 3

      @lead1.destroy
      @lead2.destroy

      @list.newsletter_subscribers.count.should == 1
      @list.synchronize!(:campaign_monitor_synch => false, :use_delayed_job => false)
      @list.newsletter_list_subscribers.count.should == 3
    end

    it "should NOT update/sync sources when disabled" do
      @list.newsletter_list_subscribers.count.should == 0
      @list.update_attributes(:synch_with_sources => false)
      @list.synchronize!(:campaign_monitor_synch => false, :use_delayed_job => false)
      @list.newsletter_list_subscribers.count.should == 0
    end
  end
end