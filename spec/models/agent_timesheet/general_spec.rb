require 'spec_helper'

describe AgentTimesheet::General do
  fixtures :all

  def time_log(agent,campaign,start,duration)
    start_time = Time.parse(start)
    UserSessionLog.make!(:user => agent, :campaign => campaign,
                         :start_time => start_time,
                         :end_time => start_time+duration.minutes)
  end

  before(:each) do
    # create users
    @call_centre = User::CallCentre.make!
    @call_centre_agent1 = User::CallCentreAgent.make!
    @call_centre_agent2 = User::CallCentreAgent.make!
    @call_centre.children << @call_centre_agent

    # create campaign
    @currency = Currency.make!
    @campaign = Campaign.make!(:creator => @call_centre, :currency => @currency, :cost_type => Campaign::AGENT_BILLING_RATE_COST)
    @campaign2 = Campaign.make!(:creator => @call_centre, :currency => @currency, :cost_type => Campaign::FIXED_HOURLY_RATE_COST, :fixed_cost_value => 8)
    @campaign3 = Campaign.make!(:creator => @call_centre, :currency => @currency, :cost_type => Campaign::FIXED_COST, :fixed_cost_value => 4500)

    # assign users to campaign
    @campaign.users << @call_centre
    @campaign.users << @call_centre_agent1
    @campaign.users << @call_centre_agent2
    @campaign2.users << @call_centre
    @campaign2.users << @call_centre_agent1
    @campaign2.users << @call_centre_agent2
    @campaign3.users << @call_centre
    @campaign3.users << @call_centre_agent1
    @campaign3.users << @call_centre_agent2

    # create results
    @result1 = Result.make!(:final_reported_success)
    @result2 = Result.make!(:final_reported_success)
    @result3 = Result.make!(:upgrades_to_lead)
    @result4 = Result.make!(:upgrades_to_lead)
    @result5 = Result.make!(:not_final_reported)

    # assign results to campaign
    @campaign.results = [@result1,@result2,@result3,@result4]
    @campaign2.results = [@result1,@result2,@result3,@result4]
    @campaign3.results = [@result1,@result2,@result3,@result4,@result5]
    @result1.campaigns_results.each do |cr|
      cr.update_attribute(:value, 100)
    end
    @result2.campaigns_results.each do |cr|
      cr.update_attribute(:value, 10)
    end

    # create contacts
    @contact1 = Contact.make!(:campaign => @campaign)
    @contact2 = Contact.make!(:campaign => @campaign)
    @contact3 = Contact.make!(:campaign => @campaign, :price => 130)
    @contact4 = Contact.make!(:campaign => @campaign, :price => 13)
    @contact2_1 = Contact.make!(:campaign => @campaign2)
    @contact2_2 = Contact.make!(:campaign => @campaign2)
    @contact3_1 = Contact.make!(:campaign => @campaign3)
    @contact3_2 = Contact.make!(:campaign => @campaign3)
  end

  context "Initialization" do
    it "should initialize properly with custom values" do
      at = AgentTimesheet::General.new(:show_weekends     => '0',
                                       :start_date        => '2011-05-15',
                                       :end_date          => '20-12-2012',
                                       :campaigns         => [@campaign.id],
                                       :agents            => @campaign.users.map(&:id),
                                       :call_centres      => [],
                                       :display_hours     => 0,
                                       :display_results   => '0',
                                       :display_value     => false,
                                       :display_cost      => false,
                                       :overview          => 'false',
                                       :team_result_sheet => false,
                                       :agent_timesheet   => nil)
      at.start_date.should == Date.parse('2011-05-15')
      at.end_date.should == Date.parse('20-12-2012')
      at.campaigns.should =~ [@campaign]
      at.agents.should =~ User.find(@campaign.users.map(&:id))
      at.display_hours.should_not be_true
      at.display_results.should_not be_true
      at.display_value.should_not be_true
      at.display_cost.should_not be_true
      at.overview.should_not be_true
      at.team_result_sheet.should_not be_true
      at.agent_timesheet.should_not be_true
    end

    it "should return all commercial weeks between start and end dates" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent1, @campaign, '2012-05-15 12:00:00', 60)
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                       :end_date          => '2012-05-15',
                                       :campaigns         => [@campaign],
                                       :agents            => @campaign.users.map(&:id))
      at.cweeks.size.should == 54
    end

    it "should return correct number of week days" do
      AgentTimesheet::General.new(:show_weekends => true).days_of_week.should == (0..6)
      AgentTimesheet::General.new(:show_weekends => false).days_of_week.should == (0..4)
      AgentTimesheet::General.new(:show_weekends => true).commercial_days_of_week.should == [1,2,3,4,5,6,0]
      AgentTimesheet::General.new(:show_weekends => false).commercial_days_of_week.should == [1,2,3,4,5]
    end

    it "should initialize with all campaigns users when only campaign is specified" do
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                       :end_date          => '2012-05-15',
                                       :campaigns         => [@campaign])
      at.agents =~ @campaign.users
    end

    it "should initialize with all users campaigns when only user is specified" do
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                       :end_date          => '2012-05-15',
                                       :agents            => @call_centre_agent1)
      at.campaigns =~ @call_centre_agent1.campaigns
    end

  end

  context "Overview" do
    it "should group the results by year, week and day of week" do
      time_log(@call_centre_agent1, @campaign, '2012-05-15 12:00:00', 60)
      time_log(@call_centre_agent1, @campaign2, '2012-05-15 12:00:00', 60)
      at = AgentTimesheet::General.new(:start_date        => '2012-05-15',
                                       :end_date          => '2012-05-15',
                                       :campaigns         => [@campaign,@campaign2],
                                       :agents            => @campaign.users.map(&:id))
      at.hours.for_cweek(CWeek.new(20,2012)).for_dow(1).count.should == 2
    end

    it "should sum time only for selected agents and campaigns" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent1, @campaign2, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 60)

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id]).overview_data.dig(2011,19,6)
      at.size.should == 1
      at.first.hours.should == 1.0

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id]).overview_data.dig(2011,19,6)
      at.size.should == 1
      at.first.hours.should == 2.0

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign2],
                                  :agents            => [@call_centre_agent1.id]).overview_data.dig(2011,19,6)
      at.size.should == 1
      at.first.hours.should == 1.0

      AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign2],
                                  :agents            => [@call_centre_agent2.id]).overview_data.dig(2011,19,6).should be_nil

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign, @campaign2],
                                  :agents            => [@call_centre_agent1.id]).overview_data.dig(2011,19,6)
      at.size.should == 1
      at.first.hours.should == 2.0
    end

    it "should sum results only for selected agents and campaigns" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent1, @campaign2, '2011-05-15 13:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 60)

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id]).overview_data.dig(2011,19,6)
      at.size.should == 1
      at.first.results.should == 0.0

      # create result #1
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.parse('2011-05-15 16:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id]).overview_data.dig(2011,19,6)
      at.size.should == 1
      at.first.results.should == 1.0

      # create result #2
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent2, :created_at => Time.parse('2011-05-15 16:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id]).overview_data.dig(2011,19,6)
      at.size.should == 1
      at.first.results.should == 2.0

      # create results #3 and #4
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.parse('2011-05-15 16:00:00'))
      CallResult.make!(:contact => @contact2_2, :result => @result2, :creator => @call_centre_agent2, :created_at => Time.parse('2011-05-15 17:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign,@campaign2],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id]).overview_data.dig(2011,19,6)
      at.size.should == 1
      at.first.results.should == 4.0
    end

    it "should sum value only for sleected agents and campaigns" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 60)
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.parse('2011-05-15 16:00:00'))
      CallResult.make!(:contact => @contact2, :result => @result1, :creator => @call_centre_agent2, :created_at => Time.parse('2011-05-15 16:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id]).overview_data.dig(2011,19,6)
      at.size.should == 1
      at.first.value.should == 100.0
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id]).overview_data.dig(2011,19,6)
      at.size.should == 1
      at.first.value.should == 200.0

    end
  end

  context "Team result sheet" do
    it "should group the results by year, week, user_id and day of week" do
      time_log(@call_centre_agent1, @campaign, '2012-05-15 12:00:00', 60)
      at = AgentTimesheet::General.new(:start_date        => '2012-05-15',
                                       :end_date          => '2012-05-15',
                                       :campaigns         => [@campaign],
                                       :agents            => @campaign.users.map(&:id))
      at.team_result_sheet_data.dig(2012,20,@call_centre_agent1.id,1).size.should == 1
    end

    it "should sum time only for selected agents and campaigns" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent1, @campaign2, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 60)
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id])
      at.team_result_sheet_data.dig(2011,19,@call_centre_agent1.id,6).size.should == 1
      at.team_result_sheet_data.dig(2011,19,@call_centre_agent1.id,6).first.hours.should == 1.0
      at.team_result_sheet_data.dig(2011,19,@call_centre_agent2.id,6).should be_nil

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id])
      at.team_result_sheet_data.dig(2011,19,@call_centre_agent1.id,6).first.hours.should == 1.0
      at.team_result_sheet_data.dig(2011,19,@call_centre_agent1.id,6).size.should == 1
      at.team_result_sheet_data.dig(2011,19,@call_centre_agent2.id,6).first.hours.should == 1.0
      at.team_result_sheet_data.dig(2011,19,@call_centre_agent2.id,6).size.should == 1
    end

    it "should sum results only for selected agents and campaigns" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 60)
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id]).team_result_sheet_data.dig(2011,19,@call_centre_agent1.id,6)
      at.size.should == 1
      at.first.results.should == 0.0

      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.parse('2011-05-15 16:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id]).team_result_sheet_data.dig(2011,19,@call_centre_agent1.id,6)
      at.size.should == 1
      at.first.results.should == 1.0

      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent2, :created_at => Time.parse('2011-05-15 16:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id]).team_result_sheet_data.dig(2011,19,@call_centre_agent2.id,6)
      at.size.should == 1
      at.first.results.should == 1.0
    end

    it "should sum value only for sleected agents and campaigns" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 60)
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.parse('2011-05-15 16:00:00'))
      CallResult.make!(:contact => @contact2, :result => @result1, :creator => @call_centre_agent2, :created_at => Time.parse('2011-05-15 16:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id]).team_result_sheet_data.dig(2011,19,@call_centre_agent1.id,6)
      at.size.should == 1
      at.first.value.should == 100.0
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id]).team_result_sheet_data.dig(2011,19,@call_centre_agent2.id,6)
      at.size.should == 1
      at.first.value.should == 100.0

    end
  end

  context "Agent time sheet" do
    it "should group the results by year, week and day of week" do
      time_log(@call_centre_agent1, @campaign, '2012-05-15 12:00:00', 60)
      at = AgentTimesheet::General.new(:start_date        => '2012-05-15',
                                       :end_date          => '2012-05-15',
                                       :campaigns         => [@campaign],
                                       :agents            => @campaign.users.map(&:id))
      at.agent_time_sheet_data(@call_centre_agent1).dig(2012,20,1).size.should == 1
    end

    it "should sum time only for selected agents and campaigns" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent1, @campaign2, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 60)
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id])
      at.agent_time_sheet_data(@call_centre_agent1).dig(2011,19,6).size.should == 1
      at.agent_time_sheet_data(@call_centre_agent1).dig(2011,19,6).first.hours.should == 1.0
      at.agent_time_sheet_data(@call_centre_agent2).dig(2011,19,6).should be_nil

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id])
      at.agent_time_sheet_data(@call_centre_agent1).dig(2011,19,6).size.should == 1
      at.agent_time_sheet_data(@call_centre_agent1).dig(2011,19,6).first.hours.should == 1.0
      at.agent_time_sheet_data(@call_centre_agent2).dig(2011,19,6).size.should == 1
      at.agent_time_sheet_data(@call_centre_agent2).dig(2011,19,6).first.hours.should == 1.0
    end

    it "should sum results only for selected agents and campaigns" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 60)
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id]).agent_time_sheet_data(@call_centre_agent1).dig(2011,19,6)
      at.size.should == 1
      at.first.results.should == 0.0

      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.parse('2011-05-15 16:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id]).agent_time_sheet_data(@call_centre_agent1).dig(2011,19,6)
      at.size.should == 1
      at.first.results.should == 1.0

      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent2, :created_at => Time.parse('2011-05-15 16:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id]).agent_time_sheet_data(@call_centre_agent2).dig(2011,19,6)
      at.size.should == 1
      at.first.results.should == 1.0
    end

    it "should sum value only for sleected agents and campaigns" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 60)
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.parse('2011-05-15 16:00:00'))
      CallResult.make!(:contact => @contact2, :result => @result1, :creator => @call_centre_agent2, :created_at => Time.parse('2011-05-15 16:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id]).agent_time_sheet_data(@call_centre_agent1).dig(2011,19,6)
      at.size.should == 1
      at.first.value.should == 100.0
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id]).agent_time_sheet_data(@call_centre_agent2).dig(2011,19,6)
      at.size.should == 1
      at.first.value.should == 100.0
    end
  end

  context "Cost calculation" do
    it "should calculate correct cost for campaign with agent hourly rate" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 120)
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id]).agent_time_sheet_data(@call_centre_agent1).dig(2011,19,6)
      at.size.should == 1
      at.first.cost.should == 10.0
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent2.id]).agent_time_sheet_data(@call_centre_agent2).dig(2011,19,6)
      at.size.should == 1
      at.first.cost.should == 20.0
    end

    it "should calculate correct cost for campaign with fixed hourly rate" do
      time_log(@call_centre_agent1, @campaign2, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign2, '2011-05-15 12:00:00', 120)
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign2],
                                  :agents            => [@call_centre_agent1.id]).agent_time_sheet_data(@call_centre_agent1).dig(2011,19,6)
      at.size.should == 1
      at.first.cost.should == 8.0
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign2],
                                  :agents            => [@call_centre_agent2.id]).agent_time_sheet_data(@call_centre_agent2).dig(2011,19,6)
      at.size.should == 1
      at.first.cost.should == 16.0
    end

    it "should calculate correct cost for campaign with fixed campaign cost" do
      time_log(@call_centre_agent1, @campaign3, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign3, '2011-05-15 12:00:00', 120)
      CallResult.make!(:contact => @contact3_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.parse('2011-05-15 16:00:00'))
      CallResult.make!(:contact => @contact3_2, :result => @result5, :creator => @call_centre_agent2, :created_at => Time.parse('2011-05-15 16:00:00'))
      # 2 contacts total, 1 finished. 3 hours total time
      # (4500 * 50%) / 3 = 750 per hour
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign3],
                                  :agents            => [@call_centre_agent1.id]).agent_time_sheet_data(@call_centre_agent1).dig(2011,19,6)
      at.size.should == 1
      at.first.cost.should == 750.0
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign3],
                                  :agents            => [@call_centre_agent2.id]).agent_time_sheet_data(@call_centre_agent2).dig(2011,19,6)
      at.size.should == 1
      at.first.cost.should == 1500.0
    end
  end

end