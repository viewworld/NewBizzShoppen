@user_accounts @$_call_centre  @m5 @tgn @faircalls
Feature: Call centre payout information update

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email call_centre@person.com and password supersecret and role call_centre
  And I visit domain http://faircalls.eu
  Then I sign in as call_centre@person.com with password supersecret

@_done @non_testable
Scenario: Call center has its Paypal data stored

  # SWIFT/BIC + IBAN
  # Remember to make these fields protected - we do not wnat anybody to update those without authotization :P
  # "Yes, if the agents do not have a pay pal account. They should be able
  # to register their international banking details."
@_done @non_testable
Scenario: Call center has its international bank data stored if doesnt have Paypal account

@_tested @_done
Scenario: I can update my payout information if I am a Call Center
  Given I go to my profile
  Then I fill in "user_call_centre_paypal_email" with "agentjim.jones.paypal@nbs.com"
  And I press translated "password.edit.view.button_update_user"
  Then I should see translated "my_profile.update.controller.successful_update_notice"
  Given I go to my profile
  And the "user_call_centre_paypal_email" field should contain "agentjim.jones.paypal@nbs.com"
  When I fill in "user_call_centre_paypal_email" with ""
  And I fill in "user_call_centre_bank_swift_number" with "ABNAPLPW"
  And I fill in "user_call_centre_bank_iban_number" with "AT123456789012345678"
  And I press translated "password.edit.view.button_update_user"
  Given I go to my profile
  And the "user_call_centre_bank_swift_number" field should contain "ABNAPLPW"
  And the "user_call_centre_bank_iban_number" field should contain "AT123456789012345678"

@m5 @tgn @added @_tested @_done @_deprecated
Scenario: I can define payout for the whole call centre
#  Given I am not sign in
#  And I am signed up and confirmed as user with email bob2@person.com and password supersecret and role call_centre
#  Then I sign in as bob2@person.com with password supersecret
#  When I go to my profile page
#  Then I fill in "user_call_centre_payout" with "21"
#  When I press translated "password.edit.view.button_update_user"
#  Then I should see translated "my_profile.update.controller.successful_update_notice"

@m5 @tgn @added @_tested @_done
Scenario: I can enter bank name and address
  Given I am not sign in
  And I am signed up and confirmed as user with email bob2@person.com and password supersecret and role call_centre
  Then I sign in as bob2@person.com with password supersecret
  When I go to my profile page
  Then I fill in "user_call_centre_bank_name" with "Int Bank de Geneve"
  Then I fill in "user_call_centre_bank_address_attributes_address_line_1" with "Grjdjde street 392a"
  Then I fill in "user_call_centre_bank_address_attributes_address_line_2" with "Zurich"
  Then I fill in "user_call_centre_bank_address_attributes_zip_code" with "23-23231"
  When I press translated "password.edit.view.button_update_user"
  Then I should see translated "my_profile.update.controller.successful_update_notice"