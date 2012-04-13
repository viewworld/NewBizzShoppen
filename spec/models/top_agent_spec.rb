require 'spec_helper'

describe TopAgent do
  fixtures :all

  before(:each) do
    # create users
    @call_centre = User::CallCentre.make!
    @call_centre_agent1 = User::CallCentreAgent.make!(:first_name => "Tom", :company_name => 'CCA1')
    @call_centre_agent2 = User::CallCentreAgent.make!(:first_name => "Anna", :company_name => 'CCA2')
    @call_centre.children << @call_centre_agent

    # create campaign
    @currency = Currency.make!
    @campaign = Campaign.make!(:creator => @call_centre, :currency => @currency)

    # assign users to campaign
    @campaign.users << @call_centre
    @campaign.users << @call_centre_agent1
    @campaign.users << @call_centre_agent2

    # create results
    @result1 = Result.make!(:final)
    @result2 = Result.make!(:final)
    @result3 = Result.make!(:upgrades_to_lead)
    @result4 = Result.make!(:upgrades_to_lead)

    # assign results to campaign
    @campaign.results = [@result1,@result2,@result3,@result4]
    @result1.campaigns_results.first.update_attribute(:value, 100)
    @result2.campaigns_results.first.update_attribute(:value, 10)

    #mark as reported & success
    [@result1, @result2, @result3, @result4].each do |result|
      result.campaigns_results.each { |cr| cr.update_attributes(:is_reported => true, :is_success => true) }
    end

    # create contacts
    @contact1 = Contact.make!(:campaign => @campaign)
    @contact2 = Contact.make!(:campaign => @campaign)
    @contact3 = Contact.make!(:campaign => @campaign, :price => 130)
    @contact4 = Contact.make!(:campaign => @campaign, :price => 13)
  end

  context "Initialization" do
    it "should initialize properly with hand given dates" do
      ta = TopAgent.new(Date.today+5.days,Date.today+50.days)
      ta.date_from.should == Date.today+5.days and ta.date_to.should == Date.today+50.days
    end

    it "should initialize properly for today" do
      ta = TopAgent.today
      ta.date_from.should == Date.today and ta.date_to.should == Date.today
    end

    it "should initialize properly for week" do
      ta = TopAgent.week
      ta.date_from.should == Time.now.beginning_of_week.to_date and ta.date_to.should == Time.now.end_of_week.to_date
    end

    it "should initialize properly for quarter" do
      ta = TopAgent.quarter
      ta.date_from.should == Time.now.beginning_of_quarter.to_date and ta.date_to.should == Time.now.end_of_quarter.to_date
    end

    it "should initialize properly for year" do
      ta = TopAgent.year
      ta.date_from.should == Time.now.beginning_of_year.to_date and ta.date_to.should == Time.now.end_of_year.to_date
    end
  end

  context "Top agent for results not upgraded to lead" do
    it "should return correct value for today when there are no upgraded to lead results" do
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1) # 100
      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1) # 10
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent2)
      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now-1.day)
      ta = TopAgent.today
      ta.value_created.should == 110.0 and ta.user.screen_name.should == "Tom, CCA1"
    end

    it "should return correct value for week when there are no upgraded to lead results" do
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset) # 100
      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now.end_of_week+Time.now.end_of_week.utc_offset) # 10
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent2)
      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now-2.weeks)
      ta = TopAgent.week
      ta.value_created.should == 110.0 and ta.user.screen_name.should == "Tom, CCA1"
    end

    it "should return correct value for quarter when there are no upgraded to lead results" do
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_quarter+Time.now.beginning_of_quarter.utc_offset) # 100
      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now.end_of_quarter+Time.now.end_of_quarter.utc_offset) # 10
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent2)
      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now-4.months)
      ta = TopAgent.quarter
      ta.value_created.should == 110.0 and ta.user.screen_name.should == "Tom, CCA1"
    end

    it "should return correct value for year when there are no upgraded to lead results" do
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_year+Time.now.beginning_of_year.utc_offset) # 100
      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now.end_of_year+Time.now.end_of_year.utc_offset) # 10
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent2)
      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now-2.years)
      ta = TopAgent.year
      ta.value_created.should == 110.0 and ta.user.screen_name.should == "Tom, CCA1"
    end
  end

  context "Top agent for results upgraded to lead" do
    it "should return correct value for today when there are upgraded to lead results" do
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1) # 130
      CallResult.make!(:contact => @contact4, :result => @result4, :creator => @call_centre_agent1) # 13
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent2)
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now-1.day)
      ta = TopAgent.today
      ta.value_created.should == 143.0 and ta.user.screen_name.should == "Tom, CCA1"
    end

    it "should return correct value for week when there are upgraded to lead results" do
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset) # 130
      CallResult.make!(:contact => @contact4, :result => @result4, :creator => @call_centre_agent1, :created_at => Time.now.end_of_week+Time.now.end_of_week.utc_offset) # 13
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent2)
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now-2.week)
      ta = TopAgent.week
      ta.value_created.should == 143.0 and ta.user.screen_name.should == "Tom, CCA1"
    end

    it "should return correct value for quarter when there are upgraded to lead results" do
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_quarter+Time.now.beginning_of_quarter.utc_offset) # 130
      CallResult.make!(:contact => @contact4, :result => @result4, :creator => @call_centre_agent1, :created_at => Time.now.end_of_quarter+Time.now.end_of_quarter.utc_offset) # 13
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent2)
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now-4.months)
      ta = TopAgent.quarter
      ta.value_created.should == 143.0 and ta.user.screen_name.should == "Tom, CCA1"
    end

    it "should return correct value for year when there are upgraded to lead results" do
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_year+Time.now.beginning_of_year.utc_offset) # 130
      CallResult.make!(:contact => @contact4, :result => @result4, :creator => @call_centre_agent1, :created_at => Time.now.end_of_year+Time.now.end_of_year.utc_offset) # 13
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent2)
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now-2.years)
      ta = TopAgent.year
      ta.value_created.should == 143.0 and ta.user.screen_name.should == "Tom, CCA1"
    end
  end

  context "Top agent for both not upgraded and upgraded to lead" do
    it "should return correct value for today when there are both upgraded and not upgraded to lead results" do
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1) # 100
      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1) # 10
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent2)
      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now-1.day)
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1) # 130
      CallResult.make!(:contact => @contact4, :result => @result4, :creator => @call_centre_agent1) # 13
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent2)
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now-1.day)
      ta = TopAgent.today
      ta.value_created.should == 253.0 and ta.user.screen_name.should == "Tom, CCA1"
    end

    it "should return correct value for week when there are both upgraded and not upgraded to lead results" do
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset) # 100
      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now.end_of_week+Time.now.end_of_week.utc_offset) # 10
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent2)
      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now-2.weeks)
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset) # 130
      CallResult.make!(:contact => @contact4, :result => @result4, :creator => @call_centre_agent1, :created_at => Time.now.end_of_week+Time.now.end_of_week.utc_offset) # 13
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent2)
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now-2.week)
      ta = TopAgent.week
      ta.value_created.should == 253.0 and ta.user.screen_name.should == "Tom, CCA1"
    end

    it "should return correct value for quarter when there are both upgraded and not upgraded to lead results" do
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_quarter+Time.now.beginning_of_quarter.utc_offset) # 100
      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now.end_of_quarter+Time.now.end_of_quarter.utc_offset) # 10
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent2)
      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now-4.months)
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_quarter+Time.now.beginning_of_quarter.utc_offset) # 130
      CallResult.make!(:contact => @contact4, :result => @result4, :creator => @call_centre_agent1, :created_at => Time.now.end_of_quarter+Time.now.end_of_quarter.utc_offset) # 13
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent2)
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now-4.months)
      ta = TopAgent.quarter
      ta.value_created.should == 253.0 and ta.user.screen_name.should == "Tom, CCA1"
    end

    it "should return correct value for year when there are both upgraded and not upgraded to lead results" do
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_year+Time.now.beginning_of_year.utc_offset) # 100
      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now.end_of_year+Time.now.end_of_year.utc_offset) # 10
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent2)
      CallResult.make!(:contact => @contact2, :result => @result2, :creator => @call_centre_agent1, :created_at => Time.now-2.years)
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_year+Time.now.beginning_of_year.utc_offset) # 130
      CallResult.make!(:contact => @contact4, :result => @result4, :creator => @call_centre_agent1, :created_at => Time.now.end_of_year+Time.now.end_of_year.utc_offset) # 13
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent2)
      CallResult.make!(:contact => @contact3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now-2.years)
      ta = TopAgent.year
      ta.value_created.should == 253.0 and ta.user.screen_name.should == "Tom, CCA1"
    end
  end

end