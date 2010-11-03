@user_accounts @m1
Feature: User Account - Signout

Background: Sign in user and set English locale
  Given I am on the homepage
  And I make sure current locale is English
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  Then I sign in as bob@person.com with password supersecret

@_wip
Scenario: I can sign out
  Given I follow translated logout link for bob@person.com
  Then I should see translated "devise.sessions.signed_out"