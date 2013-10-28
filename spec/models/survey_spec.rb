require 'spec_helper'

describe Survey do
  fixtures :all

  before(:each) do
    @creator = User::Admin.make!
    @survey = Survey.make!(:creator => @creator, :owner => @creator)
    @survey.survey_questions.make!(:question_type => SurveyQuestion::SELECT_TYPE)
    @survey.survey_questions.make!
    @survey.survey_questions.make!
  end

  context "surveys duplicating" do
    before(:each) do
      # populate some answers
      @survey.survey_questions.each do |survey_question|
        survey_question.survey_answers.make!
      end
    end

    it "should add '(Copy of)' prefix for name for survey" do
      @duplicated_survey = @survey.duplicate!
      @duplicated_survey.should_not be_nil
      @duplicated_survey.name.should match /Copy of/
    end

    it "should duplicate survey with questions and without results" do
      @survey.should have(3).survey_questions

      @survey.survey_questions.each do |survey_question|
        survey_question.should have(1).survey_answers
      end

      @duplicated_survey = @survey.duplicate!
      @duplicated_survey.should_not be_nil
      @duplicated_survey.should have(3).survey_questions

      @duplicated_survey.survey_questions.each do |survey_question|
        survey_question.should have(0).survey_answers
      end
    end
  end

  context "general sending" do
    before(:each) do
      @campaign = Campaign.make!
      Contact.make!(:campaign => @campaign, :email_address => "jim@example.com")
      Contact.make!(:campaign => @campaign, :email_address => "alyona@example.com")
      @list = NewsletterList.make!
      @list.newsletter_sources.create(:source_type => NewsletterSource::CAMPAIGN_SOURCE, :sourceable => @campaign)
      @list.save
      @list.reload
      @survey.newsletter_lists << @list
      @survey.save
      @survey.reload
      @list.synchronize!(:campaign_monitor_synch => false, :use_delayed_job => false)
      @list.reload
    end

    it "should send to newsletter list" do
      @survey.last_sent_at.should be_nil
      @survey.send_to_newsletter_lists!

      ActionMailer::Base.deliveries.detect { |email| email.to.include?("jim@example.com") }.should_not be_nil
      ActionMailer::Base.deliveries.detect { |email| email.to.include?("alyona@example.com") }.should_not be_nil

      @survey.reload
      @survey.last_sent_at.should_not be_nil
      @survey.last_sent_recipients_count.should == 2
    end
  end

  context "upgrade contact to multiple leads upon survey completion" do
    before(:each) do
      @option_category1 = LeadCategory.make!
      @option_category2 = LeadCategory.make!
      @option1 = SurveyOption.make!(:survey_question => @survey.survey_questions.first, :category => @option_category1)
      @option2 = SurveyOption.make!(:survey_question => @survey.survey_questions.first, :category => @option_category2)
      @survey.reload

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
      @survey_recipient.survey_answers.create(:survey_question => @survey.survey_questions.first, :survey_options => [@option2], :question_type => SurveyQuestion::SELECT_TYPE)
      @survey_recipient.reload

      @survey_recipient.completed!

      @survey_recipient.categories_from_selected_options.map(&:id).should == [@option_category2.id]

      @contact.reload
      @contact.call_results.count.should == 1
      @contact.call_results.detect { |cr| cr.result_id == @result.id }.should be_present
      @contact.leads.map(&:category_id).sort.should == [@category1, @category2, @category3, @option_category2].map(&:id).sort

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
      @contact.leads.count.should == 4

      #leads return correct survey recipient for suppliers to view
      @contact.leads.each do |lead|
        lead.survey_recipients_for_category.all.count.should == 1
        lead.survey_recipients_for_category.first.should == @survey_recipient
      end
    end
  end

  context "chain mails for surveys" do
    def set_date(d)
      Date.stubs(:today).returns(d)
    end

    before(:each) do
      @signature = EmailTemplateSignature.create(:body => "Some awesome signature!", :email_from => "admin@erhvervsanalyse.dk", :name => "Custom signature 1")
      @chain_mail_link_clicked = SurveyChainMailType.make!(:email_template_signature => @signature)
      @chain_mail_link_clicked.chain_mail_items.first.update_attribute(:body, "Special chain mail")
      @chain_mail_option_1 = SurveyChainMailType.make!
      @chain_mail_option_2 = SurveyChainMailType.make!
      @survey.update_attributes(:link_clicked_chain_mail_type => @chain_mail_link_clicked)
      @select_question = @survey.survey_questions.make!(:question_type => SurveyQuestion::SELECT_TYPE)
      @option_1 = @select_question.survey_options.make!(:chain_mail_type => @chain_mail_option_1, :tag_list => ["tag_1", "tag_2"])
      @option_2 = @select_question.survey_options.make!(:chain_mail_type => @chain_mail_option_2, :tag_list => ["tag_3", "tag_4"])
      @survey.survey_newsletter_email_template.translations.each { |t| t.update_attribute(:body, "Standard intro email")}
      @survey.reload
    end

    context "use standard mail as intro" do
      before(:each) do
        @survey_recipient = @survey.create_survey_recipient(User::Supplier.make!, true)
      end

      it "should send standard email" do
        ActionMailer::Base.deliveries.detect { |e| e.from.include?("admin@erhvervsanalyse.dk") and e.to.include?(@survey_recipient.email) and e.body.include?("Standard intro email") }.should_not be_nil
      end

      it "should send chain mail when link is visited" do
        ChainMail.count.should == 0
        @survey_recipient.visited!
        ChainMail.count.should == 1
        ChainMail.last.chain_mail_type.should == @chain_mail_link_clicked
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

      it "should be possible to insert survey permalink to chain mail body and it will be replaced by unique recipient link" do
        @chain_mail_type = SurveyChainMailType.make!
        @chain_mail = ChainMail.make!(:chain_mail_type => @chain_mail_type, :chain_mailable => @survey_recipient, :email => @survey_recipient.email)

        @chain_mail_type.chain_mail_items.first.update_attribute(:body, %{ Lorem ipsum, <a href="http://fairleads.com/a"> or <a href="#{@survey.fake_permalink}">Visit here</a> dolor sit amet })

        #the normal links should be redirected as before
        @chain_mail.prepare_body(@chain_mail_type.chain_mail_items.first.body).should include("?redirect=http%3A%2F%2Ffairleads.com")

        #erhvervsanalyse.dk should be replaced by proper unique link to survey for given recipient
        @chain_mail.prepare_body(@chain_mail_type.chain_mail_items.first.body).should_not include(@survey.fake_permalink)
        @chain_mail.prepare_body(@chain_mail_type.chain_mail_items.first.body).should include(@survey_recipient.survey_link)
      end
    end

    context "use chain mail as intro" do
      before(:each) do
        @survey.update_attribute(:use_chain_mail_as_intro_mail, true)
        @survey_recipient = @survey.create_survey_recipient(User::Supplier.make!, true)
      end

      it "should send chain mail when recipient is created instead of standard template" do
        ActionMailer::Base.deliveries.detect { |e| e.to.include?(@survey_recipient.email) and e.body.include?("Standard intro email") }.should be_nil
        ActionMailer::Base.deliveries.detect { |e| e.from.include?("admin@erhvervsanalyse.dk") and e.to.include?(@survey_recipient.email) and e.body.include?("Special chain mail") }.should_not be_nil
      end

      it "should NOT send chain mail when link is visited" do
        ActionMailer::Base.deliveries.clear
        @survey_recipient.visited!
        ActionMailer::Base.deliveries.should be_empty
      end
    end
  end
end
