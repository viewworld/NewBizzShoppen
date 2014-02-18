require 'spec_helper'

describe 'Critical Path Autobuy for category suppliers' do
  include_context 'request specs context'

  let(:last_lead_purchase) { LeadPurchase.last }
  let(:last_invoice) { Invoice.order(:id).last }
  let(:last_seller) { Seller.last }
  let(:premiumsupplier_email) { 'premiumsupplier@example.com' }
  let(:premiumsupplier) { User.find_by_email(premiumsupplier_email) }

  it 'autobuy for category suppliers' do
    # https://github.com/Selleo/NewBizzShoppen/wiki/Critical-Path---Autobuy-for-category-suppliers#wiki-subscription-creation
    # 'subscription creation'
    # I go to fairleads.com
    get '/'
    expect(response).to render_template('supplier_home/guest')

    # I sign in as admin
    post '/users/sign_in', {:user => {:email => admin.email, :password => 'secret'}}
    follow_with_redirect '/administration'
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

    body_include_fields fields
    lines = {'subscription_plan[subscription_plan_lines_attributes][1391677822159][name]' => 'Supplier premium 5 weeks',
             'subscription_plan[subscription_plan_lines_attributes][1391677822159][price]' => '15'}

    # I press Save
    expect { post '/administration/subscription_plans', fields.merge(lines) }.to change(SubscriptionPlan, :count).by(1)
    subscription_plan = SubscriptionPlan.last

    follow_with_redirect '/administration/subscription_plans'
    expect(response).to be_success
    has_flash 'Subscription plan was successfully created.'

    # I logout
    logout

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
              'user_category_supplier[company_name]' => company_name,
              'user_category_supplier[address_attributes][address_line_1]' => 'AddressLine1',
              'user_category_supplier[address_attributes][address_line_2]' => 'AddressLine2',
              'user_category_supplier[address_attributes][address_line_3]' => 'City',
              'user_category_supplier[address_attributes][zip_code]' => 'ZipCode',
              'user_category_supplier[address_attributes][country_id]' => country.id,
              'user_category_supplier[address_attributes][region_id]' => '',
              'user_category_supplier[vat_number]' => '',
              'user_category_supplier[phone]' => '',
              'user_category_supplier[email]' => premiumsupplier_email,
              'user_category_supplier[password]' => 'secret',
              'user_category_supplier[password_confirmation]' => 'secret',
              'user_category_supplier[time_zone]' => 'UTC',
              'user_category_supplier[agreement_read]' => '0',
              'user_category_supplier[agreement_read]' => '1',
              'user_category_supplier[newsletter_on]' => '0',
              'user_category_supplier[newsletter_on]' => '1'}

    body_include_fields fields
    lines = { 'user_category_supplier[rpx_identifier]' => '1' }

    expect { post '/supplier_accounts', fields.merge(lines) }.to change(User::CategorySupplier, :count).by(1)
    follow_with_redirect
    has_flash 'Your account has been successfully created! You are now signed in.'

    # I should be signed in as premiumsupplier@example.com
    body_has_to(:include, premiumsupplier_email)

    # I logout
    logout '/companyname'

    #
    # https://github.com/Selleo/NewBizzShoppen/wiki/Critical-Path---Autobuy-for-category-suppliers#wiki-agent-signup--lead-creation
    # 'agent signup & lead creation'
    # I go to faircalls.dk
    with_site('faircalls')
    get '/'

    # I click New agent account
    body_has_to(:have_link, 'Create new agent account', :href => '/agent_accounts/new')
    expect(response).to render_template('supplier_home/guest')
    get '/agent_accounts/new'

    # I fill in First name, Last name, Address line 1, Address line 2, City, Zip code, Email with ‘agent@example.com, Password, Password Confirmation
    # I check Agree to T&C
    fields = {'user_agent[first_name]' => 'FirstName',
              'user_agent[last_name]' => 'LastName',
              'user_agent[address_attributes][address_line_1]' => 'AddressLine1',
              'user_agent[address_attributes][address_line_2]' => 'AddressLine2',
              'user_agent[address_attributes][address_line_3]' => 'City',
              'user_agent[address_attributes][zip_code]' => 'ZipCode',
              'user_agent[address_attributes][country_id]' => country.id,
              'user_agent[address_attributes][region_id]' => '',
              'user_agent[phone]' => '',
              'user_agent[email]' => 'agent@example.com',
              'user_agent[password]' => 'secret',
              'user_agent[password_confirmation]' => 'secret',
              'user_agent[time_zone]' => 'UTC',
              'user_agent[agreement_read]' => '1',
              'user_agent[newsletter_on]' => '1'}

    body_include_fields fields
    lines = { 'user_agent[rpx_identifier]' => '1' }

    # I press Create
    # I should get email with confirmation link
    # I confirm my account with link from email
    expect { post '/agent_accounts', fields.merge(lines) }.to change(User::Agent, :count).by(1)
    follow_with_redirect
    has_flash 'Your account has been successfully created! You are now signed in.'

    # I should be signed in as agent@example.com
    body_has_to(:include, 'agent@example.com')

    # I click My leads tab
    body_has_to(:have_link, 'My leads', :href => '/agents/leads')

    # I select My company from Categories # verify only AJAX request
    get '/categories.js'
    expect(response).to be_success
    body_has_to(:include, company_name)

    # I press New lead
    get '/agents/leads'
    body_has_to(:have_link, 'New lead', :href => '#')
    get "/agents/leads/new?category_id=#{lead_category.id}"
    expect(response).to be_success

    # I fill in Company name, Address line 1, Address line 2, City, Zip code, Name, Phone number, Public header with ‘My Test Lead’, Public description, Price
    fields = {'lead[company_name]' => 'LeadCompanyName',
              'lead[company_phone_number]' => '+44 123456123',
              'lead[company_website]' => 'http://selleo.com',
              'lead[address_line_1]' => 'ul. Kaminskiego 19',
              'lead[address_line_2]' => 'Room 203',
              'lead[address_line_3]' => 'Bielsko-Biala',
              'lead[zip_code]' => '43-300',
              'lead[country_id]' => country.id,
              'lead[contact_name]' => 'Joe Doe',
              'lead[direct_phone_number]' => '+44 123123123',
              'lead[phone_number]' => '+44 123123123',
              'lead[email_address]' => 'lead@example.com',
              'lead[category_id]' => lead_category.id,
              'lead[is_international]' => '0',
              'lead[header]' => 'Lead Public Header',
              'lead[description]' => 'Lead Public Description',
              'lead[purchase_value]' => '0',
              'lead[price]' => '20',
              'lead[currency_id]' => currency.id,
              'lead[published]' => '0',
              'lead[published]' => '1',
              'lead[sale_limit]' => '1',
              'lead[purchase_decision_date]' => Date.today.to_s}

    body_include_fields fields
    lines = { 'lead[category_is_changed]' => '0' }

    # I press Create
    expect { post '/agents/leads', fields.merge(lines) }.to change(Lead, :count).by(1)
    follow_with_redirect '/agents/leads'

    # I log out
    logout '/agent_home'

    #
    # https://github.com/Selleo/NewBizzShoppen/wiki/Critical-Path---Autobuy-for-category-suppliers#wiki-lead-purchases--invoices-for-category-supplier
    # 'lead purchases & invoices for Category Supplier'
    # I go to fairleads.com
    with_site('fairleads')
    get '/'

    fields = {'user[email]' => premiumsupplier_email,
              'user[password]' => 'secret'}

    body_include_fields fields

    # I should be signed in as premiumsupplier@example.com
    # I sign in as premiumsupplier@example.com
    post '/users/sign_in', fields
    follow_with_redirect "/#{lead_category.cached_slug}"

    body_has_to(:include, premiumsupplier_email)
    body_has_to(:have_link, 'My leads', :href => '/suppliers/lead_purchases')

    # I click My leads tab
    get '/suppliers/lead_purchases'
    expect(response).to be_success

    # I should see My Test Lead
    body_has_to(:include, 'Lead Public Header')

    # I check My Test Lead
    body_has_to(:have_field, 'lead_purchase_ids[]', :value => last_lead_purchase.id)
    # I select Meeting from State
    body_has_to(:have_select, 'bulk_state', :with_options => ['Meeting'])

    attributes = {'bulk_state' => 2,
              'route_to' => '/suppliers/bulk_lead_purchase_update',
              'lead_purchase_ids[]' => last_lead_purchase.id}

    # I press Update all selected leads
    post '/bulk_action', attributes, { 'HTTP_REFERER' => '/suppliers/lead_purchases' }

    follow_with_redirect '/suppliers/lead_purchases'

    has_flash 'Leads have been updated successfully!'

    # I should see Meeting selected in State select for My Test Lead
    body_has_to(:have_select, 'state', :selected => ['Meeting'])

    # I click Invoices tab
    body_has_to(:have_link, 'Invoices', :href => '/suppliers/invoices')
    get '/suppliers/invoices'
    expect(response).to be_success

    # I click Pending Leads
    body_has_to(:have_link, 'Pending leads', :href => '/suppliers/not_invoiced_leads')
    get '/suppliers/not_invoiced_leads'
    expect(response).to be_success

    # I should see My Test Lead
    body_has_to(:include, 'Lead Public Header')

    # I log out
    logout "/#{lead_category.cached_slug}"

    #
    # https://github.com/Selleo/NewBizzShoppen/wiki/Critical-Path---Autobuy-for-category-suppliers#wiki-invoice-creation
    # 'invoice creation'
    # I go to fairleads.com
    with_site('fairleads')
    get '/'
    expect(response).to render_template('supplier_home/guest')

    # I sign in as admin
    post '/users/sign_in', {:user => {:email => admin.email, :password => 'secret'}}
    follow_with_redirect '/administration'

    # I click Invoices subtab of Reports
    body_has_to(:have_link, 'Invoices', :href => '/administration/invoicing/invoices', :subtab => 'invoices')
    get '/administration/invoicing/invoices'

    # I select ‘My Company, premiumsupplier@example.com’ from User
    body_has_to(:have_select, 'invoice[user_id]', :with_options => ["#{lead_category.name}, #{admin.email}"])

    # I press Create invoice
    body_has_to(:have_button, 'invoice_submit')

    expect { post('/administration/invoicing/invoices',
                  {'invoice[user_id]' => premiumsupplier.id, 'invoice[seller_id]' => last_seller.id}) }.to change(Invoice, :count).by(1)
    follow_with_redirect "/administration/invoicing/invoices/#{last_invoice.id}/edit"

    # I should see ‘Invoice was successfully created’
    has_flash 'Invoice was successfully created.'

    # I log out
    logout

    #
    # https://github.com/Selleo/NewBizzShoppen/wiki/Critical-Path---Autobuy-for-category-suppliers#wiki-unpaid-invoices-for-category-supplier
    # 'upaid invoices for category supplier'
    # I go to fairleads.com
    with_site('fairleads')
    get '/'

    # I sign in as premiumsupplier@example.com
    fields = {'user[email]' => premiumsupplier_email,
              'user[password]' => 'secret'}

    body_include_fields fields

    post '/users/sign_in', fields
    follow_with_redirect "/#{lead_category.cached_slug}"

    # I click Invoices tab
    body_has_to(:have_link, 'Invoices', :href => '/suppliers/invoices', :subtab => 'invoices')
    get '/suppliers/invoices'
    expect(response).to be_success

    # I click Pending Leads
    body_has_to(:have_link, 'Pending leads', :href => '/suppliers/not_invoiced_leads')
    get '/suppliers/not_invoiced_leads'
    expect(response).to be_success

    # I should NOT see My Test Lead
    body_has_to(:include, 'No leads to display')
    body_has_to_not(:include, 'Lead Public Header')

    # I click Due invoices
    body_has_to(:have_link, 'Due invoices', :href => '/suppliers/invoices?search[with_paid]=0')
    get '/suppliers/invoices?search[with_paid]=0'
    expect(response).to be_success

    # I should see 1 invoice
    body_has_to(:have_link, 'Show', :href => "/suppliers/invoices/#{last_invoice.id}")

    # I click Show
    get "/suppliers/invoices/#{Invoice.last.id}"
    expect(response).to be_success

    # I should see My Test Lead
    body_has_to(:include, 'Lead Public Header')

    # I log out
    logout "/#{lead_category.cached_slug}"
  end
end
