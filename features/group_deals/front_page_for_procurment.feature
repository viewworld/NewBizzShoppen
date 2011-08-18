@m17 @procurement_front_page @ao
Feature: Front page for procurment

  Scenario: When an user enters www.fairdeals.dk he will be redirected to Danish version of procurment

  Scenario: When an user enters www.fairdeals.eu he will be redirected to UK version of procurment

  # Top bar video as-fairleads, but uniqe video with jpeg
  @_done @_tested
  Scenario: There should be separate blurb and youtube video for the front page
    Given I am on the homepage
    And I make sure current locale is "en"
    And I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
    Then I sign in as bob@person.com with password supersecret
    Then I go to administration settings
    When I follow translated "administration.introduction_video.view.add_video"
    And I fill in "youtube_introduction_url" with "http://www.youtube.com/watch?v=SBjQ9tuuTJQ"
    And I select "en" from "youtube_introduction_locale_code"
    And I select "fairdeals" from "youtube_introduction_site"
    And I press translated "administration.introduction_video.new.view.button_create"
    And I make sure current locale is "en"
    Given I visit domain http://fairdeals.dk
    Then I should see "1" elements within CSS path ".introduction_video"

  # Join - log in fairdeals: (as is “create procurement manager account”)
  @_done @_tested
  Scenario: I can create procurement manager account
    Given I visit domain http://fairdeals.dk
    And I follow translated "fairdeals_home.show.view.sign_up_here"
    And I should see translated "purchase_manager_accounts.new.view.header"

  # Find a vender - make a tender: (as is ” Create a lead as procurement manager) Some field labels should be renamed in the create lead page:
  @is @_done @tested_elsewhere
  Scenario: I can create a lead as Procurement manager

  # Browse deals: as is - browse the deals
  @_done @_tested
  Scenario: I can browse deals
    Given I visit domain http://fairdeals.dk
    And I follow translated "layout.fairdeals.main_menu.deals"
    And I should see "Electronics deals"

  # News: As is - news listing for procurement manager.
  @_done @_tested
  Scenario: I can browse news for Procurement manager
    Given published purchase manager news exists with attributes "title:sample procurment news,content:quo vadis"
    Given I visit domain http://fairdeals.dk
    And I should see translated "purchase_manager_home.show.view.header_news"
    And I should see "sample procurment news"
    And I should see "quo vadis"

  Scenario: As not logged user I should have a menu on the right side with buttons

  Scenario: I should see one primary group deal

  Scenario: I can select a primary deal to display by accessing the page with deal number in the URL like www.fairdeals.dk/1223

  Scenario: I should see three minor deals

  #Compare with: huddlebuy.co.uk
  Scenario: Featured group deal on the front page should have highlights, graphic and full description

  Scenario: Featured group deal should have time left displayed

  @is
  Scenario: It should be possible to tweet the featured group deal

  @is
  Scenario: It should be possible to share on FB the featured group deal

  @is
  Scenario: It should be possible to share on Linkedin the featured group deal

  @tgn @_done @_tested @selenium
  Scenario: It should be possible to share by email the featured group deal
    Given a deal named "GroupDealA" exists within category "Electronics deals"
    And a deal named "GroupDealA" exists with attributes "published:1,group_deal:1,price:100,discounted_price:25,social_media_description:super ultra deal social medias,start_date:01-01-2011,end_date:01-01-2013"
    And I am on the homepage
    And I follow translated "layout.main_menu.shared.browse_deals"
    And I follow "Electronics deals"
    And I click hidden link by url regex "/\/deals\/\d+/"
    And I follow translated "deals.show.view.share_by_email"
    And I fill in "email_from" with "john_done@doe.com"
    And I fill in "email_to" with "jane1@doe.com"
    And I fill in "name" with "John Doe"
    And I press translated "deals.show.view.send_share_by_email_button"
    And last email sent should have content "super ultra deal social media" 
    And last email sent should have subject "John Doe wants to share the deal with you"


  Scenario: I can click get deal which generates a standard lead

  Scenario: I should be able to browse deals by the arrows on the left and right side of the big featured group deal

  @is @_tested @_done
  Scenario: As admin I can select primary featured deal to be displayed on procurement page
    Given I am on the homepage
    And I make sure current locale is "en"
    Given a deal named "GroupDealA" exists within category "Electronics deals"
    And a deal named "GroupDealA" exists with attributes "published:1,group_deal:1,price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    Given a deal named "GroupDealB" exists within category "Electronics deals"
    And a deal named "GroupDealB" exists with attributes "published:1,group_deal:1,price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    Given a deal named "GroupDealC" exists within category "Electronics deals"
    And a deal named "GroupDealC" exists with attributes "published:1,group_deal:1,price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    Given a deal named "GroupDealD" exists within category "Electronics deals"
    And a deal named "GroupDealD" exists with attributes "published:1,group_deal:1,price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
    Then I sign in as bob@person.com with password supersecret
    And I follow translated "layout.main_menu.admin.featured_deals"
    And I select "GroupDealA (01.01.2011-01.01.2013)" from "featured_deals_0"
    And I select "GroupDealB (01.01.2011-01.01.2013)" from "featured_deals_1"
    And I select "GroupDealC (01.01.2011-01.01.2013)" from "featured_deals_2"
    And I select "GroupDealD (01.01.2011-01.01.2013)" from "featured_deals_3"
    And I press "Set featured deals"

  @is @tested_elsewhere @_done
  Scenario: As admin I can select three secondary featured deals to be displayed on procurement page