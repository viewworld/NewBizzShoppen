require 'spec_helper'

describe 'Upgrade contact to lead after survey completion' do
  include_context 'request specs context'

  let(:call_centre_email) { 'call_centre_test@example.com' }
  let(:call_centre_user) { User.find_by_email(call_centre_email) }

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
    # I sign in as call_centre_test@example.com
    # I click Tele subtab of Campaigns
    # I click New campaign
    # I fill in Name with My test campaign
    # I click Create
    # I click Create contact
    # I fill in Name with Awesome company (company info section)
    # I fill in Company phone with 24124324324
    # I fill in Address line 1,  Address line 2,  Address line 3, Zip code, City
    # I select Denmark from Country
    # I fill in Name with John Doe
    # I fill in Email address with john.doe@example.com
    # I fill in phone number with 23123213131
    # I click Create
    # I click Manage results types
    # I check Upgraded to lead within Final results
    # I click Assign results type to campaign
    # I click Lists subtab of Campaigns
    # I click New list
    # I fill in Name with My list
    # I fill in Owner email with call_centre_test@example.com
    # I select My test campaign from autocompleter as source
    # I click Create
    # [In the background the delayed job adds the contact to list]
    # I click Team tab
    # I click Create agent
    # I fill in First name with Bob, Last name with Brown, Address line 1, city, Zip code, Email with bob.brown@example.com, Password, Password confirmation
    # I check Don’t verify email address
    # I click Create agent
    # I click Surveys subtab of Campaigns
    # I click New survey
    # I fill in name with My survey
    # I select My lists from All lists
    # I click Add
    # I select Awesome leads from All categories
    # I click Add
    # I check Upgrade contacts to leads upon survey completion
    # I select bob.brown@example.com from Lead creator
    # I click Save
    # I edit My survey
    # I click Setup survey
    # I drag & drop Text onto Questions droparea
    # I fill in title with What’s your name?
    # I click Create
    # I click Send survey
    # I confirm my choice
    # I log out

    #
    # Not logged in user fills out the survey by clicking link from email
    # I go to unique survey link from email
    # I fill in What’s your name with John Doe
    # I click Submit

    #
    # New lead created in Awesome leads category
    # I go to fairleads.com
    # I sign in as admin
    # I click Categories tab
    # I uncheck Unique
    # I click Search
    # I click Awesome leads
    # I click View leads
    # I should see My survey
  end
end
