require 'spec_helper'

describe 'Critical Path Autobuy for category suppliers' do
  before do
    with_site('fairleads')
    Locale.make!
    VatRate.make!
    without_confirmation_email!
    without_invoice_email_template!
  end

  let(:admin) { User::Admin.make!(:confirmed_at => Time.now) }
  let(:seller) { Seller.make! }
  let!(:currency) { Currency.make!(:name => 'EUR', :global_default => true) }

  it 'autobuy for category suppliers' do
    # https://github.com/Selleo/NewBizzShoppen/wiki/Critical-Path---Autobuy-for-category-suppliers#wiki-subscription-creation
    # 'subscription creation'
    # I go to fairleads.com
    get '/'
    expect(response).to render_template('supplier_home/guest')

    # I sign in as admin
    post '/users/sign_in', {:user => {:email => admin.email, :password => 'secret'}}
    expect(response).to redirect_to('/administration')
    follow_redirect!
    expect(response).to be_success

    # I click Subscription plans subtab of Reports
    body_has_to(:have_link, 'Subscriptions', :href => '/administration/subscription_plans')
    get '/administration/subscription_plans'
    expect(response).to be_success

    # I click New subscription plan
    body_has_to(:have_link, 'New subscription plan', :href => '/administration/subscription_plans/new')

    get '/administration/subscription_plans/new'
    expect(response).to be_success

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
      body_has_to(:have_field, field)
    end

    lines = {'subscription_plan[subscription_plan_lines_attributes][1391677822159][name]' => 'Supplier premium 5 weeks',
             'subscription_plan[subscription_plan_lines_attributes][1391677822159][price]' => '15'}

    # I press Save
    expect { post '/administration/subscription_plans', fields.merge(lines) }.to change(SubscriptionPlan, :count).by(1)
    subscription_plan = SubscriptionPlan.last

    expect(response).to redirect_to('/administration/subscription_plans')
    follow_redirect!
    expect(response).to be_success
    has_flash 'Subscription plan was successfully created.'

    # I logout
    get '/logout'
    expect(response).to redirect_to('/')
    follow_redirect!
    expect(response).to be_success
    has_flash 'Signed out successfully.'

    #
    # https://github.com/Selleo/NewBizzShoppen/wiki/Critical-Path---Autobuy-for-category-suppliers#wiki-category-supplier-signup
    # 'category supplier signup' do
    # I go to fairleads.com

    get '/'
    expect(response).to render_template('supplier_home/guest')

    body_has_to(:have_link, 'Create new supplier account', :href => '/supplier_accounts/new')

    # I click New category supplier account
    get '/supplier_accounts/new'
    expect(response).to be_success

    # I fill in First name, Last name, Company name with ‘My Company’, Address line 1, Address line 2, City, Zip code, Email with premiumsupplier@example.com, Password, Password Confirmation
    # I select Supplier premium from Subscriptions
    # I check Agree to T&C
    # I press Create
    #
    # VALIDATE ALL NECESSARY FIELDS
    #

    fields = {'user_category_supplier[subscription_plan_id]' => subscription_plan.id,
              'user_category_supplier[first_name]' => 'FirstName',
              'user_category_supplier[last_name]' => 'LastName',
              'user_category_supplier[company_name]' => 'CompanyName',
              'user_category_supplier[address_attributes][address_line_1]' => 'AddressLine1',
              'user_category_supplier[address_attributes][address_line_2]' => 'AddressLine2',
              'user_category_supplier[address_attributes][address_line_3]' => 'City',
              'user_category_supplier[address_attributes][zip_code]' => 'ZipCode',
              'user_category_supplier[address_attributes][country_id]' => Country.first.id,
              'user_category_supplier[address_attributes][region_id]' => '',
              'user_category_supplier[vat_number]' => '',
              'user_category_supplier[phone]' => '',
              'user_category_supplier[email]' => 'premiumsupplier@example.com',
              'user_category_supplier[password]' => 'password',
              'user_category_supplier[password_confirmation]' => 'password',
              'user_category_supplier[time_zone]' => 'UTC',
              'user_category_supplier[agreement_read]' => '0',
              'user_category_supplier[agreement_read]' => '1',
              'user_category_supplier[newsletter_on]' => '0',
              'user_category_supplier[newsletter_on]' => '1'}

    fields.each do |field, _|
      body_has_to(:have_field, field)
    end

    lines = { 'user_category_supplier[rpx_identifier]' => '1' }

    expect { post '/supplier_accounts', fields.merge(lines) }.to change(Subscription, :count).by(1)

    expect(response).to redirect_to '/'
    follow_redirect!

    has_flash 'Your account has been successfully created! You are now signed in.'

    # I should be signed in as premiumsupplier@example.com
    body_has_to(:include, 'premiumsupplier@example.com')

    # I logout
    get '/logout'
    expect(response).to redirect_to('/companyname')
    follow_redirect!
    expect(response).to be_success
    has_flash 'Signed out successfully.'

    #
    # https://github.com/Selleo/NewBizzShoppen/wiki/Critical-Path---Autobuy-for-category-suppliers#wiki-agent-signup--lead-creation
    # 'agent signup & lead creation'
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

    #
    # https://github.com/Selleo/NewBizzShoppen/wiki/Critical-Path---Autobuy-for-category-suppliers#wiki-lead-purchases--invoices-for-category-supplier
    # 'lead purchases & invoices for Category Supplier'
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

    #
    # https://github.com/Selleo/NewBizzShoppen/wiki/Critical-Path---Autobuy-for-category-suppliers#wiki-invoice-creation
    # 'invoice creation'
    # I go to fairleads.com
    # I sign in as admin
    # I click Invoices subtab of Reports
    # I select ‘My Company, premiumsupplier@example.com’ from User
    # I press Create invoice
    # I should see ‘Invoice was successfully created’
    # I log out

    #
    # https://github.com/Selleo/NewBizzShoppen/wiki/Critical-Path---Autobuy-for-category-suppliers#wiki-unpaid-invoices-for-category-supplier
    # 'upaid invoices for category supplier'
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
