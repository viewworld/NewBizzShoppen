@m16 @deals_rating_and_comments @_deals @requested @$_procurement_manager @tgn
Feature: Rating and comments

Background:
  Given I am signed up and confirmed as user with email purchase_manager88@nbs.com and password secret and role member
  And a deal named "Electrical deal" exists within category "Electronics deals"
  And a deal named "Electrical deal" exists with attributes "published:1"
  And I am on the homepage
  And I make sure current locale is "en"
  And I visit domain http://fairdeals.eu
  Then I sign in as purchase_manager88@nbs.com with password secret
  And I follow translated "layout.fairdeals.main_menu.deals"

@selenium @_tested @_done
Scenario: I can rate a a deal as a procurement manager
  When I follow category "Electronics deals"
  Then I should see CSS path "div.ajaxful-rating-wrapper"
  Then a deal named "Electrical deal" has rating set to "0"
  Then I click xpath "(//ul[@class='ajaxful-rating']//li)[5]/a"
  And I wait 2 second
  Then a deal named "Electrical deal" has rating set to "4"

@selenium @_tested @_done
Scenario: I can comment a deal
  When I follow category "Electronics deals"
  And I follow translated "deals.listing.create_comment"
  And I fill in "comment_title" with "New thread title" within ".lead_new_thread_container_div"
  And I fill in "comment_body" with "New thread body" within ".lead_new_thread_container_div"
  And I press translated "comments.threads.show.view.create_comment_button"
  Then I should see "New thread title"
  And I should see "New thread body"

@_tested @_done
Scenario: All comments regarding deals should be public
  Given I am not sign in
  And I follow translated "layout.fairdeals.main_menu.deals"
  When I follow category "Electronics deals"
  And I should see translated "deals.listing.no_comments"

#7802
@m20 @requested @is @_done @_tested
Scenario: I can see rating when I am not logged in or my role is not purchase manager
  When I sign out
  And I am on the home page
  And I follow translated "layout.fairdeals.main_menu.deals"
  And I follow category "Electronics deals"
  Then I should see CSS path "div.ajaxful-rating-wrapper"
  When I follow "Electrical deal"
  Then I should see CSS path "div.ajaxful-rating-wrapper"
  And I visit domain http://localhost
  When I am on the home page
  And I sign in as blazejek@gmail.com with password secret
  And I follow translated "layout.main_menu.shared.browse_deals"
  And I follow category "Electronics deals"
  Then I should see CSS path "div.ajaxful-rating-wrapper"
  When I follow "Electrical deal"
  Then I should see CSS path "div.ajaxful-rating-wrapper"
