require 'spec_helper'

describe 'Critical Path Autobuy for category suppliers' do
  it 'shared contact pool in campaign' do
    # Admin can create a call centre which can create a new campaign and call centre agents
    # that can work on contacts assigned to them dynamically from shared pool.

    #
    # Call centre creation by admin
    # I go to fairleads.com
    # I sign in as admin
    # I click on Users tab
    # I select Call Centre from Roles
    # I click New User
    # I fill in company name with Test Call Company, Address line 1, City, Zip code, Bank address line 1, Bank address City, Bank address zip code, Bank Country, Password, Password Confirmation, Email with call_centre_test@example.com
    # I press Save
    # I logout

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
