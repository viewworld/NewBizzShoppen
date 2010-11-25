@user_accounts @$_call_centre  @m0
Feature: Freelance agent payout information

  Scenario: Freelance has its Paypal data stored

  # SWIFT/BIC + IBAN
  # Remember to make these fields protected - we do not wnat anybody to update those without authotization :P
  # "Yes, if the agents do not have a pay pal account. They should be able
  # to register their international banking details."
  Scenario: Freelance agent has its international bank data stored if doesnt have Paypal account

  # "By default only call centers should be abel to register bank detalis,
  # but the admin should also be abel to let freelanceers enter banking
  # details."
  Scenario: I can update my payout information if I am a Freelance Agent and Admin allows me to do so
