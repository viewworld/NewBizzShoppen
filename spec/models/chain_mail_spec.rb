require 'spec_helper'

describe ChainMail do

  def set_time(t)
    Time.stubs(:now).returns(t)
  end

  def reset_time
    Time.stubs(:now).returns(@time)
  end

  def setup_chain_mail_types(klass)
    Delayed::Worker.delay_jobs = true
    @chain_mail_type = klass.make!
    3.times do
      @chain_mail_type.chain_mail_items << ChainMailItem.make
    end
    @chain_mail_type.save
    @time = Time.now
  end

  context "campaign chain mail type" do
    before(:each) do
      setup_chain_mail_types(CampaignChainMailType)
    end

    context "delayed jobs" do
      it "should create dealyed jobs" do
        @chain_mail = ChainMail.make!(:chain_mail_type => @chain_mail_type)
        @chain_mail.delayed_jobs.count.should == 4
      end

      it "should schedule correct run_at time" do
        @chain_mail = ChainMail.make!(:chain_mail_type => @chain_mail_type)
        @chain_mail.delayed_jobs.order("run_at ASC").each_with_index do |dj,i|
          dj.run_at.to_date.should == Date.today + (@chain_mail.chain_mail_type.first_execution_delay + (i*@chain_mail.chain_mail_type.cycle_time)).days
        end
      end

      it "should create chain mail when I assign chain mail type to call result" do
        @call_result = CallResult.make!
        @call_result.chain_mail_type_id = @chain_mail_type.id
        @call_result.save; @call_result.reload
        @call_result.chain_mail.chain_mail_type == @chain_mail_type
        @call_result.chain_mail.delayed_jobs.count.should == 4
      end

      it "should delete chain when I remove it from call result" do
        @call_result = CallResult.make!
        Delayed::Job.destroy_all
        @call_result.chain_mail_type_id = @chain_mail_type.id
        @call_result.save; @call_result.reload
        @call_result.chain_mail_type_id = ''
        @call_result.save; @call_result.reload
        @call_result.chain_mail.should be_nil
        ChainMail.count.should == 0
        Delayed::Job.count.should == 0
      end
    end

    context "delayed jobs" do
      it "should behave correctly for condition 'send if link clicked'" do
        @chain_mail_type.execution_conditions = {"conditions" => [ChainMailType::LINK_CLICKED], "type" => ChainMailType::SEND_IF, "operator" => nil}
        @chain_mail_type.save; @chain_mail_type.reload

        # ===========================
        # part 1: condition not met
        # ===========================
        @chain_mail = ChainMail.make!(:chain_mail_type => @chain_mail_type)

        # tomorrow
        set_time(Time.now+1.day)
        Delayed::Worker.new.work_off

        # first email sent
        @chain_mail.reload
        @chain_mail.delayed_jobs.count.should == 3


        # day after tomorrow
        set_time(Time.now+1.day)
        @chain_mail.keep_sending?.should == false
        Delayed::Worker.new.work_off

        # condition not met, all remaining emails in chain deleted
        ChainMail.count.should == 0
        Delayed::Job.count.should == 0

        # ===========================
        # part 2: condition met
        # ===========================
        reset_time
        @chain_mail2 = ChainMail.make!(:chain_mail_type => @chain_mail_type)

        # tomorrow
        set_time(Time.now+1.day)
        Delayed::Worker.new.work_off

        # first email sent
        @chain_mail2.reload
        @chain_mail2.delayed_jobs.count.should == 3

        # day after tomorrow with link clicked
        set_time(Time.now+1.day)
        @chain_mail2.update_attribute(:last_link_clicked_at, Time.now-1.hour)
        @chain_mail2.keep_sending?.should == true
        Delayed::Worker.new.work_off

        # next email is sent
        @chain_mail2.reload
        @chain_mail2.delayed_jobs.count.should == 2
      end

      it "should behave correctly for condition 'stop if link clicked'" do
        @chain_mail_type.execution_conditions = {"conditions" => [ChainMailType::LINK_CLICKED], "type" => ChainMailType::STOP_IF, "operator" => nil}
        @chain_mail_type.save; @chain_mail_type.reload

        # ===========================
        # part 1: condition not met
        # ===========================
        @chain_mail = ChainMail.make!(:chain_mail_type => @chain_mail_type)

        # tomorrow
        set_time(Time.now+1.day)
        Delayed::Worker.new.work_off

        # first email sent
        @chain_mail.reload
        @chain_mail.delayed_jobs.count.should == 3
        @chain_mail.keep_sending?.should == true

        # day after tomorrow no link clicked
        set_time(Time.now+1.day)
        @chain_mail.keep_sending?.should == true
        Delayed::Worker.new.work_off

        # next email sent
        @chain_mail.reload
        @chain_mail.delayed_jobs.count.should == 2
        @chain_mail.keep_sending?.should == true
        @chain_mail.destroy

        # ===========================
        # part 2: condition met
        # ===========================
        reset_time
        @chain_mail2 = ChainMail.make!(:chain_mail_type => @chain_mail_type)

        # tomorrow
        set_time(Time.now+1.day)
        Delayed::Worker.new.work_off

        # first email sent
        @chain_mail2.reload
        @chain_mail2.delayed_jobs.count.should == 3

        # day after tomorrow link clicked
        set_time(Time.now+1.day)
        @chain_mail2.update_attribute(:last_link_clicked_at, Time.now-1.hour)
        @chain_mail2.keep_sending?.should == false
        Delayed::Worker.new.work_off

        # chain stopped
        ChainMail.count.should == 0
        Delayed::Job.count.should == 0
      end

      it "should behave correctly for condition 'send if link clicked and loggedin'" do
        @chain_mail_type.execution_conditions = {"conditions" => [ChainMailType::LINK_CLICKED, ChainMailType::LOGGED_IN], "type" => ChainMailType::SEND_IF, "operator" => ChainMailType::AND}
        @chain_mail_type.save; @chain_mail_type.reload

        @chain_mail = ChainMail.make!(:chain_mail_type => @chain_mail_type)

        # tomorrow
        set_time(Time.now+1.day)
        Delayed::Worker.new.work_off
        @chain_mail.reload

        # day after tomorrow
        set_time(Time.now+1.day)
        @chain_mail.keep_sending?.should == false
        @chain_mail.update_attribute(:last_link_clicked_at, Time.now-1.hour)
        @chain_mail.keep_sending?.should == false
        @chain_mail.update_attribute(:last_login_at, Time.now-1.hour)
        @chain_mail.keep_sending?.should == true
      end

      it "should behave correctly for condition 'stop if link clicked and loggedin'" do
        @chain_mail_type.execution_conditions = {"conditions" => [ChainMailType::LINK_CLICKED, ChainMailType::LOGGED_IN], "type" => ChainMailType::STOP_IF, "operator" => ChainMailType::AND}
        @chain_mail_type.save; @chain_mail_type.reload

        @chain_mail = ChainMail.make!(:chain_mail_type => @chain_mail_type)

        # tomorrow
        set_time(Time.now+1.day)
        Delayed::Worker.new.work_off
        @chain_mail.reload

        # day after tomorrow
        set_time(Time.now+1.day)
        @chain_mail.keep_sending?.should == true
        @chain_mail.update_attribute(:last_link_clicked_at, Time.now-1.hour)
        @chain_mail.keep_sending?.should == true
        @chain_mail.update_attribute(:last_login_at, Time.now-1.hour)
        @chain_mail.keep_sending?.should == false
      end

      it "should behave correctly for condition 'stop if link clicked or loggedin'" do
        @chain_mail_type.execution_conditions = {"conditions" => [ChainMailType::LINK_CLICKED, ChainMailType::LOGGED_IN], "type" => ChainMailType::STOP_IF, "operator" => ChainMailType::OR}
        @chain_mail_type.save; @chain_mail_type.reload

        @chain_mail = ChainMail.make!(:chain_mail_type => @chain_mail_type)

        # tomorrow
        set_time(Time.now+1.day)
        Delayed::Worker.new.work_off
        @chain_mail.reload

        # day after tomorrow
        set_time(Time.now+1.day)
        @chain_mail.keep_sending?.should == true
        @chain_mail.update_attributes(:last_link_clicked_at => Time.now-1.hour, :last_login_at => nil)
        @chain_mail.keep_sending?.should == false
        @chain_mail.update_attributes(:last_link_clicked_at => nil, :last_login_at => Time.now-1.hour)
        @chain_mail.keep_sending?.should == false
        @chain_mail.update_attributes(:last_link_clicked_at => Time.now-1.hour, :last_login_at => Time.now-1.hour)
        @chain_mail.keep_sending?.should == false
      end

      it "should behave correctly for condition 'send if link clicked or loggedin'" do
        @chain_mail_type.execution_conditions = {"conditions" => [ChainMailType::LINK_CLICKED, ChainMailType::LOGGED_IN], "type" => ChainMailType::SEND_IF, "operator" => ChainMailType::OR}
        @chain_mail_type.save; @chain_mail_type.reload

        @chain_mail = ChainMail.make!(:chain_mail_type => @chain_mail_type)

        # tomorrow
        set_time(Time.now+1.day)
        Delayed::Worker.new.work_off
        @chain_mail.reload

        # day after tomorrow
        set_time(Time.now+1.day)
        @chain_mail.keep_sending?.should == false
        @chain_mail.update_attributes(:last_link_clicked_at => Time.now-1.hour, :last_login_at => nil)
        @chain_mail.keep_sending?.should == true
        @chain_mail.update_attributes(:last_link_clicked_at => nil, :last_login_at => Time.now-1.hour)
        @chain_mail.keep_sending?.should == true
        @chain_mail.update_attributes(:last_link_clicked_at => Time.now-1.hour, :last_login_at => Time.now-1.hour)
        @chain_mail.keep_sending?.should == true
      end

      it "should store which and when last email was sent" do
        @chain_mail_type.execution_conditions = {"conditions" => [ChainMailType::LINK_CLICKED], "type" => ChainMailType::STOP_IF, "operator" => nil}
        @chain_mail_type.save; @chain_mail_type.reload

        @chain_mail = ChainMail.make!(:chain_mail_type => @chain_mail_type)

        # tomorrow
        set_time(Time.now+1.day)
        Delayed::Worker.new.work_off
        @chain_mail.reload
        @chain_mail.last_mail_sent_at.to_date.should == Time.now.to_date
        @chain_mail.last_mail_position.should == 1

        # day after tomorrow
        set_time(Time.now+1.day)
        Delayed::Worker.new.work_off
        @chain_mail.reload
        @chain_mail.last_mail_sent_at.to_date.should == Time.now.to_date
        @chain_mail.last_mail_position.should == 2
      end

    end
  end

  context "survey chain mail types" do
    before(:each) do
      setup_chain_mail_types(SurveyChainMailType)
      @creator = User::Admin.make!
      @survey = Survey.make!(:creator => @creator, :owner => @creator)
    end

    it "should behave correctly for condition 'send if survey not opened'" do
      @survey_recipient = @survey.create_survey_recipient(User::Supplier.make!)
      @chain_mail_type.execution_conditions = {"conditions" => [ChainMailType::SURVEY_NOT_OPENED], "type" => ChainMailType::SEND_IF, "operator" => nil}
      @chain_mail_type.save; @chain_mail_type.reload

      # ===========================
      # part 1: condition not met
      # ===========================

      @chain_mail = ChainMail.make!(:chain_mail_type => @chain_mail_type, :chain_mailable => @survey_recipient, :email => @survey_recipient.email)

      # tomorrow
      set_time(Time.now+1.day)
      Delayed::Worker.new.work_off

      # first email sent
      @chain_mail.reload
      @chain_mail.delayed_jobs.count.should == 3

      @survey_recipient.visited!

      # day after tomorrow
      set_time(Time.now+1.day)
      @chain_mail.keep_sending?.should == false
      Delayed::Worker.new.work_off

      # condition not met, all remaining emails in chain deleted
      ChainMail.count.should == 0
      Delayed::Job.count.should == 0


      # ===========================
      # part 2: condition met
      # ===========================
      reset_time
      @survey_recipient = @survey.create_survey_recipient(User::Supplier.make!)
      @chain_mail2 = ChainMail.make!(:chain_mail_type => @chain_mail_type, :chain_mailable => @survey_recipient, :email => @survey_recipient.email)

      # tomorrow
      set_time(Time.now+1.day)
      Delayed::Worker.new.work_off

      # first email sent
      @chain_mail2.reload
      @chain_mail2.delayed_jobs.count.should == 3

      # day after tomorrow with survey not opened
      set_time(Time.now+1.day)
      @chain_mail2.keep_sending?.should == true
      Delayed::Worker.new.work_off

      # next email is sent
      @chain_mail2.reload
      @chain_mail2.delayed_jobs.count.should == 2
    end

    it "should behave correctly for condition 'send if survey incomplete'" do
      @survey_recipient = @survey.create_survey_recipient(User::Supplier.make!)
      @chain_mail_type.execution_conditions = {"conditions" => [ChainMailType::SURVEY_INCOMPLETE], "type" => ChainMailType::SEND_IF, "operator" => nil}
      @chain_mail_type.save; @chain_mail_type.reload

      # ===========================
      # part 1: condition not met
      # ===========================

      @chain_mail = ChainMail.make!(:chain_mail_type => @chain_mail_type, :chain_mailable => @survey_recipient, :email => @survey_recipient.email)

      # tomorrow
      set_time(Time.now+1.day)
      Delayed::Worker.new.work_off

      # first email sent
      @chain_mail.reload
      @chain_mail.delayed_jobs.count.should == 3

      # day after tomorrow
      set_time(Time.now+1.day)
      @chain_mail.keep_sending?.should == false
      Delayed::Worker.new.work_off

      # condition not met, all remaining emails in chain deleted
      ChainMail.count.should == 0
      Delayed::Job.count.should == 0


      # ===========================
      # part 2: condition met
      # ===========================
      reset_time
      @survey_recipient = @survey.create_survey_recipient(User::Supplier.make!)
      @chain_mail2 = ChainMail.make!(:chain_mail_type => @chain_mail_type, :chain_mailable => @survey_recipient, :email => @survey_recipient.email)

      # tomorrow
      set_time(Time.now+1.day)
      Delayed::Worker.new.work_off

      # first email sent
      @chain_mail2.reload
      @chain_mail2.delayed_jobs.count.should == 3

      @survey_recipient.visited!

      # day after tomorrow with survey not opened
      set_time(Time.now+1.day)
      @chain_mail2.keep_sending?.should == true
      Delayed::Worker.new.work_off

      # next email is sent
      @chain_mail2.reload
      @chain_mail2.delayed_jobs.count.should == 2
    end

    it "should behave correctly for condition 'send if survey complete'" do
      @survey_recipient = @survey.create_survey_recipient(User::Supplier.make!)
      @chain_mail_type.execution_conditions = {"conditions" => [ChainMailType::SURVEY_COMPLETE], "type" => ChainMailType::SEND_IF, "operator" => nil}
      @chain_mail_type.save; @chain_mail_type.reload

      # ===========================
      # part 1: condition not met
      # ===========================

      @chain_mail = ChainMail.make!(:chain_mail_type => @chain_mail_type, :chain_mailable => @survey_recipient, :email => @survey_recipient.email)

      # tomorrow
      set_time(Time.now+1.day)
      Delayed::Worker.new.work_off

      # first email sent
      @chain_mail.reload
      @chain_mail.delayed_jobs.count.should == 3

      # day after tomorrow
      set_time(Time.now+1.day)
      @chain_mail.keep_sending?.should == false
      Delayed::Worker.new.work_off

      # condition not met, all remaining emails in chain deleted
      ChainMail.count.should == 0
      Delayed::Job.count.should == 0


      # ===========================
      # part 2: condition met
      # ===========================
      reset_time
      @survey_recipient = @survey.create_survey_recipient(User::Supplier.make!)
      @chain_mail2 = ChainMail.make!(:chain_mail_type => @chain_mail_type, :chain_mailable => @survey_recipient, :email => @survey_recipient.email)

      # tomorrow
      set_time(Time.now+1.day)
      Delayed::Worker.new.work_off

      # first email sent
      @chain_mail2.reload
      @chain_mail2.delayed_jobs.count.should == 3

      @survey_recipient.completed!

      # day after tomorrow with survey not opened
      set_time(Time.now+1.day)
      @chain_mail2.keep_sending?.should == true
      Delayed::Worker.new.work_off

      # next email is sent
      @chain_mail2.reload
      @chain_mail2.delayed_jobs.count.should == 2
    end

    it "should behave correctly for condition 'send if survey not open OR survey complete'" do
      @survey_recipient = @survey.create_survey_recipient(User::Supplier.make!)
      @chain_mail_type.execution_conditions = {"conditions" => [ChainMailType::SURVEY_NOT_OPENED, ChainMailType::SURVEY_COMPLETE], "type" => ChainMailType::SEND_IF, "operator" => ChainMailType::OR}
      @chain_mail_type.save; @chain_mail_type.reload

      # ===========================
      # part 1: condition not met
      # ===========================

      @chain_mail = ChainMail.make!(:chain_mail_type => @chain_mail_type, :chain_mailable => @survey_recipient, :email => @survey_recipient.email)

      # tomorrow
      set_time(Time.now+1.day)
      Delayed::Worker.new.work_off

      # first email sent
      @chain_mail.reload
      @chain_mail.delayed_jobs.count.should == 3

      @survey_recipient.visited!

      # day after tomorrow
      set_time(Time.now+1.day)
      @chain_mail.keep_sending?.should == false
      Delayed::Worker.new.work_off

      # condition not met, all remaining emails in chain deleted
      ChainMail.count.should == 0
      Delayed::Job.count.should == 0


      # ===========================
      # part 2: condition met
      # ===========================
      reset_time
      @survey_recipient = @survey.create_survey_recipient(User::Supplier.make!)
      @chain_mail2 = ChainMail.make!(:chain_mail_type => @chain_mail_type, :chain_mailable => @survey_recipient, :email => @survey_recipient.email)

      # tomorrow
      set_time(Time.now+1.day)
      Delayed::Worker.new.work_off

      # first email sent
      @chain_mail2.reload
      @chain_mail2.delayed_jobs.count.should == 3

      @survey_recipient.completed!

      # day after tomorrow with survey not opened
      set_time(Time.now+1.day)
      @chain_mail2.keep_sending?.should == true
      Delayed::Worker.new.work_off

      # next email is sent
      @chain_mail2.reload
      @chain_mail2.delayed_jobs.count.should == 2
    end
  end

  context "general" do
    before(:each) do
      Delayed::Worker.delay_jobs = true
      @time = Time.now
    end

    it "should add custom email template signature to chain mail body if present" do
      @email_template_signature = EmailTemplateSignature.create(:name => "Custom signature", :body => "Magnificent signature for any mail")
      @chain_mail_type = CampaignChainMailType.make!(:email_template_signature => @email_template_signature)
      @chain_mail_type.chain_mail_items.first.update_attributes(:subject => "Awesome chain mail", :body => "Awesome body of that chain mail")
      @chain_mail_type.reload

      @chain_mail = ChainMail.make!(:chain_mail_type => @chain_mail_type)

      set_time(Time.now+1.day)
      Delayed::Worker.new.work_off

      email = ActionMailer::Base.deliveries.detect { |e| e.subject == "Awesome chain mail" }

      email.body.should include("Awesome body of that chain mail")
      email.body.should include("Magnificent signature for any mail")
    end
  end
end