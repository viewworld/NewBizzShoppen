@contact_us
Feature: Contact Us - Contact Us

In order to communicate with the admin
As a guest
I can go to the Contact Us page

 @3
 Scenario: I can contact using Contact Us page
   Given I am not signed in
   When I follow "Contact Us"
   And I fill in "Your name" with "Rara"
   And I fill in "Your email" with "socjopata@gmail.com"
   And I fill in "Your phone number" with "555555555"
   And I fill in "Subject" with "hi"
   And I fill in "Custom message" with "Some short note"
   And I fill correct captcha word
   And I press "Send"
   Then I should see "Email Has Been Sent"
   And last email sent should have "555555555" in the body