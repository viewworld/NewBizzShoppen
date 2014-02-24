require 'spec_helper'

describe 'Upgrade contact to lead after survey completion' do
  include_context 'request specs context'

  it 'Contact is upgraded to lead after the completion of survey created by call centre' do
    # https://github.com/Selleo/NewBizzShoppen/wiki/Critical-Path-%22Upgrade-contact-to-lead-after-survey-completion%22
    #
    # Call centre creation by admin
    # I go to fairleads.com
    # I sign in as admin
    # I click on Users tab
    # I select Call Centre from Roles
    # I click New User
    # I fill in company name with Test Call Company, Address line 1, City, Zip code, Bank address line 1, Bank address City, Bank address zip code, Bank Country, Password, Password Confirmation, Email with call_centre_test@example.com
    # I press Save
    # I click Categories
    # I click New category
    # I fill in name with Awesome leads
    # I select DKK from Currency
    # I click Create
    # I logout

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
