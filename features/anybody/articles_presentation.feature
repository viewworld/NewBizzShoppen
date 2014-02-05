# @articles @ao @_deprecated2014
# Feature: Articles presentation

# @m3 @_done
# Scenario: I can see article content by clicking on about us
#   Given I make sure current locale is "en"
#   And I am on the home page
#   When I follow "About us"
#   Then I should see "About us" within ".frm_head"
#   And I should see "About us" within ".frm_content"

# @m3 @_done
# Scenario: I can see blurb text on the sign up page
#   Given I make sure current locale is "en"
#   And I am on the home page
#   When I go to agent sign up
#   Then I should see "Blurb sign up"
#   When I go to supplier sign up
#   Then I should see "Blurb sign up"

# @m8 @ao @selenium @_done @_tested @added @ff5
# Scenario: I can see help text by clicking on question mark icon (...)
#   Given I make sure current locale is "en"
#   And I am on the home page
#   And I follow translated "home.show.view.forgotten_password_link"
#   And I follow translated "common.help_link"
#   And I wait 1 second
#   Then I should see "Reset password" within "div#colorbox"
