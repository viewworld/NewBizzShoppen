require 'spec_helper'

describe Campaign do
  fixtures :all

  context "duplication" do
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
        (@campaign.start_date..@campaign.end_date).each do |d|
          UserSessionLog.create(:start_time => Time.parse("#{d.to_s} 9:00"), :end_time => Time.parse("#{d.to_s} 17:00"),
                              :user_id => user.id, :campaign_id => @campaign.id, :log_type => 1, :skip_other_logs => true)
        end
      end
      @campaign.reload
    end

    it "should be duplicated with call results and time by default" do
      @campaign.duplicate!

      @campaign_copy = Campaign.where("name like ?", "%Copy of #{@campaign.name}%").first
      @campaign_copy.contacts.map { |c| c.call_results }.flatten.size.should == 4
      @campaign_copy.user_session_logs.should_not be_empty
      @campaign_copy.contacts.map { |c| c.completed? }.uniq.should == [true]
    end

    it "should be duplicated without call results and time if parameter false passed" do
      @campaign.duplicate!(false)

      @campaign_copy = Campaign.where("name like ?", "%Copy of #{@campaign.name}%").first
      @campaign_copy.contacts.map { |c| c.call_results }.flatten.size.should == 0
      @campaign_copy.user_session_logs.should be_empty
      @campaign_copy.contacts.map { |c| c.completed? }.uniq.should == [false]
    end

    it "should notify the user when task finishes" do
      @admin = User::Admin.make!

      lambda {
      @campaign.duplicate!(true, @admin)
    }.should change(Notification, :count).by(1)
    end
  end
end
