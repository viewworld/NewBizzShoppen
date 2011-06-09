@is @notifications
Feature: Notifications

  #5941
  #instantly by default
  @requested @m12 @tgn @_done @non_testable @$_customer
  Scenario: I will receive an email with new lead from categories I am subscribed to instantly when it appears

  @requested @m12 @tgn @_done @non_testable
  Scenario: I will receive an email with all new leads from categories I am subscribed to once a days or once a week

  #5941
  #The text schould be "Notify me on new leads.
  @requested @m12 @_done @_tested @selenium @is @$_customer
  Scenario: I can subscribe by email to category
    Given I am on the homepage
    Then I sign in as buyer@nbs.com with password secret
    Then I follow translated "layout.main_menu.shared.browse_leads"
    Then I follow "Business"
    Then category "Business" is in interests of user "buyer@nbs.com" "true"
    Then I should see translated "leads.index.subscribe_to_category_cb"
    Then I uncheck "subscribe_to_category"
    Then I wait 4 second
    Then category "Business" is in interests of user "buyer@nbs.com" "false"
    Then I check "subscribe_to_category"
    Then I wait 4 second
    Then category "Business" is in interests of user "buyer@nbs.com" "true"

  @_done @_tested @m11 @$_customer
  Scenario: I can subscribe by rss to category
    Given I am on the homepage
    Then I sign in as agent@nbs.com with password secret
    Then I follow translated "layout.main_menu.shared.browse_leads"
    Then I follow "Business"
    Then I should see translated "leads.index.subscribe_to_rss"