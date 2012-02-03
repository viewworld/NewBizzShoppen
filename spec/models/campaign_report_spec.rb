require 'spec_helper'

describe CampaignReport do
  fixtures :all

  before(:each) do
    # create users
    @call_centre = User::CallCentre.make!
    @call_centre_agent1 = User::CallCentreAgent.make!(:company_name => 'CCA1')
    @call_centre_agent2 = User::CallCentreAgent.make!(:company_name => 'CCA2')
    @call_centre.children << @call_centre_agent

    # create campaign
    @currency = Currency.make!
    @campaign1 = Campaign.make!(:creator => @call_centre, :currency => @currency, :success_rate => 94)
    @campaign2 = Campaign.make!(:creator => @call_centre, :currency => @currency, :success_rate => 94)

    # assign users to campaign
    @campaign1.users = [@call_centre,@call_centre_agent1,@call_centre_agent2]
    @campaign2.users = [@call_centre,@call_centre_agent1,@call_centre_agent2]

    # create results
    @result1 = Result.make!(:final_reported_success)
    @result2 = Result.make!(:final_reported_success)
    @result3 = Result.make!(:upgrades_to_lead)
    @result4 = Result.make!(:upgrades_to_lead)
    @result_final_reported = Result.make!(:final_reported)
    @result_final = Result.make!(:final)
    @result_not_final = Result.make!
    @result_not_final_reported = Result.make!(:not_final_reported)
    @result_dyn_value = Result.make!(:final_reported_success)
    @result_dyn_value.result_fields.create(:name => "test field 1", :field_type => ResultField::INTEGER)
    @result_dyn_value.result_fields.create(:name => "test field 2", :field_type => ResultField::INTEGER)
    @result_dyn_value.result_fields.create(:name => "test field 3", :field_type => ResultField::INTEGER)

    # assign results to campaign
    @campaign1.results = [@result1,@result2,@result3,@result4,@result_final_reported,@result_final,@result_not_final_reported]
    @campaign2.results = [@result1,@result2,@result3,@result4,@result_final_reported,@result_final,@result_not_final_reported]
    @result1.campaigns_results.first.update_attributes(:value => 100, :expected_completed_per_hour => 5)
    @result2.campaigns_results.first.update_attributes(:value => 10, :expected_completed_per_hour => 10)
    @result1.campaigns_results.last.update_attributes(:value => 100, :expected_completed_per_hour => 5)
    @result2.campaigns_results.last.update_attributes(:value => 10, :expected_completed_per_hour => 10)
    @result_final_reported.campaigns_results.first.update_attributes(:value => 23, :expected_completed_per_hour => 5)
    @result_final_reported.campaigns_results.last.update_attributes(:value => 23, :expected_completed_per_hour => 10)

    # create contacts
    @contact1_1 = Contact.make!(:campaign => @campaign1)
    @contact1_2 = Contact.make!(:campaign => @campaign1)
    @contact1_3 = Contact.make!(:campaign => @campaign1, :price => 130)
    @contact1_4 = Contact.make!(:campaign => @campaign1, :price => 13)

    @contact2_1 = Contact.make!(:campaign => @campaign2)
    @contact2_2 = Contact.make!(:campaign => @campaign2)
    @contact2_3 = Contact.make!(:campaign => @campaign2, :price => 130)
    @contact2_4 = Contact.make!(:campaign => @campaign2, :price => 13)
  end

  context "Initialization" do
    it "should initialize properly with hand given dates" do
      cr = CampaignReport.new(@campaign, Date.today+5.days,Date.today+50.days)
      cr.date_from.should == Date.today+5.days and cr.date_to.should == Date.today+50.days
    end
  end

  context "Report for given campaign" do
    it "should return correct target success percent" do
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.target_success_percent.should == @campaign1.success_rate.to_f
    end

    it "should return correct realised success percent" do
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.realised_success_percent.should == 50.0
    end

    it "should return correct target finished contacts per hour" do
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.target_finished_contacts_per_hour.should == @campaign1.finished_contacts_per_hour.to_f
    end

    it "should return correct realised finished contacts per hour" do
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      (1..4).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign2, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+15.minutes)
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.realised_finished_contacts_per_hour.should == 2.0 and cr.send(:total_hours).should == 1.0
    end

    it "should return all reported result types" do
      CampaignReport.final_results.size.should == 5
    end

    it "should return correct target final results of given type per hour" do
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.target_final_result(@result1).should == 5.0 and cr.target_final_result(@result2).should == 10.0
    end

    it "should return correct realised final results of given type per hour" do
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      (1..4).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign2, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+15.minutes)
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.realised_final_result(@result1).should == 1.0
    end

    it "should return correct target value per hour" do
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.target_value_per_hour.should == @campaign1.euro_production_value_per_hour.to_f
    end

    it "should return correct realised value per hour" do
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      (1..4).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign2, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+15.minutes)
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.realised_value_per_hour.should == 253.0
    end

    it "should return correct number of contacts" do
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.total_number_of_contacts.should == @campaign1.contacts.count
    end

    it "should return correct number of completed contacts" do
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_2, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.completed_number_of_contacts.should == 3
    end

    it "should return correct completion percent" do
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_2, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.completion_percent.should == 50.0
    end

    it "should return correct value created" do
      @campaign1.results << @result_dyn_value
      @campaign1.save
      @result_dyn_value.campaigns_results.first.update_attributes(:value => 100, :expected_completed_per_hour => 5, :is_dynamic_value => true)
      @result_dyn_value.result_fields.each do |result_field|
        result_field.campaigns_result_fields.create(:campaign => @campaign1, :is_dynamic_value => result_field.name != "test field 3" ? true : false, :dynamic_euro_value => 17)
      end

      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_2, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
