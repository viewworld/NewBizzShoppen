@invoices @$_system @m4 @tgn @noguess
Feature: Invoice automatic processing

  Background:
    Given I am on the homepage
    And I make sure current locale is "en"

  @_done @_tested_elsewhere
  Scenario: Invoice should have invoice lines automatically generated for all non-paid leads for given user when created manually

  @_done @_tested_elsewhere
  Scenario: Automatically generated invoice lines are linked to leads bought

  @_done @_deprecated
  Scenario: Invoice is automatically generated after user goes to checkout

  @_done @_deprecated
  Scenario: Invoice is not automatically generated for big buyers (do big buyers use paypal to pay??)

  @_tested @_done
  Scenario: Invoice lines are marked as paid after payment has been processed by paypal
    Given I have user with email gerard.jones@paerson22.com and role supplier
    And an user with role lead_user and email lead_user.jones@paerson22.com exists as subaccount for customer gerard.jones@paerson22.com
    And lead Monitors deal exists within category Computers
    And lead Monitors deal is bought by user gerard.jones@paerson22.com with role supplier and is assigned to user lead_user.jones@paerson22.com with role lead_user
    And user with email "gerard.jones@paerson22.com" and role "supplier" has invoice for lead "Monitors deal" and transaction created by paypal
    Then invoice lines for last invoice are paid for user with email "gerard.jones@paerson22.com" and role "supplier"

  # @_done @_tested @_deprecated2014
  # Scenario: Invoice lines are marked as paid after invoice has been marked as paid by administrator (multiple types of  “payment” object)
  #   Given I have user with email gerard.jones@paerson22.com and role supplier
  #   And an user with role lead_user and email lead_user.jones@paerson22.com exists as subaccount for customer gerard.jones@paerson22.com
  #   And lead Monitors deal exists within category Computers
  #   And lead Monitors deal is bought by user gerard.jones@paerson22.com with role supplier and is assigned to user lead_user.jones@paerson22.com with role lead_user
  #   And user with email "gerard.jones@paerson22.com" and role "supplier" has invoice for lead "Monitors deal" and transaction created manually
  #   And I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  #   Then I sign in as bob@person.com with password supersecret
  #   And I go to administration invoices
  #   And I follow translated "administration.invoices.index.view.set_as_paid"
  #   Then invoice lines for last invoice are paid for user with email "gerard.jones@paerson22.com" and role "supplier"
