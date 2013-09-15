require 'spec_helper'

describe Campaign do
  fixtures :all

  context "duplication / clear / delete" do
    before(:each) do
      @call_centre = User::CallCentre.make!
      @call_centre_agent1 = User::CallCentreAgent.make!(:parent_id => @call_centre.id)
      @call_centre_agent2 = User::CallCentreAgent.make!(:parent_id => @call_centre.id)
      [@call_centre, @call_centre_agent1, @call_centre_agent2].each(&:confirm!)

      @campaign = Campaign.make!(:creator => @call_centre)
      @campaign.users = [@call_centre, @call_centre_agent1, @call_centre_agent2]
      @result1 = Result.make!(:final, :name => "TEST Result 01")
      @result2 = Result.make!(:final, :name => "TEST Result 02")

      @campaign.results = [@result1, @result2]

      [@result1, @result2].each do |result|
        result.campaigns_results.each { |cr| cr.update_attributes(:is_reported => true, :is_success => true) }
      end

      @contact1 = Contact.make!(:campaign => @campaign)
      @contact2 = Contact.make!(:campaign => @campaign)
      @contact3 = Contact.make!(:campaign => @campaign)
      @contact4 = Contact.make!(:campaign => @campaign)

      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact3, :result => @result1, :creator => @call_centre_agent2)
      CallResult.make!(:contact => @contact4, :result => @result2, :creator => @call_centre_agent2)

      [@call_centre_agent1, @call_centre_agent2].each do |user|
        UserSessionLog.create(:start_time => Time.parse("#{Date.today.to_s} 9:00"), :end_time => Time.parse("#{Date.today.to_s} 17:00"),
                            :user_id => user.id, :campaign_id => @campaign.id, :log_type => 1, :skip_other_logs => true)
      end
      @campaign.reload
    end

    context "duplication" do
      it "should be duplicated with contacts, call results and time by default" do
        @campaign.duplicate!

        @campaign_copy = Campaign.where("name like ?", "%Copy of #{@campaign.name}%").first
        @campaign_copy.contacts.map { |c| c.call_results }.flatten.size.should == 4
        @campaign_copy.user_session_logs.should_not be_empty
        @campaign_copy.contacts.map { |c| c.completed? }.uniq.should == [true]
        CallResult.joins(:contact).where("campaign_id = ?", @campaign_copy.id).count.should_not be_zero
      end

      it "should be duplicated without contacts, call results and time if parameter false passed" do
        @campaign.duplicate!(:with_contacts => false, :with_call_results => false, :with_agent_time => false)

        @campaign_copy = Campaign.where("name like ?", "%Copy of #{@campaign.name}%").first
        @campaign_copy.contacts.should be_empty
        @campaign_copy.user_session_logs.should be_empty
      end

      it "should be duplicated with contacts but without call results and time if parameter false passed" do
        @campaign.duplicate!(:with_contacts => true, :with_call_results => false, :with_agent_time => false)

        @campaign_copy = Campaign.where("name like ?", "%Copy of #{@campaign.name}%").first
        @campaign_copy.contacts.map { |c| c.call_results }.flatten.size.should == 0
        @campaign_copy.user_session_logs.should be_empty
        @campaign_copy.contacts.map { |c| c.completed? }.uniq.should == [false]
        CallResult.joins(:contact).where("campaign_id = ?", @campaign_copy.id).count.should be_zero
      end

      it "should notify the user when duplication task finishes" do
        @admin = User::Admin.make!

        lambda {
        @campaign.duplicate!(:user_to_notify => @admin)
      }.should change(Notification, :count).by(1)
      end
    end

    context "clear" do
      it "should be possible to clear contacts, call results and agent time" do
        @campaign.clear!

        @campaign.reload

        @campaign.contacts.count.should == 0

        CallResult.joins(:contact).where("campaign_id = ?", @campaign.id).count.should == 0

        @campaign.user_session_logs.count.should == 0
      end

      it "should be possible to clear only call results and agent time without contacts" do
        @campaign.clear!(:with_contacts => false, :with_call_results => true)

        @campaign.reload

        @campaign.contacts.count.should == 4

        @campaign.contacts.map { |c| c.completed? }.uniq.should == [false]

        CallResult.joins(:contact).where("campaign_id = ?", @campaign.id).count.should == 0

        @campaign.user_session_logs.count.should == 0
      end

      it "should be possible to clear contacts without agent time" do
        @campaign.clear!(:with_contacts => true, :with_agent_time => false)

        @campaign.reload

        @campaign.contacts.count.should == 0

        CallResult.joins(:contact).where("campaign_id = ?", @campaign.id).count.should == 0

        @campaign.user_session_logs.count.should > 0
      end

      it "should notify the user when clear task finishes" do
        @admin = User::Admin.make!

        lambda {
          @campaign.clear!(:user_to_notify => @admin)
        }.should change(Notification, :count).by(1)
      end
    end

    context "delete" do
      it "should delete campaign completely" do
        UserSessionLog.count.should > 0

        @campaign.delayed_destroy

        UserSessionLog.count.should == 0
      end

      it "should delete campaign without agent time" do
        user_session_logs_count = UserSessionLog.where("campaign_id = ?", @campaign.id).count
        user_session_logs_count.should > 0

        @campaign.delayed_destroy(false)

        UserSessionLog.where("campaign_id IS NULL and deleted_at IS NOT NULL").count.should == user_session_logs_count
      end
    end
  end

  context "remove agent from campaign" do
    before(:each) do
      @call_centre = User::CallCentre.make!
      @call_centre_agent1 = User::CallCentreAgent.make!(:parent_id => @call_centre.id)
      @call_centre_agent2 = User::CallCentreAgent.make!(:parent_id => @call_centre.id)
      [@call_centre, @call_centre_agent1, @call_centre_agent2].each(&:confirm!)

      @campaign = Campaign.make!(:creator => @call_centre)
      @campaign.users = [@call_centre, @call_centre_agent1, @call_centre_agent2]

      @final_result = Result.make!(:final, :name => "Final Result")

      @campaign.results = [@final_result]

      [@final_result].each do |result|
        result.campaigns_results.each { |cr| cr.update_attributes(:is_reported => true, :is_success => true) }
      end

      @contact1 = Contact.make!(:campaign => @campaign)
      @contact2 = Contact.make!(:campaign => @campaign)
      @contact3 = Contact.make!(:campaign => @campaign)
      @contact4 = Contact.make!(:campaign => @campaign)

      #CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1)
      #CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1)
      #CallResult.make!(:contact => @contact3, :result => @result1, :creator => @call_centre_agent2)
      #CallResult.make!(:contact => @contact4, :result => @result2, :creator => @call_centre_agent2)

      #[@call_centre_agent1, @call_centre_agent2].each do |user|
      #  (@campaign.start_date..@campaign.end_date).each do |d|
      #    UserSessionLog.create(:start_time => Time.parse("#{d.to_s} 9:00"), :end_time => Time.parse("#{d.to_s} 17:00"),
      #                          :user_id => user.id, :campaign_id => @campaign.id, :log_type => 1, :skip_other_logs => true)
      #  end
      #end
      @campaign.reload
    end

    it "should return contacts to the pool when agent is removed from campaign" do
      @contact1.assign_agent @call_centre_agent1
      @contact1.agent_id.should == @call_centre_agent1.id
      @campaign.assign [@call_centre_agent2.id]

      @contact1.reload
      @contact1.agent_id.should be_nil
    end

    it "should reassign contacts with call back results to other agents" do
      @contact1.assign_agent @call_centre_agent1
      CallResult.make!(:call_back, :contact => @contact1, :creator => @call_centre_agent1)
      @campaign.assign [@call_centre_agent2.id]

      @contact1.reload
      @contact1.agent_id.should == @call_centre_agent2.id
    end

    # notifications for agents had been temporarily disabled (call_result.rb -> process_for_call_back)
    it "should remove notifications when contact is reassigned" do
      @contact1.assign_agent @call_centre_agent1
      CallResult.make!(:call_back, :contact => @contact1, :creator => @call_centre_agent1)
      @call_centre_agent1.notifications.count.should == 0
      @call_centre_agent2.notifications.count.should == 0

      @campaign.assign [@call_centre_agent2.id]
      @contact1.reload
      @call_centre_agent1.notifications.count.should == 0
      @call_centre_agent2.notifications.count.should == 0
    end

  end
end
