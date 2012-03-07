@newsletter @_requested @$_system @m31
Feature: Newsletter backend

  Scenario: When a new list is created then it is created also in Campaign Monitor

  Scenario: When a new list is created for given owner for the the first time then client account is created in Campaign Monitor

  Scenario: When a new list is created then the subscribers are exported from the sources to Campaign Monitor

  Scenario: When a source of the list is updated (new contact, new user or new lead) then is should be synced with Campaign Monitor

  Scenario: When a source of the list is removed from the list then the subscribers should be removed from the list in Campaign Monitor

  Scenario: When a new source is added to existing list then the subscribers should be exported to that list in Campaign Monitor

  Scenario: When any previously exported subscriber from any source of any list is updated then is should be synced with Campaign Monitor

  Scenario: Bounces and cancellations of subscriptions should be synced back from Campaign Monitor to the local lists

  Scenario: When subscriber is exported to the Campaign Monitor then email, full name and the following custom fields should be included: company name and zip code

  Scenario: When supplier or category supplier has enabled newsletter manager feature then his/her client account should be created in Campaign Monitor (unless previously created)