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
    Then I follow category "Business"
    Then category "Business" is in interests of user "buyer@nbs.com" "false"
    Then I should see translated "leads.index.subscribe_to_category_cb"
    Then I check "subscribe_to_category"
    Then I wait 4 second
    Then category "Business" is in interests of user "buyer@nbs.com" "true"
    Then I uncheck "subscribe_to_category"
    Then I wait 4 second
    Then category "Business" is in interests of user "buyer@nbs.com" "false"

  @_done @_tested @m11 @$_customer
  Scenario: I can subscribe by rss to category
    And I am on the homepage
    Then I sign in as buyer@nbs.com with password secret
    Then I follow translated "layout.main_menu.shared.browse_leads"
    Then I follow category "Business"
    Then I should see translated "leads.index.subscribe_to_rss"

  @m13 @requested @auto_buy @is @_done @_tested
  Scenario: I should receive email with direct link when I buy a lead
    Given I am on the homepage
    Then I sign in as buyer@nbs.com with password secret
    Then User buyer@nbs.com with role supplier is big buyer
    Then I follow translated "layout.main_menu.shared.browse_leads"
    Then I follow category "Business"
    Then I follow translated "leads.index.buy_lead"
    Then I should see translated "supplier.cart_items.create.flash.cart_item_bought_successful"
    Then last email sent should have been sent to recipient "buyer@nbs.com"
    Then last email sent should have content "/suppliers/lead_purchases/"
    Then last email sent should have subject "Bought lead notification"
    Then category "Business" has email template with subject "super hard rock metal core"
    Then I follow translated "leads.index.buy_lead"
    Then I should see translated "supplier.cart_items.create.flash.cart_item_bought_successful"
    Then last email sent should have been sent to recipient "buyer@nbs.com"
    Then last email sent should have content "/suppliers/lead_purchases/"
    Then last email sent should have subject "super hard rock metal core"

  @m13 @added @auto_buy @is @_done @_tested
    Scenario: I should not receive email with direct link when I buy a lead if I check Don't send me e-mails when i buy a lead in my profile
    Given I am on the homepage
    Then I sign in as buyer@nbs.com with password secret
    Then User buyer@nbs.com with role supplier is big buyer
    Then I follow translated "layout.my_profile_link"
    Then I check "user_supplier_disable_bought_notification"
    Then I press translated "password.edit.view.button_update_user"
    Then I follow translated "layout.main_menu.shared.browse_leads"
    Then I follow category "Business"
    Then I follow translated "leads.index.buy_lead"
    Then I should see translated "supplier.cart_items.create.flash.cart_item_bought_successful"
    Then no email has been send