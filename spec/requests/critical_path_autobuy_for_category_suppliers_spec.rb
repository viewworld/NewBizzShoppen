require 'spec_helper'

describe 'Critical Path Autobuy for category suppliers' do

  before do
    with_site('fairleads')
    with_locale('en')
    stub_currency_euro
    without_confirmation_email!
  end

  let(:admin) { u = User::Admin.make!(:confirmed_at => Time.now) }

  # https://github.com/Selleo/NewBizzShoppen/wiki/Critical-Path---Autobuy-for-category-suppliers#wiki-subscription-creation
  it 'subscription creation' do
    # I go to fairleads.com
    get '/'
    expect(response).to render_template('supplier_home/guest')

    # I sign in as admin
    post '/users/sign_in', {:user => {:email => admin.email, :password => 'secret'}}
    expect(response.code).to eq '302'
    expect(response).to redirect_to('/administration')
    follow_redirect!
    expect(response.code).to eq '200'

    # I click Subscription plans subtab of Reports
    # I click New subscription
    # I fill in Name with Supplier Premium
    # I fill in Subscription period with 5, Billing cycle with 1, Billing date with 0
    # I select DKK from Currency
    # I select Category Supplier from Roles
    # I click New line
    # I fill in Name with ‘Supplier premium 5 weeks’, Price with 12
    # I check Got credit enabled?
    # I press Save
    # I logout
  end

  # https://github.com/Selleo/NewBizzShoppen/wiki/Critical-Path---Autobuy-for-category-suppliers#wiki-category-supplier-signup
  it 'category supplier signup', :pending => true do
    # I go to fairleads.com
    # I click New category supplier account
    # I fill in First name, Last name, Company name with ‘My Company’, Address line 1, Address line 2, City, Zip code, Email with premiumsupplier@example.com, Password, Password Confirmation
    # I select Supplier premium from Subscriptions
    # I check Agree to T&C
    # I press Create
    # I should be signed in as premiumsupplier@example.com
    # I log out
  end

  # https://github.com/Selleo/NewBizzShoppen/wiki/Critical-Path---Autobuy-for-category-suppliers#wiki-agent-signup--lead-creation
  it 'agent signup & lead creation', :pending => true do
    # I go to faircalls.dk
    # I click New agent account
    # I fill in First name, Last name, Address line 1, Address line 2, City, Zip code, Email with ‘agent@example.com, Password, Password Confirmation
    # I check Agree to T&C
    # I press Create
    # I should get email with confirmation link
    # I confirm my account with link from email
    # I should be signed in as agent@example.com
    # I click My leads tab
    # I select My company from Categories
    # I press New lead
    # I fill in Company name, Address line 1, Address line 2, City, Zip code, Name, Phone number, Public header with ‘My Test Lead’, Public description, Price
    # I press Create
    # I log out
  end

  # https://github.com/Selleo/NewBizzShoppen/wiki/Critical-Path---Autobuy-for-category-suppliers#wiki-lead-purchases--invoices-for-category-supplier
  it 'lead purchases & invoices for Category Supplier', :pending => true do
    # I go to fairleads.com
    # I sign in as premiumsupplier@example.com
    # I click My leads tab
    # I should see My Test Lead
    # I check My Test Lead
    # I select Meeting from State
    # I press Update all selected leads
    # I should see Meeting selected in State select for My Test Lead
    # I click Invoices tab
    # I click Pending Leads
    # I should see My Test Lead
    # I log out
  end

  # https://github.com/Selleo/NewBizzShoppen/wiki/Critical-Path---Autobuy-for-category-suppliers#wiki-invoice-creation
  it 'invoice creation', :pending => true do
    # I go to fairleads.com
    # I sign in as admin
    # I click Invoices subtab of Reports
    # I select ‘My Company, premiumsupplier@example.com’ from User
    # I press Create invoice
    # I should see ‘Invoice was successfully created’
    # I log out
  end

  # https://github.com/Selleo/NewBizzShoppen/wiki/Critical-Path---Autobuy-for-category-suppliers#wiki-unpaid-invoices-for-category-supplier
  it 'upaid invoices for category supplier', :pending => true do
    # I go to fairleads.com
    # I sign in as premiumsupplier@example.com
    # I click Invoices tab
    # I click Pending Leads
    # I should NOT see My Test Lead
    # I click Due invoices
    # I should see 1 invoice
    # I click Show
    # I should see My Test Lead
  end
end
