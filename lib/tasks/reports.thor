class Reports < Thor
  require File.expand_path('config/environment.rb')

  #::Usage::
  #When parameter is not specified then default is loaded
  #thor reports:create --campaigns 800 --users 10 --contacts 60 --spent 20

  desc "create", ""

  method_options :campaigns => 10, :users => 5, :contacts => 10, :spent => 20, :results => 10, :upgraded => 12
  def create
    require "spec/support/blueprints"
    puts "RAPORT#create"
    puts "campaigns: #{options[:campaigns]}, users per campaign: #{options[:users]}, contacts per user in campaign: #{options[:contacts]}, hours spent per user: #{options[:spent]}"

    @currency = Currency.euro

    email = "call_centre_test#{Time.now.to_i}@nbs.com"
    @call_centre = User::CallCentre.make!(:email => email, :screen_name => email, :password => "secret", :password_confirmation => "secret")

    1.upto(options[:users]) do |i|
      email = "cca_test#{i}_#{@call_centre.email}"
      @call_centre_agent = User::CallCentreAgent.make!(:email => email, :screen_name => email, :password => "secret", :password_confirmation => "secret", :currency => @currency, :billing_rate => 10.0)
      @call_centre.subaccounts << @call_centre_agent
    end

    @call_centre.save

    @results = Result.where(:generic => true)

    campaign_name_prefix = "CampaignTest#{Time.now.to_i} #"
    1.upto(options[:campaigns]) do |i|
      @campaign = Campaign.make!(:creator => @call_centre, :currency => @currency, :success_rate => 94, :name => "#{campaign_name_prefix}#{i}",
                                 :cost_type => Campaign::AGENT_BILLING_RATE_COST, :max_contact_number => options[:contacts])
      @campaign.users = [@call_centre] + @call_centre.subaccounts
      @campaign.results = @results
      @campaign.save
      @call_centre.subaccounts.each do |agent|
        1.upto(options[:contacts]) do |i|
          @contact = Contact.make!(:campaign => @campaign, :agent_id => agent.id)
        end
      end
    end
  end
end