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

  context "chain mails for surveys" do
    def set_date(d)
      Date.stubs(:today).returns(d)
    end

    before(:each) do
      @chain_mail_link_clicked = SurveyChainMailType.make!
      @chain_mail_link_not_clicked = SurveyChainMailType.make!
      @chain_mail_option_1 = SurveyChainMailType.make!
      @chain_mail_option_2 = SurveyChainMailType.make!
      @survey.update_attributes(:link_clicked_chain_mail_type => @chain_mail_link_clicked, :link_not_clicked_chain_mail_type => @chain_mail_link_not_clicked, :link_not_clicked_chain_mail_delay => 5)
      @select_question = @survey.survey_questions.make!(:question_type => SurveyQuestion::SELECT_TYPE)
      @option_1 = @select_question.survey_options.make!(:chain_mail_type => @chain_mail_option_1, :tag_list => ["tag_1", "tag_2"])
      @option_2 = @select_question.survey_options.make!(:chain_mail_type => @chain_mail_option_2, :tag_list => ["tag_3", "tag_4"])
      @survey.reload

      @survey_recipient = @survey.create_survey_recipient(User::Supplier.make!)
    end

    it "should send chain mail when link is visited" do
      ChainMail.count.should == 0
      @survey_recipient.visited!
      ChainMail.count.should == 1
      ChainMail.last.chain_mail_type.should == @chain_mail_link_clicked
    end

    it "should send chain mail when link is not visited after set amount of days (delay)" do
      ChainMail.count.should == 0
      @survey_recipient2 = @survey.create_survey_recipient(User::Supplier.make!, false, false)
      @survey_recipient2.visited!

      #this is the visited link chain mail
      ChainMail.count.should == 1
      ChainMail.last.chain_mail_type.should == @chain_mail_link_clicked

      set_date(Date.today + 4.days)

      SurveyRecipient.send_link_not_clicked_chain_mails!

      #no new chain mails
      ChainMail.count.should == 1

      set_date(Date.today + 5.days)

      SurveyRecipient.send_link_not_clicked_chain_mails!

      #not clicked chain mail sent
      ChainMail.count.should == 2

      ChainMail.last.chain_mail_type.should == @chain_mail_link_not_clicked

      @survey_recipient.reload
      @survey_recipient.link_not_clicked_chain_mail_sent_at.should_not be_nil

      SurveyRecipient.send_link_not_clicked_chain_mails!

      #should not send again
      ChainMail.count.should == 2
    end

    it "should send chain mail from the chosen survey options and tag the recipient object accordingly upon completion" do
      ChainMail.count.should == 0

      @survey_recipient.visited!

      ChainMail.count.should == 1

      @survey_recipient.survey_answers.create(:survey_question_id => @select_question.id, :question_type => 4, :survey_option_ids => [@option_2.id])
      @survey_recipient.reload

      @survey_recipient.completed!

      ChainMail.count.should == 2

      ChainMail.last.chain_mail_type.should == @chain_mail_option_2

      @survey_recipient.reload

      #recipient should also be tagged by the chosen survey options
      @survey_recipient.recipient.tag_list.sort.should == ["tag_3", "tag_4"]
    end
  end
end