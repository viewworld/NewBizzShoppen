@is @notifications @m0
Feature: Notifications

  @requested
  Scenario: I will receive an email with new leads from my interests

#  @requested @_done @_tested @wip @selenium
#  Scenario: I can subscribe by email to category
#    Given I am on the homepage
#    Then I sign in as buyer@nbs.com with password secret
#    Then I follow translated "layout.main_menu.shared.browse_leads"
#    Then I follow "Business"
#    Then category "Business" is in interests of user "buyer@nbs.com" "true"
#    Then I should see translated "leads.index.subscribe_to_category_cb"
#    Then I uncheck "subscribe_to_category"
#    Then I wait 4 second
#    Then category "Business" is in interests of user "buyer@nbs.com" "false"
#    Then I check "subscribe_to_category"
#    Then I wait 4 second
#    Then category "Business" is in interests of user "buyer@nbs.com" "true"

  @_done @_tested
  Scenario: I can subscribe by rss to category
    Given I am on the homepage
    Then I sign in as agent@nbs.com with password secret
    Then I follow translated "layout.main_menu.shared.browse_leads"
    Then I follow "Business"
    Then I should see translated "leads.index.subscribe_to_rss"