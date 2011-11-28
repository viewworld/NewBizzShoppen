@system
Feature: Payments Paypal system

  # -------------------------------------------------------------------------------------------------------------------
  # System
  # -------------------------------------------------------------------------------------------------------------------

  @_done @tested_elsewhere @rspec
  Scenario: Payable subscription is represented additionally by subperiods

  @_done @tested_elsewhere @rspec
  Scenario: Each subperiod has subscription lines with prices proportionally calculated

  @_done @tested_elsewhere @rspec
  Scenario: Each subperiod should have stored the total amount of it's subscription lines

  @_done @tested_elsewhere @rspec
  Scenario: Each subperiod should have it's billing date

  @system
  Scenario: Each subperiod is attached to an invoice

  @system
  Scenario: Each subperiod can be marked as paid

  @_done @tested_elsewhere @rspec
  Scenario: When subscription ends prematurly (upgrade or change by admin) then upcoming subperiods should be deleted

  @_done @tested_elsewhere @rspec
  Scenario: When subscription ends prematurly (upgrade or change by admin) then the current subperiod should be recalculated

  @_done @tested_elsewhere @rspec
  Scenario: Subperiods for user are generated with each new subscription

  @_done @tested_elsewhere @rspec
  Scenario: User subscription debts should be based on subperiods

