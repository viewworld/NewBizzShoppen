require 'spec_helper'

describe Survey do
  fixtures :all

  before(:each) do
    @survey = Survey.make!
    @survey.survey_questions.make!
    @survey.survey_questions.make!
    @survey.survey_questions.make!
  end

  context "upgrade contact to multiple leads upon survey completion" do
    before(:each) do
      @campaign = Campaign.make!
      @result = Result.where(:name => "Upgraded to lead", :generic => true).first
      @campaign.results = [@result]
      @contact = Contact.make!(:empty, :campaign => @campaign)

      @campaign_result = @result.campaigns_results.for_campaign(@campaign).first
      @campaign_result.update_attributes({ :settings => { "use_value_as_lead_price" => "1" }, :value => 125.89 })

      @category1 = LeadCategory.make!
      @category2 = LeadCategory.make!
      @category3 = LeadCategory.make!
      @agent = User::CallCentreAgent.make!

      @survey.upgrade_contacts_to_leads = true
      @survey.lead_creator = @agent
      @survey.categories = [@category1, @category2, @category3]
      @survey.save

      @survey_recipient = @survey.create_survey_recipient(@contact, false, false)
    end

    it "should upgrade contact to many leads for each category" do
      @survey_recipient.completed!

      @contact.reload
      @contact.call_results.count.should == 1
      @contact.call_results.detect { |cr| cr.result_id == @result.id }.should be_present
      @contact.leads.map(&:category_id).sort.should == [@category1, @category2, @category3].map(&:id).sort

      @contact.leads.each do |lead|
        lead.header.should == @survey.name
        lead.price.should == 125.89
        lead.currency_id.should == @campaign.currency_id
        lead.upgraded_from_survey_id.should == @survey.id
        lead.purchase_decision_date.should == (Date.today+1.year)
        lead.sale_limit.should == 1
        lead.creator_id.should == @agent.id
      end

      #cannot be completed again and completed contact cannot be upgraded again
      @survey_recipient.completed!
      @contact.reload
      @contact.call_results.count.should == 1
      @contact.leads.count.should == 3

      #leads return correct survey recipient for suppliers to view
      @contact.leads.each do |lead|
        lead.survey_recipients_for_category.first.should == @survey_recipient
      end
    end
  end
end