#      result_values = []
#      @result_dyn_value.result_fields.each_with_index do  |result_field, i|
#        result_values << ResultValue.new(:result_field => result_field, :field_type => result_field.field_type, :value => (i+1).to_s)
#      end
#      CallResult.make!(:contact => @contact1_4, :result => @result_dyn_value, :creator => @call_centre_agent1, :result_values => result_values)
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.value_created.should == 253.0   #304
    end

    it "should return correct number of call results" do
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset) #this
      CallResult.make!(:contact => @contact1_3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset) #this
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_2, :result => @result_final_reported, :creator => @call_centre_agent1) #this
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.number_of_call_results.should == 3
    end

    it "should return average number of minutes per final result" do
      (1..4).each do |i| # total 1 hour
        UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.average_number_of_minutes_per_final_result.should == "-"
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset) # this
      CallResult.make!(:contact => @contact1_3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset) # this
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_2, :result => @result_final_reported, :creator => @call_centre_agent1) # this
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      cr.average_number_of_minutes_per_final_result.should == 20.0
    end

    it "should return average number of call results per finished contact" do
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.average_number_of_call_results_per_finished_contact.should == "-"
      CallResult.make!(:contact => @contact1_1, :result => @result_not_final_reported, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_1, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_3, :result => @result_not_final_reported, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_3, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_2, :result => @result_not_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_2, :result => @result_final_reported, :creator => @call_centre_agent1)
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.average_number_of_call_results_per_finished_contact.should == 2.0
    end

    it "should return number of call results per minute" do
      CallResult.make!(:contact => @contact1_1, :result => @result_not_final_reported, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_1, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_3, :result => @result_not_final_reported, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_3, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_2, :result => @result_not_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_2, :result => @result_final_reported, :creator => @call_centre_agent1)
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.number_of_results_per_minute.should == "-"

      (1..4).each do |i| # total 1 hour
        UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      cr.number_of_results_per_minute.should == 0.1
    end

    it "should return correct leads sold total value" do
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_4, :result => @result4, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_2, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      LeadPurchase.make!(:lead => @contact1_3.lead)
      LeadPurchase.make!(:lead => @contact1_4.lead)
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.leads_sold_total_value.should == 143.0
    end

    it "should return correct leads sold count" do
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_4, :result => @result4, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_2, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      LeadPurchase.make!(:lead => @contact1_3.lead)
      LeadPurchase.make!(:lead => @contact1_4.lead)
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.leads_sold_count.should == 2
    end

    it "should return correct total time used" do
      (1..4).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign2, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+15.minutes)
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.hours_used.should == 1.0
    end

    it "should return correct agent billing rate cost" do
      @campaign1.update_attribute(:cost_type, Campaign::AGENT_BILLING_RATE_COST)
      (1..4).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign2, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+15.minutes)
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.production_cost.should == 10.0
    end

    it "should return correct fixed hourly rate cost" do
      @campaign1.update_attributes(:cost_type => Campaign::FIXED_HOURLY_RATE_COST, :fixed_cost_value => 11)
      (1..4).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign2, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+15.minutes)
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.production_cost.should == 11.0
    end

    it "should return correct fixed cost" do
      @campaign1.update_attributes(:cost_type => Campaign::FIXED_COST, :fixed_cost_value => 666)
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.production_cost.should == 666.0
    end

    it "should return correct no cost" do
      @campaign1.update_attributes(:cost_type => Campaign::NO_COST, :fixed_cost_value => 666)
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.production_cost.should == 0.0
    end

    it "should return correct target result" do
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      @campaign1.update_attribute(:cost_type, Campaign::AGENT_BILLING_RATE_COST)
      (1..4).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign2, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+15.minutes)
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.target_result.should == 243.0
    end

    it "should return correct realised result" do
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_4, :result => @result4, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_2, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      LeadPurchase.make!(:lead => @contact1_3.lead)
      LeadPurchase.make!(:lead => @contact1_4.lead)
      @campaign1.update_attribute(:cost_type, Campaign::AGENT_BILLING_RATE_COST)
      (1..4).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign2, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+15.minutes)
      cr = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week)
      cr.realised_result.should == 133.0
    end

  end

  context "Agent report" do
    it "should return correct realised success percent" do
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_2, :result => @result1, :creator => @call_centre_agent2, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      cr1 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent1)
      cr2 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent2)
      cr1.realised_success_percent.should == 50.0 and cr2.realised_success_percent.should == 100.0
    end

    it "should return correct realised finished contacts per hour" do
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_2, :result => @result1, :creator => @call_centre_agent2, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      (1..4).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      (1..8).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent2, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign2, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+15.minutes)
      cr1 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent1)
      cr2 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent2)
      cr1.realised_finished_contacts_per_hour.should == 2.0 and cr1.send(:total_hours).should == 1.0 and cr2.realised_finished_contacts_per_hour.should == 0.5 and cr2.send(:total_hours).should == 2.0
    end

    it "should return correct realised final results of given type per hour" do
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_2, :result => @result1, :creator => @call_centre_agent2, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      (1..4).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      (1..8).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent2, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign2, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+15.minutes)
      cr1 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent1)
      cr2 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent2)
      cr1.realised_final_result(@result1).should == 1.0 and cr2.realised_final_result(@result1).should == 0.5 and cr1.realised_final_result(@result2).should == 0.0 and
              cr2.realised_final_result(@result2).should == 0.0
    end

    it "should return correct realised value per hour" do
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_2, :result => @result1, :creator => @call_centre_agent2, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      (1..4).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      (1..8).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent2, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign2, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+15.minutes)
      cr1 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent1)
      cr2 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent2)
      cr1.realised_value_per_hour.should == 253.0 and cr2.realised_value_per_hour.should == 50.0
    end

    it "should return correct number of completed contacts" do
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_2, :result => @result1, :creator => @call_centre_agent2, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_2, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      cr1 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent1)
      cr2 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent2)
      cr1.completed_number_of_contacts.should == 3 and cr2.completed_number_of_contacts.should == 1
    end

    it "should return correct value created" do
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_2, :result => @result1, :creator => @call_centre_agent2, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      cr1 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent1)
      cr2 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent2)
      cr1.value_created.should == 253.0 and cr2.value_created.should == 100.0
    end

    it "should return correct leads sold total value" do
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_4, :result => @result4, :creator => @call_centre_agent2, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_2, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      LeadPurchase.make!(:lead => @contact1_3.lead)
      LeadPurchase.make!(:lead => @contact1_4.lead)
      cr1 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent1)
      cr2 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent2)
      cr1.leads_sold_total_value.should == 130.0 and cr2.leads_sold_total_value.should == 13.0
    end

    it "should return correct leads sold count" do
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_4, :result => @result4, :creator => @call_centre_agent2, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_2, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      LeadPurchase.make!(:lead => @contact1_3.lead)
      LeadPurchase.make!(:lead => @contact1_4.lead)
      cr1 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent1)
      cr2 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent2)
      cr1.leads_sold_count.should == 1 and cr2.leads_sold_count == 1
    end

    it "should return correct total time used" do
      (1..4).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      (1..8).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent2, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign2, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+15.minutes)
      cr1 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent1)
      cr2 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent2)
      cr1.hours_used.should == 1.0 and cr2.hours_used.should == 2.0
    end

    it "should return correct target result" do
      @campaign1.update_attribute(:cost_type, Campaign::AGENT_BILLING_RATE_COST)
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_4, :result => @result4, :creator => @call_centre_agent2, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_2, :result => @result2, :creator => @call_centre_agent2, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_2, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      (1..4).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      (1..8).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent2, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end

      UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign2, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+15.minutes)
      cr1 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent1)
      cr2 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent2)
      cr1.target_result.should == 243.0 and cr2.target_result.should == 3.0
    end

    it "should return correct realised result" do
      @campaign1.update_attribute(:cost_type, Campaign::AGENT_BILLING_RATE_COST)
      CallResult.make!(:contact => @contact1_1, :result => @result1, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_3, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_4, :result => @result4, :creator => @call_centre_agent2, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_2, :result => @result2, :creator => @call_centre_agent2, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset)
      CallResult.make!(:contact => @contact1_2, :result => @result3, :creator => @call_centre_agent1, :created_at => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset-1.day)
      CallResult.make!(:contact => @contact1_1, :result => @result_final_reported, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact1_1, :result => @result_final, :creator => @call_centre_agent1)
      CallResult.make!(:contact => @contact2_1, :result => @result1, :creator => @call_centre_agent1)
      LeadPurchase.make!(:lead => @contact1_3.lead)
      LeadPurchase.make!(:lead => @contact1_4.lead, :quantity => 5)
      (1..4).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end
      (1..8).each do |i|
        UserSessionLog.make!(:user => @call_centre_agent2, :campaign => @campaign1, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+i*15.minutes+15.minutes)
      end

      UserSessionLog.make!(:user => @call_centre_agent1, :campaign => @campaign2, :start_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset, :end_time => Time.now.beginning_of_week+Time.now.beginning_of_week.utc_offset+15.minutes)
      cr1 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent1)
      cr2 = CampaignReport.new(@campaign1, Time.new.beginning_of_week, Time.new.end_of_week, @call_centre_agent2)
      cr1.realised_result.should == 120.0
      cr2.realised_result.should == 45.0
    end
  end

end