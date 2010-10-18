@user_accounts @$_call_centre @m1
Feature: User account Admin - Listing Manage

 Background:
   Given I am logged in as "admin@domain.dom/secret"


 Scenario: I can browse users with pagination
   When I go to user administration page
   Then I should see "Listing users"
   Then I follow "2"
   Then I should see "Listing users"
   Then I follow "1"

 
 Scenario: I can sort users


 Scenario: I can filter users [...]


 Scenario: I can reset password for a user
   Given there are email templates prepared in database
   When I go to user administration page
   And I follow "Edit" for user "customer_agnes@domain.dom”
   And I follow "Reset password"
   Then I should see "Reset password sent successfully"
   Then a reset password message should be sent to "customer_agnes@domain.dom”

 
 Scenario: I can set the user to blocked and to unblocked

# what should happen to all objects that he is connected too?
# is there any case when we cant delete a user?
 
 Scenario: I can delete user
   When I go to user administration page
   Then I should see "customer_agnes@domain.dom"
   Then I should see "customer_ann@domain.dom"
   Then I follow "Destroy" for user "customer_ann@domain.dom"
   Then I should see "User has been successfully deleted."
   Then element "customer_ann@domain.dom" which is "email" should have value "Restore" for User
   Then I follow "Active"
   Then I should not see "customer_ann@domain.dom"
   Then I should see "customer_agnes@domain.dom"
   Then I follow "Deleted"
   Then I should see "customer_ann@domain.dom"
   Then I should not see "customer_agnes@domain.dom"

 
 Scenario: Blocked or deleted user can not ask for password in forgot password


   Scenario: Deleted user shouldn't be able to login
    Given I am logged out
    And user "user@domain.dom" is deleted
    When I go to the homepage
    And I am logged in as "user@domain.dom/secret"
    Then I should see "Invalid email or password"

Scenario: I can invoice an account

Scenario: I can toggle select/deselect accounts on active page
Scenario: I can perform a bulk block action
Scenario: I can perform a bulk invoice action