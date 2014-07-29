# encoding: UTF-8
# require 'spec_helper'

describe 'Upgrade contact to lead after survey completion' do
  include_context 'request specs context'

  before do
    allow_any_instance_of(Campaign).to receive(:check_email_templates).and_return(true)
    create(:email_template, :global, :uniq_id => 'survey_newsletter')
  end

  let(:call_centre_email) { 'call_centre_test@example.com' }
  let(:call_centre_user) { User.find_by_email(call_centre_email) }
  let(:category) { Category.last }
  let(:campaign) { Campaign.last }
  let(:survey) { Survey.last }
  let!(:upgraded_to_lead_result) { Result.make!(:final, :name => 'Upgraded to lead', :generic => true) }
  let(:survey_recipient) { SurveyRecipient.last }

  it 'Contact is upgraded to lead after the completion of survey created by call centre' do
    # https://github.com/Selleo/NewBizzShoppen/wiki/Critical-Path-%22Upgrade-contact-to-lead-after-survey-completion%22
    #
    # Call centre creation by admin
    # I go to fairleads.com
    get '/'
    expect(response).to render_template('supplier_home/guest')

    # I sign in as admin
    post '/users/sign_in', {:user => {:email => admin.email, :password => 'secret'}}
    follow_with_redirect '/administration'

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

    # I click Categories
    body_has_to(:have_link, 'Browse leads', :href => '/categories')
    get '/categories'
    expect(response).to be_success

    # I click New category
    body_has_to(:have_link, 'New category', :href => '/administration/categories/new?category_type=LeadCategory')
    get '/administration/categories/new?category_type=LeadCategory'

    # I fill in name with Awesome leads
    # I select DKK from Currency
    fields = {'category[name]' => 'Awesome leads',
              'category[currency_id]' => currency.id}

    body_include_fields fields
    body_has_to(:have_button, 'category_submit')

    # I click Create
    expect { post('/administration/categories', fields) }.to change(Category, :count).by(1)
    has_flash 'Category was successfully created.'

    # I logout
    logout

    #
    # Campaign, newsletter list & survey creation
    # I go to faircalls.dk
    with_site 'faircalls'
    get '/'
    expect(response).to render_template('supplier_home/guest')

    # I sign in as call_centre_test@example.com
    post '/users/sign_in', {:user => {:email => call_centre_email, :password => 'secret'}}
    follow_with_redirect '/agent_home'
    has_flash 'Signed in successfully.'

    # I click Tele subtab of Campaigns
    body_has_to(:have_link, 'Campaigns', :href => '#', :tab => 'campaigns')
    body_has_to(:have_link, 'Tele', :href => '/callers/campaigns', :subtab => 'campaigns')
    get '/callers/campaigns'

    # I click New campaign
    body_has_to(:have_link, 'New Campaign', :href => 'javascript:void', :onclick => %q($('#form_new_campaign').submit()))
    get '/callers/campaigns/new'

    # I fill in Name with My test campaign
    fields = { 'campaign[name]' => 'My test campaign',
               'campaign[category_id]' => category.id,
               'campaign[country_id]' => country.id,
               'campaign[currency_id]' => currency.id,
               'campaign[state]' => 'active',
               'campaign[import_contacts_from_lists_enabled]' => '0',
               'campaign[sync_with_campaign_source]' => '0',
               'campaign[contact_pool_type]' => '1',
               'campaign[max_contact_number]' => '0',
               'campaign[cost_type]' => '4',
               'campaign[crm_option]' => '0',
               'campaign[auto_dialer]' => '0' }

    body_include_fields fields
    body_has_to(:have_button, 'campaign_submit')

    # I click Create
    expect { post('/callers/campaigns', fields) }.to change(Campaign, :count).by(1)
    follow_with_redirect "/callers/campaigns/#{campaign.id}/edit"
    has_flash 'Campaign was successfully created.'

    # I click Create contact
    body_has_to(:have_link, 'Create contact', :href => "/callers/campaigns/#{campaign.id}/contacts/new")
    get "/callers/campaigns/#{campaign.id}/contacts/new"

    # I fill in Name with Awesome company (company info section)
    # I fill in Company phone with 24124324324
    # I fill in Address line 1,  Address line 2,  Address line 3, Zip code, City
    # I select Denmark from Country
    # I fill in Name with John Doe
    # I fill in Email address with john.doe@example.com
    # I fill in phone number with 23123213131
    fields = { 'contact[company_name]' => 'Awesome Company',
               'contact[company_phone_number]' => '345345123',
               'contact[address_line_1]' => 'AddressLine1',
               'contact[address_line_2]' => 'AddressLine2',
               'contact[address_line_3]' => 'City',
               'contact[zip_code]' => 'ZipCode',
               'contact[country_id]' => country.id,
               'contact[contact_name]' => 'John Doe',
               'contact[phone_number]' => '123456123123',
               'contact[email_address]' => 'john.doe@example.com' }
    body_include_fields fields

    # I click Create
    body_has_to(:have_button, 'contact_submit')
    expect { post("/callers/campaigns/#{campaign.id}/contacts", fields) }.to change(Contact, :count).by(1)
    follow_with_redirect "/callers/campaigns/#{campaign.id}/edit"
    has_flash 'Contact was successfully created.'

    # I click Manage results types
    body_has_to(:have_link, 'Manage result types', :href => "/callers/campaigns/#{campaign.id}/results")
    get "/callers/campaigns/#{campaign.id}/results"

    # I check Upgraded to lead within Final results
    body_has_to(:include, 'Final results')
    body_has_to(:have_unchecked_field, 'campaign_result_ids[]')
    body_has_to(:include, 'Upgraded to lead')

    # I click Assign results type to campaign
    expect { post("/callers/campaigns/#{campaign.id}/results/batch_assign", 'campaign_result_ids[]' => upgraded_to_lead_result.id) }.to change(CampaignsResult, :count).by(1)
    follow_with_redirect "/callers/campaigns/#{campaign.id}/edit"

    # I click Lists subtab of Campaigns
    body_has_to(:have_link, 'Campaigns', :href => '#', :tab => 'campaigns')
    body_has_to(:have_link, 'Lists', :href => '/newsletters/newsletter_lists', :subtab => 'newsletter_lists')
    get '/newsletters/newsletter_lists'

    # I click New list
    body_has_to(:have_link, 'New list', :href => '/newsletters/newsletter_lists/new')
    get '/newsletters/newsletter_lists/new'

    # I fill in Name with My list
    # I fill in Owner email with call_centre_test@example.com
    # I select My test campaign from autocompleter as source
    fields = { 'newsletter_list[name]' => 'My list',
               'newsletter_list[owner_email]' => call_centre_email,
               'newsletter_list[synch_with_sources]' => '1'}
    body_include_fields fields

    # I click Create
    # [In the background the delayed job adds the contact to list]
    expect { post('/newsletters/newsletter_lists', fields.merge('newsletter_list[sourceable_items][]' => "Campaign_#{campaign.id}")) }.to change(NewsletterList, :count).by(1)
    follow_with_redirect '/newsletters/newsletter_lists'
    has_flash 'Newsletter list was successfully created.'

    # I click Team tab
    body_has_to(:have_link, 'Team', :href => '/call_centres/call_centre_agents', :tab => 'call_centre_agents')
    get '/call_centres/call_centre_agents'

    # I click Create agent
    body_has_to(:have_link, 'Create agent', '/call_centres/call_centre_agents/new')
    get '/call_centres/call_centre_agents/new'

    # I fill in First name with Bob, Last name with Brown, Address line 1, city, Zip code,
    # Email with bob.brown@example.com, Password, Password confirmation
    # I check Don’t verify email address
    fields = { 'user_call_centre_agent[first_name]' => 'Bob',
               'user_call_centre_agent[last_name]' => 'Brown',
               'user_call_centre_agent[address_attributes][address_line_1]' => 'AddressLine1',
               'user_call_centre_agent[address_attributes][address_line_3]' => 'City',
               'user_call_centre_agent[address_attributes][zip_code]' => 'ZipCode',
               'user_call_centre_agent[address_attributes][country_id]' => '1',
               'user_call_centre_agent[email]' => 'bob.brown@example.com',
               'user_call_centre_agent[skip_email_verification]' => '1',
               'user_call_centre_agent[password]' => 'secret',
               'user_call_centre_agent[password_confirmation]' => 'secret' }

    body_include_fields fields

    # I click Create agent
    body_has_to(:have_button, 'user_call_centre_agent_submit')
    expect { post('/call_centres/call_centre_agents', fields.merge('user_call_centre_agent[agreement_read]' => '1')) }.to change(User::CallCentreAgent, :count).by(1)
    has_flash 'Call centre agent has been created successfully!'
    follow_with_redirect '/call_centres/call_centre_agents'

    # I click Surveys subtab of Campaigns
    body_has_to(:have_link, 'Campaigns', :href => '#', :tab => 'campaigns')
    body_has_to(:have_link, 'Surveys', :href => '/surveys_management/surveys', :subtab => 'surveys')
    get '/surveys_management/surveys'

    # I click New survey
    body_has_to(:have_link, 'New survey', :href => '/surveys_management/surveys/new')
    expect { get '/surveys_management/surveys/new' }.to change(Survey, :count).by(1)
    follow_with_redirect '/surveys_management/surveys/1/edit'

    # I fill in name with My survey
    # I select My lists from All lists
    # I click Add
    # I select Awesome leads from All categories
    # I click Add
    # I check Upgrade contacts to leads upon survey completion
    # I select bob.brown@example.com from Lead creator
    fields = { 'survey[name]' => 'My Survey',
               'survey_link' => 'http://erhvervsanalyse.dk/s/1b93fb4d1fd9',
               'survey[owner_email]' => call_centre_email,
               'survey[newsletter_list_ids][]' => [1],
               'survey[campaign_ids][]' => [1],
               'survey[category_ids][]' => [1],
               'survey[upgrade_contacts_to_leads]' => '1',
               'survey[lead_creator_id]' => User::CallCentreAgent.last.id }

    body_include_fields fields
    body_has_to(:have_button, 'survey_submit')

    # I click Save
    put '/surveys_management/surveys/1', fields
    follow_with_redirect '/surveys_management/surveys'

    # I edit My survey
    body_has_to(:have_link, 'Edit', :href => '/surveys_management/surveys/1/edit')
    get '/surveys_management/surveys/1/edit'

    # I click Setup survey
    body_has_to(:have_link, 'Setup survey', :href => '/surveys_management/surveys/1/setup')
    get '/surveys_management/surveys/1/setup'

    # I drag & drop Text onto Questions droparea

    # I fill in title with What’s your name?
    fields = { 'survey_question[title]' => "What's your name?",
               'survey_question[question_type]' => 1,
               'survey_question[tmp_position]' => 1 }
    # I click Create
    expect { xhr :post, '/surveys_management/surveys/1/survey_questions', fields }.to change(SurveyQuestion, :count).by(1)
    get '/surveys_management/surveys/1/setup'

    # I click Send survey
    body_has_to(:have_link, 'Send to newsletters',
                # I confirm my choice
                :'data-confirm' => %q(Are you sure to send My survey survey to 1 newsletter subscribers?),
                :'data-method' => 'post',
                :href => '/surveys_management/surveys/1/send_to_newsletters')
    expect { post '/surveys_management/surveys/1/send_to_newsletters' }.to change(ApplicationMailer.deliveries, :count).by(1)
    has_flash 'Survey has been queued for sending to newsletter lists'

    # I log out
    logout '/agent_home'

    #
    # Not logged in user fills out the survey by clicking link from email
    # I go to unique survey link from email
    with_site 'erhvervsanalyse'
    get survey_recipient.survey_link
    expect(response).to be_success

    # I fill in What’s your name with John Doe
    fields = { 'survey_recipient[survey_answers_attributes][0][value]' => 'John Doe' }
    body_include_fields fields
    body_has_to(:include, survey_recipient_path(survey_recipient.uuid))
    body_has_to(:include, 'My Survey')

    # I click Submit
    question_opts = { 'survey_recipient[survey_answers_attributes][0][survey_question_id]' => SurveyQuestion.last.id,
                      'survey_recipient[survey_answers_attributes][0][question_type]' => 1 }
    body_has_to(:have_button, 'survey_recipient_submit')
    put survey_recipient_path(survey_recipient.uuid), fields.merge(question_opts)
    body_has_to(:include, 'My Survey')
    body_has_to(:include, 'Thank You for the answers!')

    #
    # New lead created in Awesome leads category
    with_site 'fairleads'
    get '/'
    expect(response).to render_template('supplier_home/guest')

    # I sign in as admin
    post '/users/sign_in', {:user => {:email => admin.email, :password => 'secret'}}
    follow_with_redirect '/administration'

    # I click Categories tab
    body_has_to(:have_link, 'Browse leads', :href => '/categories')
    get '/categories'
    expect(response).to be_success

    # I uncheck Unique
    body_has_to(:have_checked_field, 'search_with_unique')

    # I click Search
    body_has_to(:have_button, 'Search')
    get '/categories', 'search[with_unique]' => false

    # I click Awesome leads
    body_has_to(:include, 'Awesome leads')
    # I click View leads
    body_has_to(:have_link, 'View leads', :href => '/categories/awesome-leads?search[with_category]=1')
    get '/categories/awesome-leads?search[with_category]=1'

    # I should see My survey
    body_has_to(:include, 'My Survey')

    # I logout
    logout
  end
end
