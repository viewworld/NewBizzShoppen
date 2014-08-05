# encoding: UTF-8
require 'spec_helper'

describe 'Member can get deal created by category supplier' do
  include_context 'request specs context'

  before do
    allow_any_instance_of(Deal).to receive(:check_deal_request_details_email_template).and_return(true)
    allow_any_instance_of(Lead).to receive(:send_email_with_deal_details_and_files).and_return(true)
    create(:email_template, :uniq_id => 'blank_template')
  end

  let!(:default_deal_admin_email) do
    Settings.default_deal_admin_email = old_deal_admin_email
    Settings.find_by_var('default_deal_admin_email')
  end
  let(:old_deal_admin_email) { 'admin@fairleads.com' }
  let(:deal_admin_field) { "settings[#{default_deal_admin_email.id}]" }
  let(:new_deal_admin_email) { 'defaultdealadmin@example.com' }
  let(:premiumsupplier_email) { 'premiumsupplier@example.com' }
  let(:subscription_plan) { SubscriptionPlan.first }
  let(:member_plan_name) { 'Member Premium' }
  let(:member_plan) { SubscriptionPlan.find_by_name(member_plan_name) }

  it 'Category Supplier can sign in, creates a deal and then member signs up and get that deal which results in a new lead purchase for category supplier' do
    #
    # Subscription creation for category supplier and member, new deal category creation and deal admin account creation
    # I go to fairleads.com
    get '/'
    expect(response).to render_template('supplier_home/guest')

    # I sign in as admin
    post '/users/sign_in', {:user => {:email => admin.email, :password => 'secret'}}
    follow_with_redirect '/administration'
    expect(response).to be_success

    # I click Subscription plans subtab of Reports
    body_has_to(:have_link, 'Reports', :href => '#', :additional_class => 'first', :tab => 'reports')
    body_has_to(:have_link, 'Subscriptions', :href => '/administration/subscription_plans', :subtab => 'subscription_plans')
    get '/administration/subscription_plans'

    # I click New subscription
    body_has_to(:have_link, 'New subscription plan', :href => '/administration/subscription_plans/new', :class => 'bt')
    get '/administration/subscription_plans/new'

    # I fill in Name with Supplier Premium
    # I fill in Subscription period with 5, Billing cycle with 1, Billing date with 0
    # I select DKK from Currency
    # I select Category Supplier from Roles
    # I click New line
    # I fill in Name with ‘Supplier premium 5 weeks’, Price with 12
    # I check Got credit enabled?
    # I check Deal maker role enabled?
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
              'subscription_plan[deal_maker]' => '1',
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


    body_has_to(:have_button, 'subscription_plan_submit')

    # I press Save
    expect { post '/administration/subscription_plans', fields.merge(lines) }.to change(SubscriptionPlan, :count).by(1)
    follow_with_redirect '/administration/subscription_plans'
    expect(response).to be_success
    has_flash 'Subscription plan was successfully created.'

    # I click New subscription
    body_has_to(:have_link, 'New subscription plan', :href => '/administration/subscription_plans/new', :class => 'bt')
    get '/administration/subscription_plans/new'

    # I fill in Name with Member Premium
    # I fill in Subscription period with 5, Billing cycle with 1, Billing date with 0
    # I select DKK from Currency
    # I select Member from Roles
    # I click New line
    # I fill in Name with ‘Member premium 5 weeks’, Price with 12

    fields = {'subscription_plan[name]' => member_plan_name,
              'subscription_plan[subscription_text]' => '',
              'subscription_plan[subscription_period]' => '5',
              'subscription_plan[billing_cycle]' => '1',
              'subscription_plan[lockup_period]' => '0',
              'subscription_plan[billing_period]' => '0',
              'subscription_plan[free_period]' => '',
              'subscription_plan[currency_id]' => currency.id,
              'subscription_plan[seller_id]' => seller.id,
              'subscription_plan[assigned_roles][]' => 'member',
              'subscription_plan[is_active]' => '1',
              'subscription_plan[is_public]' => '1',
              'subscription_plan[can_be_upgraded]' => '1',
              'subscription_plan[can_be_downgraded]' => '1',
              # I check Allow premium deals
              'subscription_plan[premium_deals]' => '1',
              'subscription_plan[free_deal_requests_in_free_period]' => '0',
              'subscription_plan[team_buyers]' => '0',
              'subscription_plan[big_buyer]' => '0',
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

    body_has_to(:have_button, 'subscription_plan_submit')

    # I press Save
    expect { post '/administration/subscription_plans', fields.merge(lines) }.to change(SubscriptionPlan, :count).by(1)
    follow_with_redirect '/administration/subscription_plans'
    expect(response).to be_success
    has_flash 'Subscription plan was successfully created.'

    # I click Browse deals tab
    body_has_to(:have_link, 'Browse deals', :href => '/deal_categories', :tab => 'browse_deals')
    get '/deal_categories'

    # I click New deal category
    body_has_to(:have_link, 'New deal category', :href => '/administration/categories/new?category_type=DealCategory')
    get '/administration/categories/new?category_type=DealCategory'

    # I fill in name with IT
    fields = { 'category[name]' => 'IT' }
    body_include_fields fields

    # I click Save

    body_has_to(:have_button, 'Save')
    expect { post '/administration/categories', fields.merge('category_type' => 'DealCategory') }.to change(DealCategory, :count).by(1)
    follow_with_redirect '/deal_categories'
    has_flash 'Category was successfully created.'

    # I click Users subtab
    body_has_to(:have_link, 'Users', :href => '/administration/users', :tab => 'users')
    get '/administration/users'

    # I select Agent from role
    body_has_to(:have_select, 'role', :with_options => ['Agent'])
    body_has_to(:have_link, 'New user', :onsubmit => "$('#form_new_user').submit()")

    # I click New user
    get '/administration/users/new?role=agent'

    # I fill in First name, Last name, Company name’, Address line 1, Address line 2, City, Zip code,
    # Email with defaultdealadmin@example.com, Password, Password Confirmation
    fields = {'user_agent[first_name]' => 'Default Deal',
              'user_agent[last_name]' => 'Admin',
              'user_agent[company_name]' => 'DefaultDealAdmin LTD',
              'user_agent[address_attributes][address_line_1]' => 'AddressLine1',
              'user_agent[address_attributes][address_line_2]' => 'AddressLine2',
              'user_agent[address_attributes][address_line_3]' => 'City',
              'user_agent[address_attributes][zip_code]' => 'ZipCode',
              'user_agent[address_attributes][country_id]' => country.id,
              'user_agent[address_attributes][region_id]' => '',
              'user_agent[phone]' => '',
              'user_agent[email]' => new_deal_admin_email,
              'user_agent[password]' => 'secret',
              'user_agent[password_confirmation]' => 'secret'}
    body_include_fields fields

    # I click Save

    body_has_to(:have_button, 'user_agent_submit')
    expect { post '/administration/users?role=agent', fields.merge('user_agent[agreement_read]' => '1') }.to change(User::Agent, :count).by(1)
    follow_with_redirect '/administration/users'
    has_flash 'User has been created successfuly'

    # I click Global subtab of Settings
    body_has_to(:have_link, 'Settings', :href => '#', :additional_class => 'first', :tab => 'settings')
    body_has_to(:have_link, 'Global', :href => '/administration/setting/edit', :subtab => 'global')
    get '/administration/setting/edit'

    # I select defaultdealadmin@example.com from Default deal admin email
    body_has_to(:have_select, deal_admin_field)

    # I click save
    put '/administration/setting', deal_admin_field => new_deal_admin_email
    expect(default_deal_admin_email.reload.value).to eq new_deal_admin_email
    follow_with_redirect '/administration/setting/edit'
    has_flash 'Settings were successfully updated.'

    # I logout
    logout

    #
    # Category Supplier signup & deal creation
    # I go to fairleads.com
    get '/'
    expect(response).to render_template('supplier_home/guest')

    # I click New category supplier account
    # I fill in First name, Last name, Company name with ‘My Company’, Address line 1, Address line 2,
    # City, Zip code, Email with premiumsupplier@example.com, Password, Password Confirmation
    # I select Supplier premium from Subscriptions
    # I check Agree to T&C
    get '/supplier_accounts/new'
    expect(response).to be_success

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
              'user_category_supplier[agreement_read]' => '1',
              'user_category_supplier[newsletter_on]' => '1'}

    body_include_fields fields
    lines = { 'user_category_supplier[rpx_identifier]' => '1' }

    # I press Create
    expect { post '/supplier_accounts', fields.merge(lines) }.to change(User::CategorySupplier, :count).by(1)
    follow_with_redirect
    has_flash 'Your account has been successfully created! You are now signed in.'

    # I should be signed in as premiumsupplier@example.com
    body_has_to(:include, premiumsupplier_email)

    # I click My deals tab
    body_has_to(:have_link, 'My deals', :href => '/suppliers/deals', :additional_class => 'first', :tab => 'deals')
    get '/suppliers/deals'

    # I click Create new deal
    body_has_to(:have_link, 'Create new deal', :href => 'javascript:void(0)')
    get '/suppliers/deals/new'

    # I select IT from categories
    # I fill in name with Awesome deal
    # I fill in detailed description with Awesome description
    # I check Premium deal
    # I fill in phone number with 2323232322
    # I check Published
    body_has_to(:have_select, 'deal[category_id]', :with_options => ['IT'])

    fields = {'deal[category_id]' => DealCategory.last.id,
              'deal[header]' => 'Awesome deal',
              'deal[hidden_description]' => '<p>Awesome description</p>',
              'deal[deal_confirmation_page]' => '<p>Vi har sendt en mail til leverand&oslash;ren med dine kontaktinformationer. Du er ogs&aring; velkommen til at kontakte leverand&oslash;ren direkte, du skal huske at oplyse at du er medlem af fairdeals s&aring; du f&aring;r din rabat.</p>',
              'deal[start_date]' => Date.today.to_s,
              'deal[end_date]' => Date.today.to_s,
              'deal[currency_id]' => currency.id,
              'deal[max_auto_buy]' => '100',
              'deal[group_deal]' => '0',
              'deal[premium_deal]' => '1',
              'deal[company_name]' => premiumsupplier_email,
              'deal[contact_name]' => 'FirstName LastName',
              'deal[email_address]' => premiumsupplier_email,
              'deal[phone_number]' => '123123123',
              'deal[address_line_1]' => 'ul. Black St 51',
              'deal[address_line_2]' => '',
              'deal[address_line_3]' => 'Bielsko-Biała',
              'deal[zip_code]' => '43-300',
              'deal[country_id]' => '2',
              'deal[published]' => '1',
              'deal[voucher_enabled]' => '0',
              'deal[voucher_until_type]' => '0',
              'deal[voucher_end_date]' => (Date.today + 2.years).to_s,
              'deal[voucher_number_of_weeks]' => '1',
              'deal[voucher_max_number]' => '1'}

    # I click Save

    body_has_to(:have_button, 'Save')
    expect { post '/suppliers/deals', fields }.to change(Deal, :count).by(1)
    follow_with_redirect '/suppliers/deals'
    has_flash 'Deal has been successfully created.'

    # I log out
    logout '/companyname'

    #
    # Member signup & deal purchase
    # I go to fairdeals.com
    with_site('fairdeals')
    get '/'

    # I click Get a free account now
    body_has_to(:have_link, 'Get a free account now', :href => '/member_accounts/new')
    get '/member_accounts/new'

    # I fill in First name, Last name, Company name with ‘My Company2’, Address line 1, Address line 2, City,
    # Zip code, Email with memberpremium@example.com, Password, Password Confirmation
    # I select Member premium from Subscriptions
    # I check Agree to T&C

    fields = {'user_member[subscription_plan_id]' => member_plan.id,
              'user_member[company_name]' => 'My Company2',
              'user_member[first_name]' => 'FirstName2',
              'user_member[last_name]' => 'LastName2',
              'user_member[address_attributes][address_line_1]' => 'AddressLine2_1',
              'user_member[address_attributes][address_line_2]' => 'AddressLine2_2',
              'user_member[address_attributes][address_line_3]' => 'BB',
              'user_member[address_attributes][zip_code]' => '43000',
              'user_member[address_attributes][country_id]' => country.id,
              'user_member[phone]' => '123123123123',
              'user_member[email]' => 'memberpremium@example.com',
              'user_member[password]' => 'secret',
              'user_member[password_confirmation]' => 'secret',
              'user_member[time_zone]' => 'UTC',
              'user_member[agreement_read]' => '1',
              'user_member[newsletter_on]' => '1'}

    body_include_fields fields

    # I press Create

    body_has_to(:have_button, 'Create')
    expect { post '/member_accounts', fields.merge('user_member[rpx_identifier]' => 1) }.to change(User::Member, :count).by(1)

    # I should be signed in as memberpremium@example.com
    follow_with_redirect
    has_flash 'Your account has been successfully created! You are now signed in.'
    body_has_to(:include, 'memberpremium@example.com')

    # I click Deals tab
    body_has_to(:have_link, 'Deals', :href => '/deal_categories', :additional_class => 'first', :tab => 'browse_deals')
    get '/deal_categories'

    # I click IT
    body_has_to(:have_link, 'View deals', :href => '/categories/deals/it')
    get '/categories/deals/it'

    # I should see Awesome deal
    body_has_to(:include, 'Awesome deal')

    # I click View deal
    body_has_to(:have_link, 'View deal', :href => '/deals/1-awesome-deal')
    get '/deals/1-awesome-deal'

    # I should not see premiumsupplier@example.com
    body_has_to_not(:include, 'premiumsupplier@example.com')

    # I click Get deal
    body_has_to(:have_link, 'Get deal', :href => 'javascript:void(0)')
    xhr :get, '/members/requests/new.js?deal_id=1'
    expect { post '/members/requests.js?', {:deal_id => 1} }.to change(Lead, :count).by(1)
    body_has_to(:include, '/deals/1-awesome-deal')
    get '/deals/1-awesome-deal'

    # I should see premiumsupplier@example.com
    body_has_to(:include, premiumsupplier_email)

    # I log out
    logout

    #
    # Category supplier’s new lead purchase
    # I go to fairleads.com
    with_site('fairleads')
    get '/'

    # I sign in as premiumsupplier@example.com
    post '/users/sign_in', {:user => {:email => premiumsupplier_email, :password => 'secret'}}
    follow_with_redirect '/companyname'
    expect(response).to be_success

    # I click My leads tab
    body_has_to(:have_link, 'My leads', :href => '/suppliers/lead_purchases')
    get '/suppliers/lead_purchases'

    # I should see A company is interested in Awesome deal

    ['A company is interested in Awesome deal', 'memberpremium@example.com', 'FirstName2 LastName2', 'AddressLine2_1 AddressLine2_2 43000 BB'].each do |element|
      body_has_to(:include, element)
    end

    # I log out
    logout '/companyname'
  end
end
