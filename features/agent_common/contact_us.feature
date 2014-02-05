# @agent @ao @_requested @faircalls @_deprecated2014
# Feature: Common agent

#   @m6 @_done @_tested
#   Scenario: I should see agent specific contact us page
#     When I am signed up and confirmed as user with email ejdzent@nbs.com and password secret and role agent
#     And I am on the home page
#     And I visit domain http://faircalls.eu
#     And I sign in as ejdzent@nbs.com with password secret
#     And I follow translated "layout.contact_us"
#     Then I should see "Blurb agent contact us"
