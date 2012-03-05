@$_admin @m3 @currencies @noguess
Feature: Currencies administration

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  Then I sign in as jon@lajoie.ca with password secret

@ao @_done
Scenario: I should be able to see all defined currencies listing
  When I follow translated "layout.main_menu.admin.currencies"
  Then I should see "EUR" within "#currencies_table"
  And I should see "DKK" within "#currencies_table"

@ao @_done
Scenario: I should be able to define new currency with following attributes name:string, symbol:string, format:string, active:boolean
  When I follow translated "layout.main_menu.admin.currencies"
  And I press translated "administration.currencies.index.view.new_currency"
  And I fill in "currency_name" with "Złoty"
  And I fill in "currency_symbol" with "PLN"
  And I fill in "currency_format" with "%n %u"
  And I press translated "administration.currencies.new.view.button_create_currency"
  Then I should be on administration currencies
  And I should see "Złoty"
  And I should see "1,000.00 PLN"

@ao @_done
Scenario: I should be able to edit currency
  When I follow translated "layout.main_menu.admin.currencies"
  And I click hidden translated link "administration.currencies.index.view.edit"
  And I fill in "currency_name" with "US Dollar"
  And I fill in "currency_symbol" with "$"
  And I press translated "administration.currencies.edit.view.button_update_currency"
  Then I should be on administration currencies
  And I should see "US Dollar"
  And I should see "$1,000.00"
  
@ao @_done @_deprecated
Scenario: I should be able to destroy currency unless there are leads defined with that currency chosen
#  When I follow translated "layout.main_menu.admin.currencies"
#  And I delete "PLN" currency
#  Then I should not see "PLN"
#  When currency with name "PLN" exists
#  And lead LeadInPLN exists with currency "PLN"
#  And I follow translated "layout.main_menu.admin.currencies"
#  And I delete "PLN" currency
#  Then I should see "PLN"

@tgn @m5 @added @non_testable @_done
Scenario: There are currencies already defined in the system that are accepted by PayPal

#5936
@_requested @$_admin @m12 @tgn @_done @_tested
Scenario: I should be able to specify a default currency
  When I follow translated "layout.main_menu.admin.currencies"
  And I click hidden translated link "administration.currencies.index.view.edit"
  And I check "currency_global_default"
  And I press translated "administration.currencies.edit.view.button_update_currency"