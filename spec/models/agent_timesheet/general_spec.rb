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
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent1, @campaign2, '2011-05-15 12:00:00', 60)
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                       :end_date          => '2011-05-15',
                                       :campaigns         => [@campaign,@campaign2],
                                       :agents            => @campaign.users.map(&:id))
      # 2 records, 1 per campaign
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 2
    end

    it "should sum time only for selected agents and campaigns" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent1, @campaign2, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 60)

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id])
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 1
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:hours) == 1

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id])
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 2
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:hours) == 2

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign2],
                                  :agents            => [@call_centre_agent1.id])
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 1
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:hours) == 1

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign2],
                                  :agents            => [@call_centre_agent2.id])
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 0

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign, @campaign2],
                                  :agents            => [@call_centre_agent1.id])
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 2
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:hours) == 2
    end

    it "should sum results only for selected agents and campaigns" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent1, @campaign2, '2011-05-15 13:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 60)

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id])
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 0
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:results) == 0

      # create result #1
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.parse('2011-05-15 16:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id])
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 1
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:results) == 1

      # create result #2
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent2, :created_at => Time.parse('2011-05-15 16:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id])
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 2
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:results) == 2

      # create results #3 and #4
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.parse('2011-05-15 16:00:00'))
      CallResult.make!(:contact => @contact2_2, :result => @result2, :creator => @call_centre_agent2, :created_at => Time.parse('2011-05-15 17:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign,@campaign2],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id])
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 4
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:results) == 4
    end

    it "should sum value only for sleected agents and campaigns" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 60)

      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.parse('2011-05-15 16:00:00'))
      CallResult.make!(:contact => @contact2, :result => @result1, :creator => @call_centre_agent2, :created_at => Time.parse('2011-05-15 16:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id])
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 1
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:value) == 100

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id])
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 2
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:value) == 200

    end
  end

  context "Team result sheet" do
    it "should group the results by year, week, user_id and day of week" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                       :end_date          => '2011-05-15',
                                       :campaigns         => [@campaign],
                                       :agents            => @campaign.users.map(&:id))
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agents(@call_centre_agent1).count.should == 1
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agents(@call_centre_agent2).count.should == 0
    end

    it "should sum time only for selected agents and campaigns" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent1, @campaign2, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 60)
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id])
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 1
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:hours) == 1
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 0
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:hours) == 0
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 1
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:hours) == 1

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id])
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 1
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:hours) == 1
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 1
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:hours) == 1
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 2
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:hours) == 2
    end

    it "should sum results only for selected agents and campaigns" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 60)
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id])
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 0
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:results) == 0
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 0
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:results) == 0
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 0
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:results) == 0

      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.parse('2011-05-15 16:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id])
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 1
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:results) == 1
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 0
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:results) == 0
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 1
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:results) == 100

      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent2, :created_at => Time.parse('2011-05-15 16:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id])
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 1
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:results) == 1
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 1
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:results) == 1
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 2
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:results) == 200
    end

    it "should sum value only for sleected agents and campaigns" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 60)
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.parse('2011-05-15 16:00:00'))
      CallResult.make!(:contact => @contact2, :result => @result1, :creator => @call_centre_agent2, :created_at => Time.parse('2011-05-15 16:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id])
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 1
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:value) == 100
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 0
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:value) == 0
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 1
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:value) == 100

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id])
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 1
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:value) == 100
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 1
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:value) == 100
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 2
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:value) == 200

    end
  end

  context "Agent time sheet" do
    it "should group the results by year, week and day of week" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                       :end_date          => '2011-05-15',
                                       :campaigns         => [@campaign],
                                       :agents            => @campaign.users.map(&:id))
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 1
    end

    it "should sum time only for selected agents and campaigns" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent1, @campaign2, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 60)
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id])
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 1
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:hours) == 1
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 0
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:hours) == 0
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 1
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:hours) == 1

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign,@campaign2],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id])
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 2
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:hours) == 2
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 1
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:hours) == 1
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 3
      at.hours.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:hours) == 3
    end

    it "should sum results only for selected agents and campaigns" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 60)
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign,@campaign2],
                                  :agents            => [@call_centre_agent1.id])
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 0
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:results) == 0
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 0
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:results) == 0
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 0
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:results) == 0

      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.parse('2011-05-15 16:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign,@campaign2],
                                  :agents            => [@call_centre_agent1.id])
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 1
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:results) == 1
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 0
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:results) == 0
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 1
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:results) == 1

      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent2, :created_at => Time.parse('2011-05-15 16:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign,@campaign2],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id])
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 1
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:results) == 1
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 1
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:results) == 1
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 2
      at.results.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:results) == 2
    end

    it "should sum value only for sleected agents and campaigns" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 60)
      CallResult.make!(:contact => @contact1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.parse('2011-05-15 16:00:00'))
      CallResult.make!(:contact => @contact2, :result => @result1, :creator => @call_centre_agent2, :created_at => Time.parse('2011-05-15 16:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign,@campaign2],
                                  :agents            => [@call_centre_agent1.id])
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 1
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:value) == 100
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 0
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:value) == 0
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 1
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:value) == 100

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign,@campaign2],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id])
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 1
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:value) == 100
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 1
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:value) == 100
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 2
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:value) == 200

      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.parse('2011-05-15 17:00:00'))
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign,@campaign2],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id])
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 1
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:value) == 100
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 1
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:value) == 100
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 2
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:value) == 200

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign,@campaign2],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id])
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 2
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:value) == 200
      throw at.value.for_cweek(CWeek.new(19,2011)).for_dow(6)
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 1
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:value) == 100
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 3
      at.value.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:value) == 300

    end
  end

  context "Cost calculation" do
    it "should calculate correct cost for campaign with agent hourly rate" do
      time_log(@call_centre_agent1, @campaign, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign, '2011-05-15 12:00:00', 120)
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id])
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 1
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:cost) == 10
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 0
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:cost) == 0
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 1
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:cost) == 10

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent2.id])
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 0
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:cost) == 0
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 1
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:cost) == 20
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 1
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:cost) == 20

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id])
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 1
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:cost) == 10
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 1
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:cost) == 20
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 2
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:cost) == 30
    end

    it "should calculate correct cost for campaign with fixed hourly rate" do
      time_log(@call_centre_agent1, @campaign2, '2011-05-15 12:00:00', 60)
      time_log(@call_centre_agent2, @campaign2, '2011-05-15 12:00:00', 120)
      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign2],
                                  :agents            => [@call_centre_agent1.id])
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 1
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:cost) == 8
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 0
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:cost) == 0
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 1
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:cost) == 8

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign2],
                                  :agents            => [@call_centre_agent2.id])
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 0
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:cost) == 0
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 1
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:cost) == 16
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 1
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:cost) == 16

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign2],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id])
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 1
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:cost) == 8
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 1
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:cost) == 16
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 2
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:cost) == 24
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
                                  :agents            => [@call_centre_agent1.id])
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 1
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:cost) == 750
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 0
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:cost) == 0
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 1
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:cost) == 750

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign3],
                                  :agents            => [@call_centre_agent2.id])
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 0
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:cost) == 0
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 1
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:cost) == 1500
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 1
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:cost) == 1500

      at = AgentTimesheet::General.new(:start_date        => '2011-05-15',
                                  :end_date          => '2011-05-15',
                                  :campaigns         => [@campaign3],
                                  :agents            => [@call_centre_agent1.id,@call_centre_agent2.id])
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).count.should == 1
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent1).sum(:cost) == 750
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).count.should == 1
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).for_agent(@call_centre_agent2).sum(:cost) == 1500
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).count.should == 2
      at.cost.for_cweek(CWeek.new(19,2011)).for_dow(6).sum(:cost) == 2250
    end
  end

end