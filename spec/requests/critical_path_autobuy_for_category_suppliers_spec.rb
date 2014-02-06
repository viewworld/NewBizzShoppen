require 'spec_helper'

describe 'Critical Path Autobuy for category suppliers' do
  before do
    with_site('fairleads')
    with_locale('en')
    stub_currency_euro
    without_confirmation_email!
    without_invoice_email_template!
  end

  let(:admin) { User::Admin.make!(:confirmed_at => Time.now) }
  let(:seller) { Seller.make! }
  let(:currency) { Currency.make! }

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
    expect(response.body).to have_link('Subscriptions', :href => '/administration/subscription_plans')
    get '/administration/subscription_plans'
    expect(response.code).to eq '200'

    # I click New subscription plan
    expect(response.body).to have_link('New subscription plan', :href => '/administration/subscription_plans/new')

    get '/administration/subscription_plans/new'
    expect(response.code).to eq '200'

    # I fill in Name with Supplier Premium
    # I fill in Subscription period with 5, Billing cycle with 1, Billing date with 0
    # I select DKK from Currency
    # I select Category Supplier from Roles
    # I click New line
    # I fill in Name with 'Supplier premium 5 weeks', Price with 12
    # I check Got credit enabled?
    #
    # VALIDATE ALL NECESSARY FIELDS
    #

    fields = {'subscription_plan[name]' => 'Supplier Premium',
              'subscription_plan[subscription_text]' => '',
              'subscription_plan[subscription_period]' => '5',
              'subscription_plan[billing_cycle]' => '1',
              'subscription_plan[lockup_period]' => '0',
              'subscription_plan[billing_period]' => '0',
              'subscription_plan[free_period]' => '',
              'subscription_plan[currency_id]' => currency.id,
              'subscription_plan[seller_id]' => seller.id,
              'subscription_plan[assigned_roles][]' => 'category_supplier',
              'subscription_plan[is_active]' => '0',
              'subscription_plan[is_active]' => '1',
              'subscription_plan[is_public]' => '0',
              'subscription_plan[is_public]' => '1',
              'subscription_plan[can_be_upgraded]' => '0',
              'subscription_plan[can_be_upgraded]' => '1',
              'subscription_plan[can_be_downgraded]' => '0',
              'subscription_plan[can_be_downgraded]' => '1',
              'subscription_plan[premium_deals]' => '0',
              'subscription_plan[free_deal_requests_in_free_period]' => '0',
              'subscription_plan[team_buyers]' => '0',
              'subscription_plan[big_buyer]' => '0',
              'subscription_plan[big_buyer]' => '1',
              'subscription_plan[deal_maker]' => '0',
              'subscription_plan[newsletter_manager]' => '0',
              'subscription_plan[chain_mails_enabled]' => '0',
              'subscription_plan[surveys_enabled]' => '0',
              'subscription_plan[pipeline_reports_enabled]' => '0',
              'subscription_plan[use_paypal]' => '0',
              'subscription_plan[paypal_retries]' => '1',
              'subscription_plan[automatic_downgrading]' => '0',
              'subscription_plan[automatic_downgrade_subscription_plan_id]' => '1',
              'subscription_plan[paypal_billing_at_start]' => 'true'}
    fields.each do |field, _|
      expect(response.body).to have_field field
    end

    lines = {'subscription_plan[subscription_plan_lines_attributes][1391677822159][name]' => 'Supplier premium 5 weeks',
             'subscription_plan[subscription_plan_lines_attributes][1391677822159][price]' => '15'}

    # I press Save
    expect { post '/administration/subscription_plans', fields.merge(lines) }.to change(SubscriptionPlan, :count).by(1)
    expect(response.code).to eq '302'
    expect(response).to redirect_to('/administration/subscription_plans')
    follow_redirect!
    expect(response.code).to eq '200'
    expect(response.body).to include 'Subscription plan was successfully created.'

    # I logout
    get '/logout'
    expect(response).to redirect_to('/')
    expect(response.code).to eq '302'
    follow_redirect!
    expect(response.code).to eq '200'
    expect(response.body).to include 'Signed out successfully.'
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
