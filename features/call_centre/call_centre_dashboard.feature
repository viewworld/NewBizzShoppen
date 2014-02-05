# @dashboard @$_call_centre @m0 @_deprecated2014
# Feature: Call centre dashboard

#   Scenario: I can follow “What do you want to do today?” links and they take me to appropriate places

#   Scenario: I can see statistics summaries (3-6 aggregated numbers)

#   Scenario: I can see 10 latest leads my agents created

#   Scenario: I can see 10 latest leads sold

#   Scenario: I can browse the complete list of recently sold leads

#   Scenario: I can see 5 message excerpts from buyers

#   @m5 @added @tgn @_tested @_done @faircalls
#   Scenario: When I go to home page then I should be on agent's home page
#     Given I visit domain http://faircalls.eu
#     And I am on the homepage
#     And I am signed up and confirmed as user with email bob2@person.com and password supersecret and role call_centre
#     Then I sign in as bob2@person.com with password supersecret
#     Then I should be on agent home
