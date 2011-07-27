@m16 @deals_rating_and_comments @_deals @requested @$_procurement_manager
Feature: Rating and comments

Background:
  Given I am signed up and confirmed as user with email purchase_manager88@nbs.com and password secret and role purchase_manager
  And a deal named "Electrical deal" exists within category "Electronics deals"
  And a deal named "Electrical deal" exists with attributes "published:1"
  And I am on the homepage
  And I make sure current locale is "en"
  Then I sign in as purchase_manager88@nbs.com with password secret
  And I follow translated "layout.main_menu.shared.browse_deals"

@selenium
Scenario: I can rate a a deal as a procurement manager
  When I follow "Electronics deals"
  And I should see translated "deals.listing.rating_label"

@selenium @_tested @_done
Scenario: I can comment a deal
  When I follow "Electronics deals"
  And I follow translated "deals.listing.create_comment"
  And I fill in "comment_title" with "New thread title" within ".lead_new_thread_container_div"
  And I fill in "comment_body" with "New thread body" within ".lead_new_thread_container_div"
  And I press translated "comments.threads.show.view.create_comment_button"
  Then I should see "New thread title"
  And I should see "New thread body"

@_tested @_done
Scenario: All comments regarding deals should be public
  Given I am not sign in
  And I follow translated "layout.main_menu.shared.browse_deals"
  When I follow "Electronics deals"
  And I should see translated "deals.listing.no_comments"