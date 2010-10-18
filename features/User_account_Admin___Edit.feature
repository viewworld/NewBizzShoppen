@user_accounts @$_admin @m1
Feature: User account Admin - Edit

 
 Scenario: I can edit user info (no password reset!)
   When I go to user administration page    
   Then I should see "customer_ann@domain.dom" for user "customer_ann@domain.dom”
   Then I should see "Agnes" for user "customer_agnes@domain.dom”
   Then I should see "Smith" for user "customer_agnes@domain.dom”
   Then I follow "Edit" for user "customer_agnes@domain.dom”
   Then I should see "Edit user"
   Then I fill in "user[phone_number]" with "0000000000"
   Then I fill in "user[first_name]" with "Sellna"
   Then I fill in "user[last_name]" with "Kyle"
   Then I press "Update user"
   Then I follow "Back to user listing"
   Then I should see "Listing users"
   Then I should see "customer_agnes@domain.dom" for user "customer_agnes@domain.dom”
   Then I should see "0000000000" for user "customer_agnes@domain.dom”
   Then I should see "Sellna" for user "customer_agnes@domain.dom”
   Then I should see "Kyle" for user "customer_agnes@domain.dom”