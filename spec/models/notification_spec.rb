require 'spec_helper'

describe Notification do
  fixtures :all

  context "contact" do
    before(:each) do
    end

    it "should dismiss all remaining notifications when contact is finalized" do
      @creator = User::Agent.make!
      @contact = Contact.make!
      CallResult.make!(:call_back, :contact => @contact, :creator => @creator)
      @creator.notifications.pending.size.should == 1
      @contact.notifications.pending.size.should == 1

      CallResult.make!(:upgraded_to_member, :contact => @contact, :creator => @creator)
      @contact.reload
      @creator.notifications.pending.size.should == 0
      @contact.notifications.pending.size.should == 0
    end
  end
end