class Reports < Thor
  require File.expand_path('config/environment.rb')

  #::Usage::
  #When parameter is not specified then default is loaded
  #thor reports:create --campaigns 800 --users 10 --contacts 60 --spent 20
  #thor reports:create --campaigns 1 --users 1 --contacts 1 --spent 1 --results 1 --upgraded 1 --sold 1

  desc "create", ""

  method_options :campaigns => 10, :users => 5, :contacts => 10, :spent => 20, :results => 10, :upgraded => 12, :sold => 0
  def create
    require "spec/support/blueprints"
    puts "RAPORT#create"
    puts "campaigns: #{options[:campaigns]}, users per campaign: #{options[:users]}, contacts per user in campaign: #{options[:contacts]}, hours spent per user: #{options[:spent]}"

    @currency = Currency.euro
    @category = LeadCategory.all.detect { |c| c.can_publish_leads? } || LeadCategory.make!
    @country = Country.first || Country.make!

    email = "call_centre_test#{Time.now.to_i}@nbs.com"
    @call_centre = User::CallCentre.make!(:email => email, :password => "secret", :password_confirmation => "secret", :currency => @currency, :billing_rate => 10.0)

    puts "Generating users..."

    1.upto(options[:users]) do |i|
      email = "cca_test#{i}_#{@call_centre.email}"
      @call_centre_agent = User::CallCentreAgent.make!(:email => email, :password => "secret", :password_confirmation => "secret", :currency => @currency, :billing_rate => 10.0, :parent_id => @call_centre.id)
    end

    @result = Result.where(:is_reported => true, :is_success => true, :upgrades_to_lead => false, :final => true).first || Result.make!(:final_reported_success)
    @result_upgrades = Result.where(:is_reported => true, :is_success => true, :upgrades_to_lead => true, :final => true).first || Result.make!(:upgrades_to_lead)

    @results = [@result, @result_upgrades]

    campaign_name_prefix = "CampaignTest#{Time.now.to_i} #"
    1.upto(options[:campaigns]) do |i|
      puts "Generating ##{i} campaign..."

      @campaign = Campaign.make!(:creator => @call_centre, :currency => @currency, :success_rate => 94, :name => "#{campaign_name_prefix}#{i}",
                                 :cost_type => Campaign::AGENT_BILLING_RATE_COST, :max_contact_number => options[:contacts],
                                 :finished_contacts_per_hour => 0.07, :production_value_per_hour => 10.0, :category => @category, :country => @country)
      @campaign.results = @results
      @campaign.users = [@call_centre] + @call_centre.subaccounts
      @campaign.save
      @campaign.campaigns_results.first.update_attributes(:value => 100, :expected_completed_per_hour => 5)
      @campaign.campaigns_results.last.update_attributes(:value => 10, :expected_completed_per_hour => 3)

      @campaign.users.each do |agent|
        1.upto(options[:contacts]) do |contact_num|
          @contact = Contact.make!(:campaign => @campaign, :category_id => @campaign.category.id, :country => @campaign.country, :currency => @campaign.currency)
          @contact.assign_agent(agent.id)
        end
      end

      @campaign.users.map(&:with_role).each do |campaign_user|
        campaign_user.contacts.where(:campaign_id => @campaign.id).each do |contact|
          1.upto(options[:results]).each do |res_num|
            CallResult.make!(:contact => contact, :result => @result, :creator => campaign_user,
                             :created_at => Time.now+res_num.minutes)
          end

          all_upgraded = []

          1.upto(options[:upgraded]).each do |res_num|
            all_upgraded << CallResult.make!(:contact => contact, :result => @result_upgrades, :creator => campaign_user,
                             :created_at => Time.now+res_num.minutes)
          end

          all_upgraded.first(options[:sold]).each do |cr|
            LeadPurchase.make!(:lead_id => cr.contact.lead.id)
          end
        end

        1.upto(options[:spent]) do |hour_num|
          UserSessionLog.make!(:user => campaign_user, :campaign => @campaign, :log_type => UserSessionLog::TYPE_CAMPAIGN,
                               :start_time => Time.now+(hour_num*60).minutes,
                               :end_time => Time.now+(hour_num*60).minutes+60.minutes)
        end
      end
    end

    #claen up queued emails
    ActiveRecord::Migration.execute "DELETE FROM delayed_jobs"
  end
end