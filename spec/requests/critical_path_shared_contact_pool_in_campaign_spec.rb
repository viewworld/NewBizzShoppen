require 'spec_helper'

describe 'Critical Path Autobuy for category suppliers' do
  include_context 'request specs context'

  before do
    SubscriptionPlan.make!
  end

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
              'user_call_centre[paypal_email]' => 'newuser@example.com',
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
              'user_call_centre[email]' => 'newuser@exampl.com',
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
              'user_call_centre[skip_email_verification]' => '0',
              'user_call_centre[deal_maker_role_enabled]' => '0',
              'user_call_centre[billing_rate]' => '',
              'user_call_centre[currency_id]' => '',
              'user_call_centre[password]' => 'secret',
              'user_call_centre[password_confirmation]' => 'secret',
              'user_call_centre[unique_category_ids][]' => ''}

    body_include_fields fields

    # I press Save
    post '/administration/users?role=call_centre', fields
    follow_with_redirect '/administration/users'
    has_flash 'User has been created successfuly'

    # I logout
    logout

    #
    # Team & campaign setup by call centre
    # I go to faircalls.com
    # I sign in as call_centre_test@example.com
    # I click Team tab
    # I click Create agent
    # I fill in First name with Bob, Last name with Brown, Address line 1, city, Zip code, Email with bob.brown@example.com, Password, Password confirmation
    # I check Don’t verify email address
    # I press Create
    # I click Create agent
    # I fill in First name with Alice, Last name with Smith, Address line 1, city, Zip code, Email with alice.smith@example.com, Password, Password confirmation
    # I check Don’t verify email address
    # I press Create
    # I click Tele subtab of Campaigns
    # I click New Campaign
    # I fill in name with Test campaign
    # I check Shared contact pool
    # I press Create
    # I should be on Test campaign edit page
    # I click Agent assignment
    # I click Select all in call centre
    # I press Assign agents to campaign
    # I repeat the following steps 4 times:
    # I click Create contact
    # I fill in Company name with Test Contact Company 1
    # I fill in Company phone number with 2138921347
    # I select Denmark from Country
    # I press Create
    # I click Manage results types
    # I check Not interested within Final results
    # I press Assign results type to campaign
    # I log out

    #
    # Creation of final call result by agent Bob
    # I sign in as bob.brown@example.com
    # I click Test campaign within first column of bottom campaigns sidebar
    # I click New Result
    # I click Create
    # I log out

    #
    # Creation of final call result by agent Alice
    # I sign in as alice.smith@example.com
    # I click Test campaign within first column of bottom campaigns sidebar
    # I click New Result
    # I click Create
    # I log out

    #
    # Creation of final call result by agent Bob
    # I sign in as bob.brown@example.com
    # I click Test campaign within first column of bottom campaigns sidebar
    # I click New Result
    # I click Create
    # I log out

    #
    # Creation of final call result by agent Alice
    # I sign in as alice.smith@example.com
    # I click Test campaign within first column of bottom campaigns sidebar
    # I click New Result
    # I click Create
    # I should see You have no contacts assigned
    # I log out

    #
    # No more contacts for agent Bob
    # I sign in as bob.brown@example.com
    # I click Test campaigns within first column of bottom campaigns sidebar
    # I should see You have no contacts assigned
    # I log out
  end
end
