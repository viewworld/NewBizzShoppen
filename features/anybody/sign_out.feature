@m5 @tgn
Feature: Sign out

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role supplier
  Then I sign in as bob@person.com with password supersecret

  # Before logout, store in session the logout page (which will become login page after logout)
@_tested @_done @_deprecated
Scenario: If session is still there, just redirect to stored page when site is accessed
#   Given I follow translated "layout.main_menu.supplier.invoices"
#   When I follow "Logout bob@person.com"
#   And I sign in as bob@person.com with password supersecret
#   Then I should see translated "supplier.invoices.index.view.header"
