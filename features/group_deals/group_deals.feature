@m17 @group_deals @is
Feature: Group deals

  @_done @_tested_elsewhere
  Scenario: Normal price, discounted, social media short deal info are mandatory

  @_done @_tested @tgn
  Scenario: Under browse deals, the group deals should be displayed on the top
    Given a deal named "Zzzzzzz group deal #1" exists within category "Electronics deals"
    And a deal named "Zzzzzzz group deal #1" exists with attributes "published:1,group_deal:1,price:11,deal_price:20,discounted_price:10,social_media_description:quo vadis"
    Given a deal named "Zzzzzzz group deal #2" exists within category "Electronics deals"
    And a deal named "Zzzzzzz group deal #2" exists with attributes "published:1,group_deal:1,price:11,deal_price:20,discounted_price:10,social_media_description:quo vadis"
    Given a deal named "Aaaaaa common deal #1" exists within category "Electronics deals"
    And a deal named "Aaaaaa common deal #1" exists with attributes "published:1,group_deal:0"
    Given a deal named "Dddddd common deal #1" exists within category "Electronics deals"
    And a deal named "Dddddd  common deal #1" exists with attributes "published:1,group_deal:0"
    And I am on the homepage
    And I make sure current locale is "en"
    And I visit domain http://fairdeals.eu
    And I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Electronics deals"
    Then I should see "Zzzzzzz group deal #1" before "Zzzzzzz group deal #2"
    Then I should see "Zzzzzzz group deal #2" before "Aaaaaa common deal #1"

