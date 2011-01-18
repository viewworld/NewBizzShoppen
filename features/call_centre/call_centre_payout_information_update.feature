@user_accounts @$_call_centre  @m5 @tgn
Feature: Call centre payout information update

Background:
  Given I am on the homepage
  And I make sure current locale is English
  And I am signed up and confirmed as user with email call_centre@person.com and password supersecret and role call_centre
  Then I sign in as call_centre@person.com with password supersecret

@_done @non_testable
Scenario: Call center has its Paypal data stored

  # SWIFT/BIC + IBAN
  # Remember to make these fields protected - we do not wnat anybody to update those without authotization :P
  # "Yes, if the agents do not have a pay pal account. They should be able
  # to register their international banking details."
@_done @non_testable
Scenario: Call center has its international bank data stored if doesnt have Paypal account

@_tested
Scenario: I can update my payout information if I am a Call Center
  Given I go to my profile
  Then I fill in "user_call_centre_paypal_email" with "agentjim.jones.paypal@nbs.com"
  And I press translated "password.edit.view.button_update_user"
  Then I should see translated "my_profile.update.controller.successful_update_notice"
  And the "user_call_centre_paypal_email" field should contain "agentjim.jones.paypal@nbs.com"
  When I fill in "user_call_centre_paypal_email" with ""
  And I fill in "user_call_centre_bank_swift_number" with "ABNAPLPW"
  And I fill in "user_call_centre_bank_iban_number" with "AT123456789012345678"
  And I press translated "password.edit.view.button_update_user"
  And the "user_call_centre_bank_swift_number" field should contain "ABNAPLPW"
  And the "user_call_centre_bank_iban_number" field should contain "AT123456789012345678"
