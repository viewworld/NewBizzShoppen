@newsletter @_requested @$_system @m31 @ao
Feature: Newsletter backend

  @_done @_tested_elsewhere @_rspec
  Scenario: When a new list is created then it is created also in Campaign Monitor

  @_done @_tested_elsewhere @_rspec
  Scenario: When list is created in Campaigns monitor or owner then the ListID or the ClientID is stored locally

  @_done @_tested_elsewhere @_rspec
  Scenario: When a new list is created for given owner for the the first time then client account is created in Campaign Monitor

  @_done @_tested_elsewhere @_rspec
  Scenario: When owner is updated then he/she should be synced to Campaign monitor

  @_done @_tested_elsewhere @_rspec
  Scenario: When a new list is created then the subscribers are exported from the sources to Campaign Monitor

  @_done @_tested_elsewhere @_rspec
  Scenario: When a source of the list is updated (new contact, new user or new lead) then is should be synced with Campaign Monitor

  @_done @_tested_elsewhere @_rspec
  Scenario: When a source of the list is removed from the list then the subscribers should be removed from the list in Campaign Monitor (it applies also to tags that may be the source)

  @_done @_tested_elsewhere @_rspec
  Scenario: When a new source is added to existing list then the subscribers should be exported to that list in Campaign Monitor

  Scenario: When any previously exported subscriber from any source of any list is updated then is should be synced with Campaign Monitor

  Scenario: Bounces and cancellations of subscriptions should be synced back from Campaign Monitor to the local lists

  Scenario: When subscriber's email is unsubscribed or bounced then it should be removed from all list's sources and black listed from future usage (user should have newsletter flag off)

  Scenario: When subscriber is exported to the Campaign Monitor then email, full name and the following custom fields should be included: company name and zip code

  @_done @_tested_elsewhere @_rspec
  Scenario: When supplier or category supplier has enabled newsletter manager feature then his/her client account should be created in Campaign Monitor (unless previously created)