@comments @$_small_buyer
Feature: Comments - Small Buyer

Background:
   Given I am signed up and confirmed as "jon@lajoie.ca/secret"
   And someone is signed up and confirmed as "nice@guy.ca/secret"
   And I sign in as "jon@lajoie.ca/secret"
   And I go to the home page


 Scenario: I should be able to my comments


 Scenario: I should be able to view a comment

 
 Scenario: I should be able to see subject, date and comment author


 Scenario: I should be able to respond to a received comment


 Scenario: I should be able to see whether I already opened a comment


 Scenario: I should not be able to view someone else comments
   When I go to the public profile page for user "nice@guy.ca"
   And I follow "Send Message"
   And I fill in "Subject" with "First Message"
   And I fill in "Body" with "Hello"
   And I press "Send Message"
   And I sign out
   And I sign in as "nice@guy.ca/secret"
   And I follow "My Messages"
   And I go to the "First Message" message page
   Then I should be on the home page