@purchase_manager
Feature: Purchase Managers leads browsing

Background:
  Given I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  And I am on the home page
  And I sign in as jon@lajoie.ca with password secret

Scenario: I can filter leads by owner type (Purchase Manager) and Status (not published)

Scenario: I can publish leads created by Purchase Managers