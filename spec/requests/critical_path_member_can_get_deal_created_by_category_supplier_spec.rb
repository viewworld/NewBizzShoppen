require 'spec_helper'

describe 'Member can  get deal created by category supplier' do
  include_context 'request specs context'

  it 'Category Supplier can sign in, creates a deal and then member signs up and get that deal which results in a new lead purchase for category supplier' do
    #
    # Subscription creation for category supplier and member, new deal category creation and deal admin account creation
    # I go to fairleads.com
    # I sign in as admin
    # I click Subscription plans subtab of Reports
    # I click New subscription
    # I fill in Name with Supplier Premium
    # I fill in Subscription period with 5, Billing cycle with 1, Billing date with 0
    # I select DKK from Currency
    # I select Category Supplier from Roles
    # I click New line
    # I fill in Name with ‘Supplier premium 5 weeks’, Price with 12
    # I check Got credit enabled?
    # I check Deal maker role enabled?
    # I press Save
    # I click New subscription
    # I fill in Name with Member Premium
    # I fill in Subscription period with 5, Billing cycle with 1, Billing date with 0
    # I select DKK from Currency
    # I select Member from Roles
    # I click New line
    # I fill in Name with ‘Member premium 5 weeks’, Price with 12
    # I check Allow premium deals
    # I press Save
    # I click Browse deals tab
    # I click New deal category
    # I fill in name with IT
    # I click Save
    # I click Users subtab
    # I select Agent from role
    # I click New user
    # I fill in First name, Last name, Company name’, Address line 1, Address line 2, City, Zip code, Email with defaultdealadmin@example.com, Password, Password Confirmation
    # I click Save
    # I click Global subtab of Settings
    # I select defaultdealadmin@example.com from Default deal admin email
    # I click save
    # I logout

    #
    # Category Supplier signup & deal creation
    # I go to fairleads.com
    # I click New category supplier account
    # I fill in First name, Last name, Company name with ‘My Company’, Address line 1, Address line 2, City, Zip code, Email with premiumsupplier@example.com, Password, Password Confirmation
    # I select Supplier premium from Subscriptions
    # I check Agree to T&C
    # I press Create
    # I should be signed in as premiumsupplier@example.com
    # I click My deals tab
    # I click Create new deal
    # I select IT from categories
    # I fill in name with Awesome deal
    # I fill in detailed description with Awesome description
    # I check Premium deal
    # I fill in phone number with 2323232322
    # I check Published
    # I click Save
    # I log out

    #
    # Member signup & deal purchase
    # I go to fairdeals.com
    # I click Get a free account now
    # I fill in First name, Last name, Company name with ‘My Company2’, Address line 1, Address line 2, City, Zip code, Email with memberpremium@example.com, Password, Password Confirmation
    # I select Member premium from Subscriptions
    # I check Agree to T&C
    # I press Create
    # I should be signed in as memberpremium@example.com
    # I click Deals tab
    # I click IT
    # I should see Awesome deal
    # I click View deal
    # I should not see premiumsupplier2@example.com
    # I click Get deal
    # I should see premiumsupplier2@example.com
    # I log out

    #
    # Category supplier’s new lead purchase
    # I go to fairleads.com
    # I sign in as premiumsupplier@example.com
    # I click My leads tab
    # I should see A company is interested in Awesome deal
    # I log out
  end
end
