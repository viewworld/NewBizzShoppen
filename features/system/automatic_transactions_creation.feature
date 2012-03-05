@transactions @$_system @m4 @tgn
Feature: Automatic transactions creation

@_done @_tested_elsewhere
Scenario: Transaction is automatically created for invoice when paypal payment has been processed

@m8 @_requested @_tested @_done
Scenario: Every lead purchase's price is converted to Euro according to current rate and saved in separate field
  Given Category Computers is created
  And Lead named "Monitors deal" exists within "Computers" category
  And lead Monitors deal has price 20.0
  And currency "DKK" exists with attributes "exchange_rate: 2.5"
  And lead "Monitors deal" has currency "DKK"
  And a lead Monitors deal exists within category Computers and is bought by user customer12@nbs.com with role supplier
  Then last purchase for lead "Monitors deal" has attributes "euro_price:8.0"

@m8 @_requested @_done @non_testable
Scenario: Backend for obtaining current Euro's rate