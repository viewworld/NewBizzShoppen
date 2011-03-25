@$_admin @m6 @added @regions_administration @tgn
Feature: Regions administration

Background: Sign in user and set English locale
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  Then I sign in as bob@person.com with password supersecret
  And I go to administration countries

@_tested @selenium
Scenario: I can create new region for given country
  Given there are no countries
  And I go to administration countries
  When I follow translated "administration.countries.index.view.new_country"
  And I fill in "vat_rate_country_attributes_name" with "Poland"
  And I fill in "vat_rate_country_attributes_locale" with "pl"
  And I fill in "vat_rate_country_attributes_detailed_locale" with "pl"
  And I fill in "vat_rate_rate" with "23"
  And I press translated "administration.vat_rates.new.view.button_create"
  And I go to administration countries
  When I click hidden link by url regex "/administration\/countries\/\d+\/edit/"
  And I follow translated "administration.countries.form.new_region"
  And I fill in "country_regions_attributes_0_name" with "Region #1"
  And I follow translated "administration.countries.form.new_region"
  And I fill in "country_regions_attributes_1_name" with "Region #2"
  And I press translated "administration.countries.edit.view.button_update_country"
  And I click hidden link by url regex "/administration\/countries\/\d+\/edit/"
  And the "country_regions_attributes_0_name" field should contain "Region #1"
  And the "country_regions_attributes_1_name" field should contain "Region #2"

@_tested @selenium
Scenario: I can edit new region for given country
  Given there are no countries
  And Country Poland is created
  And I go to administration countries
  When I click hidden link by url regex "/administration\/countries\/\d+\/edit/"
  Then I follow translated "administration.countries.form.new_region"
  And I fill in "country_regions_attributes_0_name" with "Region #1"
  Then I follow translated "administration.countries.form.new_region"
  And I fill in "country_regions_attributes_1_name" with "Region #2"
  And I press translated "administration.countries.edit.view.button_update_country"
  And I click hidden link by url regex "/administration\/countries\/\d+\/edit/"
  And the "country_regions_attributes_0_name" field should contain "Region #1"
  And the "country_regions_attributes_1_name" field should contain "Region #2"

@_tested @selenium
Scenario: I can delete new region for given country
  Given there are no countries
  And Country Poland is created
  And country "Poland" has regions "Region #1, Region #2, Region #3"
  And I go to administration countries
  When I click hidden link by url regex "/administration\/countries\/\d+\/edit/" within "table#countries_table tbody tr:nth-of-type(3)"
  And I follow translated "administration.countries.form.delete_region"
  And I press translated "administration.countries.edit.view.button_update_country"
  And I click hidden link by url regex "/administration\/countries\/\d+\/edit/"
  Then I should not see field "country_regions_attributes_2_name"

