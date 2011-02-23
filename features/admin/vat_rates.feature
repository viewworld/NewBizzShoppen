@added @m4b @ao @vat_rates
Feature: VAT rates

  Background: I am on the home page
    Given there is a seller with attributes "name:DannyTheSeller,first_name:Danny,last_name:DeVito,address:USA,vat_no:123" for country "Denmark"
    And I am on the home page

  @_done
  Scenario: I can fill in VAT number when creating new buyer account
    When I follow translated "home.show.view.sign_up_here" within "#buyer_sign_up"
    Then I should see "Vat number"

  @_done
  Scenario: I can't fill in VAT number when creating new agent or purchase manager account
    When I follow translated "home.show.view.sign_up_here" within "#agent_sign_up"
    Then I should not see "Vat number"
    When I am on the home page
    And I follow translated "home.show.view.sign_up_here" within "#purchase_manager_sign_up"
    Then I should not see "Vat number"

  @_done
  Scenario: Administrator can edit vat number for customer
    When I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    And someone is signed up and confirmed as user with email kastomer@nbs.fake and password secret and role customer
    And I sign in as jon@lajoie.ca with password secret
    And I am on administration edit user kastomer@nbs.fake
    Then I should see "Vat number"

  @_done
  Scenario: Administrator can't edit vat number for agents/pms
    When I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    And someone is signed up and confirmed as user with email ejdzent@nbs.fake and password secret and role agent
    And someone is signed up and confirmed as user with email piem@nbs.fake and password secret and role purchase_manager
    And I sign in as jon@lajoie.ca with password secret
    And I am on administration edit user ejdzent@nbs.fake
    Then I should not see "Vat number"
    When I am on administration edit user piem@nbs.fake
    Then I should not see "Vat number"

  @_done
  Scenario: Buyers can edit vat number in profile
    When I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role customer
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.my_profile_link"
    Then I should see "Vat number"

  @_done
  Scenario: Agents/PurchaseManagers can edit vat number in profile
    When I am signed up and confirmed as user with email ejdzent@lajoie.ca and password secret and role agent
    And I am signed up and confirmed as user with email piem@lajoie.ca and password secret and role purchase_manager
    And I sign in as ejdzent@lajoie.ca with password secret
    And I follow translated "layout.my_profile_link"
    Then I should not see "Vat number"
    When I sign out
    And I sign in as piem@lajoie.ca with password secret
    And I follow translated "layout.my_profile_link"
    Then I should not see "Vat number"

  @_done
  Scenario: Administrator can set the no charge vat flag when vat number is specified
    When I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    And someone is signed up and confirmed as user with email kastomer@nbs.fake and password secret and role customer with attributes "vat_number:666"
    And I sign in as jon@lajoie.ca with password secret
    And I am on administration edit user kastomer@nbs.fake
    Then I should see translated "administration.users.edit.view.not_charge_vat"

  @_done
  Scenario: Administrator can't set the no charge vat flag when vat number is not specified
    When I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    And someone is signed up and confirmed as user with email kastomer@nbs.fake and password secret and role customer
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.admin.users"
    And I am on administration edit user kastomer@nbs.fake
    Then I should not see translated "administration.users.edit.view.not_charge_vat"

  # https://redmine.selleo.com/issues/3660
  @_deprecated
  Scenario: Administrator can add vat rate for each country

  @_done
  Scenario: Administrator can't set more than 1 rate per country
    When VAT rate for "Denmark" is set to "25"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.admin.global"
    And I follow translated "administration.vat_rates.index.view.add_vat_rate"
    And I fill in "vat_rate_country_attributes_name" with "Denmark"
    And I fill in "vat_rate_rate" with "15"
    And I press translated "administration.vat_rates.new.view.button_create"
    Then I should see "has already been taken"

  @_done
  Scenario: When VAT rate for a country is set, clients from this country should have this rate applied on invoice if they are not paying VAT in their country
    When VAT rate for "Denmark" is set to "27"
    And lead Awesome Lead exists within category Computers
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    And someone is signed up and confirmed as user with email kastomer@nbs.fake and password secret and role customer
    And User kastomer@nbs.fake with role customer is big buyer
    And user "kastomer@nbs.fake" with role "lead_buyer" added lead "Awesome Lead" to cart
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.admin.upcoming_invoices"
    And I follow translated "administration.upcoming_invoices.index.view.create_invoice"
    And I press translated "administration.invoices.new.view.button_create"
    And I follow translated "administration.invoices.edit.view.show_invoice"
    Then I should see "27%" within ".invoice_data"

  @_done
  Scenario: When VAT rate for a country is set, clients from this country should not have this rate applied on invoice if they are paying VAT in their country
    When VAT rate for "Denmark" is set to "27"
    And lead Awesome Lead exists within category Computers
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    And someone is signed up and confirmed as user with email kastomer@nbs.fake and password secret and role customer with attributes "not_charge_vat:1"
    And User kastomer@nbs.fake with role customer is big buyer
    And user "kastomer@nbs.fake" with role "lead_buyer" added lead "Awesome Lead" to cart
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.admin.upcoming_invoices"
    And I follow translated "administration.upcoming_invoices.index.view.create_invoice"
    And I press translated "administration.invoices.new.view.button_create"
    And I follow translated "administration.invoices.edit.view.show_invoice"
    Then I should not see "27%" within ".invoice_data"

   @selenium @_done
   Scenario: When creating invoice manually by admin, VAT field should be prepopulated if country has vat rate set and user doesnt pay vat in his country
     When VAT rate for "Denmark" is set to "27"
     And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
     And someone is signed up and confirmed as user with email kastomer@nbs.fake and password secret and role customer with attributes "first_name:Wielki,last_name:Szu"
     And I sign in as jon@lajoie.ca with password secret
     And I follow translated "layout.main_menu.admin.invoices"
     And I select "Wielki Szu" from "invoice_user_id"
     And I press translated "administration.invoices.index.view.create_invoice"
     And I follow "add_fields_invoice_lines"
     Then the "1" field with id like "_vat_rate" should contain "27.0"
     And the "invoice_vat_paid_in_customer_country" checkbox should not be checked

  @selenium @_done
  Scenario: When creating invoice manually by admin, VAT field should be zero and disabled if country has vat rate set but user pays vat in his country
    When VAT rate for "Denmark" is set to "27"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    And someone is signed up and confirmed as user with email kastomer@nbs.fake and password secret and role customer with attributes "first_name:Wielki,last_name:Szu,not_charge_vat:1"
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.admin.invoices"
    And I select "Wielki Szu" from "invoice_user_id"
    And I press translated "administration.invoices.index.view.create_invoice"
    And I follow "add_fields_invoice_lines"
    Then the "1" field with id like "_vat_rate" should contain "0"
    And the "invoice_vat_paid_in_customer_country" checkbox should be checked

  # Make country a textfield (we won’t create a new VAT for existing country, so it should be ok just to create both new country and VAT)
  @m5 @ao @_done
  Scenario: I can create a new country when adding a VAT rate
    When I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.admin.global"
    And I follow translated "administration.vat_rates.index.view.add_vat_rate"
    And I fill in "vat_rate_country_attributes_name" with "Poland"
    And I fill in "vat_rate_rate" with "23"
    And I press translated "administration.vat_rates.new.view.button_create"
    Then I should be on administration settings page
    And I should see "23.00%" within "#vat_rates"
    And I should see "Poland" within "#vat_rates"

  @m5 @ao @_done
  Scenario: The new country created should have VAT rate assigned
    When I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.admin.global"
    And I follow translated "administration.vat_rates.index.view.add_vat_rate"
    And I fill in "vat_rate_country_attributes_name" with "Poland"
    And I fill in "vat_rate_rate" with "23"
    And I press translated "administration.vat_rates.new.view.button_create"
    Then country "Poland" should have VAT rate of "23"