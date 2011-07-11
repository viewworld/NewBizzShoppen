require 'spec_helper'

describe AgentInformation do
  fixtures :all

  before(:each) do
    # create users
    @call_centre = User::CallCentre.make!
    @call_centre_agent1 = User::CallCentreAgent.make!
    @call_centre_agent2 = User::CallCentreAgent.make!
    @call_centre.children << @call_centre_agent

    # create campaign
    @currency = Currency.make!
    @campaign = Campaign.make!(:creator => @call_centre, :currency => @currency)

    # assign users to campaign
    @campaign.users << @call_centre
    @campaign.users << @call_centre_agent1
    @campaign.users << @call_centre_agent2

    # create results
    @result1 = Result.make!(:final_reported_success)
    @result2 = Result.make!(:final_reported_success)
    @result3 = Result.make!(:upgrades_to_lead)
    @result4= Result.make!(:upgrades_to_lead)

    # assign results to campaign
    @campaign.results = [@result1,@result2,@result3,@result4]
    @result1.campaigns_results.first.update_attribute(:value, 100)
    @result2.campaigns_results.first.update_attribute(:value, 10)

    # create contacts
    @contact1 = Contact.make!(:campaign => @campaign)
    @contact2 = Contact.make!(:campaign => @campaign)
    @contact3 = Contact.make!(:campaign => @campaign, :price => 130)
    @contact4 = Contact.make!(:campaign => @campaign, :price => 13)
  end

  context "Initialization" do
#    it "should initialize properly with hand given dates" do
#      ai = AgentInformation.new(Date.today+5.days,Date.today+50.days,@call_centre_agent1)
#      ai.user.should == @call_centre_agent1 and ai.date_from.should == Date.today+5.days and ai.date_to.should == Date.today+50.days
#    end
#
#    it "should initialize properly for today" do
#      ai = AgentInformation.today(@call_centre_agent1)
#      ai.user.should == @call_centre_agent1 and ai.date_from.should == Date.today and ai.date_to.should == Date.today
#    end
#
#    it "should initialize properly for week" do
#      ai = AgentInformation.week(@call_centre_agent1)
#      ai.user.should == @call_centre_agent1 and ai.date_from.should == Time.now.beginning_of_week.to_date and ai.date_to.should == Time.now.end_of_week.to_date
#    end
#
#    it "should initialize properly for quarter" do
#      ai = AgentInformation.quarter(@call_centre_agent1)
#      ai.user.should == @call_centre_agent1 and ai.date_from.should == Time.now.beginning_of_quarter.to_date and ai.date_to.should == Time.now.end_of_quarter.to_date
#    end
#
#    it "should initialize properly for year" do
#      ai = AgentInformation.year(@call_centre_agent1)
#      ai.user.should == @call_centre_agent1 and ai.date_from.should == Time.now.beginning_of_year.to_date and ai.date_to.should == Time.now.end_of_year.to_date
#    end
  end

  context "Created value for results not upgraded to lead" do
#    it "should return correct value for today when there are no upgraded to lead results" do
#      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1) # 100
#      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1) # 10
#      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent2)
#      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now-1.day)
#      AgentInformation.today(@call_centre_agent1).value_created.should == 110.0
#    end
#
#    it "should return correct value for week when there are no upgraded to lead results" do
#      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.utc.beginning_of_week) # 100
#      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now.utc.end_of_week) # 10
#      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent2)
#      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now-2.weeks)
#      AgentInformation.week(@call_centre_agent1).value_created.should == 110.0
#    end
#
#    it "should return correct value for quarter when there are no upgraded to lead results" do
#      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.utc.beginning_of_quarter) # 100
#      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now.utc.end_of_quarter) # 10
#      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent2)
#      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now-4.months)
#      AgentInformation.quarter(@call_centre_agent1).value_created.should == 110.0
#    end
#
#    it "should return correct value for year when there are no upgraded to lead results" do
#      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.utc.beginning_of_year) # 100
#      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now.utc.end_of_year) # 10
#      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent2)
#      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now-2.years)
#      AgentInformation.year(@call_centre_agent1).value_created.should == 110.0
#    end
  end

  context "Created value for results upgraded to lead" do
    it "should return correct value for today when there are upgraded to lead results" do
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1) # 130
      CallResult.make!(:contact => @contact4, :result => @result4, :creator => @call_centre_agent1) # 13
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent2)
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now-1.day)
      AgentInformation.today(@call_centre_agent1).value_created.should == 143.0
    end

    it "should return correct value for week when there are upgraded to lead results" do
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.utc.beginning_of_week) # 130
      CallResult.make!(:contact => @contact4, :result => @result4, :creator => @call_centre_agent1, :created_at => Time.now.utc.end_of_week) # 13
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent2)
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now-2.week)
      AgentInformation.week(@call_centre_agent1).value_created.should == 143.0
    end

#    it "should return correct value for quarter when there are no upgraded to lead results" do
#      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.utc.beginning_of_quarter) # 130
#      CallResult.make!(:contact => @contact4, :result => @result4, :creator => @call_centre_agent1, :created_at => Time.now.utc.end_of_quarter) # 13
#      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent2)
#      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now-4.months)
#      AgentInformation.quarter(@call_centre_agent1).value_created.should == 143.0
#    end
#
#    it "should return correct value for year when there are no upgraded to lead results" do
#      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.utc.beginning_of_year) # 130
#      CallResult.make!(:contact => @contact4, :result => @result4, :creator => @call_centre_agent1, :created_at => Time.now.utc.end_of_year) # 13
#      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent2)
#      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now-2.years)
#      AgentInformation.year(@call_centre_agent1).value_created.should == 143.0
#    end
  end

end