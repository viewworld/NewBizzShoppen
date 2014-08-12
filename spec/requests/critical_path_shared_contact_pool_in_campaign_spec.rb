# encoding: UTF-8
require 'spec_helper'

describe 'Critical Path Autobuy for category suppliers' do
  include_context 'request specs context'

  before do
    SubscriptionPlan.make!
    allow_any_instance_of(Campaign).to receive(:check_email_templates).and_return(true)
    allow_any_instance_of(Campaign).to receive(:update_email_templates).and_return(true)
    allow(Domain).to receive(:for_site_and_locale).and_return(double(:name_for_env => 'faircalls'))
    Result.make!(:final, :name => 'Call back', :generic => true)
  end

  let(:call_centre_email) { 'call_centre_test@example.com' }
  let(:call_centre_user) { User.find_by_email(call_centre_email) }
  let!(:lead_category) { LeadCategory.make! }
  let(:campaign_name) { 'Test Campaign' }
  let(:campaign) { Campaign.find_by_name(campaign_name) }
  let(:campaign_id) { campaign.id }
  let(:subaccounts) { campaign.creator.subaccounts }
  let!(:not_interested_result) { Result.make!(:final, :name => 'Not interested', :generic => true) }

  it 'shared contact pool in campaign' do
    # Admin can create a call centre which can create a new campaign and call centre agents
    # that can work on contacts assigned to them dynamically from shared pool.

    #
    # Call centre creation by admin
    # I go to fairleads.com
    get '/'
    expect(response).to render_template('supplier_home/guest')

    # I sign in as admin
    post '/users/sign_in', {:user => {:email => admin.email, :password => 'secret'}}
    follow_with_redirect '/administration'
    expect(response).to be_success

    # I click on Users tab
    body_has_to(:have_link, 'Users', :href => '/administration/users')
    get '/administration/users'
    expect(response).to be_success

    # I select Call Centre from Roles
    body_has_to(:have_select, 'role', :with_options => ['Call Centre'])
    body_has_to(:have_link, 'New user', :onsubmit => "$('#form_new_user').submit()")

    # I click New User
    get '/administration/users/new?role=call_centre'

    # I fill in company name with Test Call Company, Address line 1, City, Zip code, Bank address line 1, Bank address City, Bank address zip code, Bank Country, Password, Password Confirmation, Email with call_centre_test@example.com
    fields = {'user_call_centre[company_name]' => 'Selleo Call Centre',
              'user_call_centre[company_ean_number]' => '123 4321',
              'user_call_centre[address_attributes][address_line_1]' => 'ul. Kamińskiego 19',
              'user_call_centre[address_attributes][address_line_2]' => 'Room 203',
              'user_call_centre[address_attributes][address_line_3]' => 'Bielsko-Biała',
              'user_call_centre[address_attributes][zip_code]' => '43-300',
              'user_call_centre[address_attributes][country_id]' => country.id,
              'user_call_centre[address_attributes][region_id]' => '',
              'user_call_centre[time_zone]' => 'UTC',
              'user_call_centre[can_edit_payout_information]' => '0',
              'user_call_centre[paypal_email]' => call_centre_email,
              'user_call_centre[bank_swift_number]' => '',
              'user_call_centre[bank_iban_number]' => '',
              'user_call_centre[bank_name]' => '',
              'user_call_centre[bank_address_attributes][address_line_1]' => 'ul. Black St 88',
              'user_call_centre[bank_address_attributes][address_line_2]' => '',
              'user_call_centre[bank_address_attributes][address_line_3]' => 'Bielsko-Biała',
              'user_call_centre[bank_address_attributes][zip_code]' => '43-300',
              'user_call_centre[bank_address_attributes][country_id]' => country.id,
              'user_call_centre[bank_address_attributes][region_id]' => '',
              'user_call_centre[phone]' => '48123123123',
              'user_call_centre[direct_phone_number]' => '48123123123',
              'user_call_centre[email]' => call_centre_email,
              'user_call_centre[pnumber]' => '',
              'user_call_centre[nnmid]' => '',
              'user_call_centre[custom_1]' => '',
              'user_call_centre[custom_2]' => '',
              'user_call_centre[custom_3]' => '',
              'user_call_centre[custom_4]' => '',
              'user_call_centre[custom_5]' => '',
              'user_call_centre[newsletter_on]' => '0',
              'user_call_centre[test_account]' => '0',
              'user_call_centre[certification_level]' => '1',
              'user_call_centre[skip_email_verification]' => '1',
              'user_call_centre[deal_maker_role_enabled]' => '0',
              'user_call_centre[billing_rate]' => '',
              'user_call_centre[currency_id]' => '',
              'user_call_centre[password]' => 'secret',
              'user_call_centre[password_confirmation]' => 'secret',
              'user_call_centre[unique_category_ids][]' => ''}

    body_include_fields fields

    # I press Save
    expect { post '/administration/users?role=call_centre', fields }.to change(User::CallCentre, :count).by(1)
    follow_with_redirect '/administration/users'
    has_flash 'User has been created successfuly'

    # I logout
    logout

    #
    # Team & campaign setup by call centre
    # I go to faircalls.com
    with_site 'faircalls'

    get '/'
    expect(response).to render_template('supplier_home/guest')

    # I sign in as call_centre_test@example.com
    post '/users/sign_in', {:user => {:email => call_centre_email, :password => 'secret'}}
    follow_with_redirect '/agent_home'
    expect(response).to be_success
    has_flash 'Signed in successfully.'

    # I click Team tab
    body_has_to(:have_link, 'Team', :href => '/call_centres/call_centre_agents')
    get '/call_centres/call_centre_agents'

    # I click Create agent
    body_has_to(:have_link, 'Create agent', :href => '/call_centres/call_centre_agents/new')
    get '/call_centres/call_centre_agents/new'

    # I fill in First name with Bob, Last name with Brown, Address line 1, city, Zip code, Email
    # with bob.brown@example.com, Password, Password confirmation

    fields = {'user_call_centre_agent[first_name]' => 'Bob',
              'user_call_centre_agent[last_name]' => 'Brown',
              'user_call_centre_agent[address_attributes][address_line_1]' => 'Black St 20',
              'user_call_centre_agent[address_attributes][address_line_2]' => '',
              'user_call_centre_agent[address_attributes][address_line_3]' => 'Bielsko-Biała',
              'user_call_centre_agent[address_attributes][zip_code]' => '43-300',
              'user_call_centre_agent[address_attributes][country_id]' => '1',
              'user_call_centre_agent[address_attributes][region_id]' => '1',
              'user_call_centre_agent[phone]' => '48123123123',
              'user_call_centre_agent[mobile_phone]' => '48123123123123',
              'user_call_centre_agent[email]' => 'bob.brown@example.com',
              'user_call_centre_agent[department]' => '',
              # I check Don’t verify email address
              'user_call_centre_agent[skip_email_verification]' => '1',
              'user_call_centre_agent[password]' => 'secret',
              'user_call_centre_agent[password_confirmation]' => 'secret' }

    body_include_fields fields
    body_has_to(:have_button, 'Create')

    # I press Create
    expect { post '/call_centres/call_centre_agents', fields.merge({'user_call_centre_agent[agreement_read]' => '1'}) }.to change(User::CallCentreAgent, :count).by(1)
    follow_with_redirect '/call_centres/call_centre_agents'
    has_flash 'Call centre agent has been created successfully!'

    # I click Create agent
    body_has_to(:have_link, 'Create agent', :href => '/call_centres/call_centre_agents/new')
    get '/call_centres/call_centre_agents/new'

    # I fill in First name with Alice, Last name with Smith, Address line 1, city, Zip code, Email
    # with alice.smith@example.com, Password, Password confirmation
    fields = {'user_call_centre_agent[first_name]' => 'Alice',
              'user_call_centre_agent[last_name]' => 'Smith',
              'user_call_centre_agent[address_attributes][address_line_1]' => 'White St 20',
              'user_call_centre_agent[address_attributes][address_line_2]' => '',
              'user_call_centre_agent[address_attributes][address_line_3]' => 'Bielsko-Biała',
              'user_call_centre_agent[address_attributes][zip_code]' => '43-300',
              'user_call_centre_agent[address_attributes][country_id]' => '1',
              'user_call_centre_agent[address_attributes][region_id]' => '1',
              'user_call_centre_agent[phone]' => '48134534534',
              'user_call_centre_agent[mobile_phone]' => '48123456456453',
              'user_call_centre_agent[email]' => 'alice.smith@example.com',
              'user_call_centre_agent[department]' => '',
              # I check Don’t verify email address
              'user_call_centre_agent[skip_email_verification]' => '1',
              'user_call_centre_agent[password]' => 'secret',
              'user_call_centre_agent[password_confirmation]' => 'secret' }

    body_include_fields fields
    body_has_to(:have_button, 'Create')

    # I press Create
    expect { post '/call_centres/call_centre_agents', fields.merge({'user_call_centre_agent[agreement_read]' => '1'}) }.to change(User::CallCentreAgent, :count).by(1)
    follow_with_redirect '/call_centres/call_centre_agents'
    has_flash 'Call centre agent has been created successfully!'

    # I click Tele subtab of Campaigns
    body_has_to(:have_link, 'Campaigns', :href => '#', :tab => 'campaigns')
    body_has_to(:have_link, 'Tele', :href => '/callers/campaigns', :subtab => 'campaigns')
    get '/callers/campaigns'

    # I click New Campaign
    body_has_to(:have_link, 'New Campaign', :href => 'javascript:void', :onclick => "$('#form_new_campaign').submit()")
    get '/callers/campaigns/new'

    # I fill in name with Test campaign
    fields = {
      'campaign[name]' => campaign_name,
      'campaign[category_id]' => lead_category.id,
      'campaign[country_id]' => country.id,
      'campaign[currency_id]' => currency.id,
      'campaign[state]' => 'active',
      'campaign[import_contacts_from_lists_enabled]' => '0',
      'campaign[sync_with_campaign_source]' => '0',
      # I check Shared contact pool
      'campaign[contact_pool_type]' => '1',
      'campaign[max_contact_number]' => '0',
      'campaign[cost_type]' => '4',
      'campaign[crm_option]' => '0',
      'campaign[auto_dialer]' => '0'
    }

    body_include_fields fields

    # I press Create
    expect { post '/callers/campaigns', fields }.to change(Campaign, :count).by(1)
    has_flash 'Campaign was successfully created.'

    # I should be on Test campaign edit page
    follow_with_redirect "/callers/campaigns/#{campaign_id}/edit"

    # I click Agent assignment
    body_has_to(:have_link, 'Agent assignment', :href => "/callers/campaigns/#{campaign_id}/campaigns_users")
    get "/callers/campaigns/#{campaign_id}/campaigns_users"

    # I click Select all in call centre
    body_has_to(:have_link, '(select all in call centre)', :href => '#')

    subaccounts.each do |agent|
      body_has_to(:include, agent.full_name)
      body_has_to(:have_unchecked_field, "campaign_user_id_#{agent.id}")
    end

    body_has_to(:have_checked_field, 'campaign_user_ids[]')
    body_has_to(:have_link, 'Assign users to campaign', :href => 'javascript:void(0)', :onclick => "$('#campaign_user_form').submit();")

    # I press Assign agents to campaign
    expect { put("/callers/campaigns/#{campaign_id}/campaigns_users/bulk", 'campaign_user_ids[]' => subaccounts.map(&:id)) }.to change(CampaignsUser, :count).by(1)
    follow_with_redirect "/callers/campaigns/#{campaign_id}/edit"

    # I repeat the following steps 4 times:
    new_contact_path = "/callers/campaigns/#{campaign_id}/contacts/new"
    4.times do |i|
      # I click Create contact
      body_has_to(:have_link, 'Create contact', :href => new_contact_path)
      get new_contact_path

      fields = {'contact[contact_name]' => "Contact #{i}",
                'contact[company_name]' => "Company #{i}",
                'contact[email_address]' => "company#{i}@example.com",
                'contact[company_phone_number]' => "tel c-ph #{i}",
                'contact[country_id]' => country.id,
                'contact[direct_phone_number]' => "tel d-ph #{i}",
                'contact[phone_number]' => "tel pn #{i}"}
      body_include_fields fields

      body_has_to(:have_button, 'Create')

      # I press Create
      expect { post "/callers/campaigns/#{campaign_id}/contacts", fields }.to change(Contact, :count).by(1)
      follow_with_redirect "/callers/campaigns/#{campaign_id}/edit"
      has_flash 'Contact was successfully created.'
    end

    # I click Manage results types
    body_has_to(:have_link, 'Manage result types', :href => "/callers/campaigns/#{campaign_id}/results")
    get "/callers/campaigns/#{campaign_id}/results"

    # # I check Not interested within Final results
    body_has_to(:include, 'Final results')
    body_has_to(:have_unchecked_field, 'campaign_result_ids[]')

    # # I press Assign results type to campaign
    expect { post("/callers/campaigns/#{campaign_id}/results/batch_assign", 'campaign_result_ids[]' => not_interested_result.id) }.to change(CampaignsResult, :count).by(1)
    follow_with_redirect "/callers/campaigns/#{campaign_id}/edit"

    # # I log out
    logout '/agent_home'

    with_site 'faircalls'
    User::CallCentreAgent.scoped.each_with_index do |call_centre_agent, idx|
      Contact.order(:id).each_slice(User::CallCentreAgent.count).to_a[idx].each do |contact|
        #
        # Creation of final call result by agent
        # I sign in as call_centre_agent
        get '/'
        expect(response).to render_template('supplier_home/guest')

        # I sign in as call_centre_test@example.com
        post '/users/sign_in', {:user => {:email => call_centre_agent.email, :password => 'secret'}}
        follow_with_redirect '/agent_home'
        expect(response).to be_success
        has_flash 'Signed in successfully.'

        # I click Test campaign within first column of bottom campaigns sidebar
        body_has_to(:include, campaign.name)
        body_has_to(:have_link, 'read more', :href => "/callers/campaigns/#{campaign_id}/agent_work_screen", :class => 'read_more')
        get "/callers/campaigns/#{campaign_id}/agent_work_screen"

        # I click New Result
        body_has_to(:have_link, 'New result', :href => 'javascript:void(0)', :onclick => %q($('#result_id').val($('#selected_result_id').val());$('#new_result_form').submit()))

        xhr :get, "/callers/campaigns/#{campaign_id}/agent_work_screen/contacts/#{contact.id}/call_results/new?result_id=#{not_interested_result.id}"
        expect(response).to be_success
        body_has_to(:include, 'call_result[note]')

        # I click Create
        body_has_to(:include, 'Create')
        expect { xhr :post, "/callers/campaigns/#{campaign_id}/agent_work_screen/contacts/#{contact.id}/call_results", 'call_result[result_id]' => not_interested_result.id }.to change(CallResult, :count).by(1)
        expect(response).to be_success
        body_has_to(:include, "Not interested (#{call_centre_agent.full_name})")

        # I log out
        logout '/agent_home'
      end
    end

    #
    # No more contacts for agent Bob
    # I sign in as bob.brown@example.com
    get '/'
    expect(response).to render_template('supplier_home/guest')

    # I sign in as call_centre_test@example.com
    post '/users/sign_in', {:user => {:email => 'bob.brown@example.com', :password => 'secret'}}
    follow_with_redirect '/agent_home'
    expect(response).to be_success
    has_flash 'Signed in successfully.'
    body_has_to(:include, 'Completion: 100%')

    # I click Test campaigns within first column of bottom campaigns sidebar
    body_has_to(:include, campaign.name)
    body_has_to(:have_link, 'read more', :href => "/callers/campaigns/#{campaign_id}/agent_work_screen", :class => 'read_more')
    get "/callers/campaigns/#{campaign_id}/agent_work_screen"

    # I should see You have no contacts assigned
    body_has_to(:include, 'You have no contacts assigned')

    # I log out
    logout '/agent_home'
  end
end
