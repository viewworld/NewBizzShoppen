@m17 @procurement_front_page @ao
Feature: Front page for procurment

  @_done @_tested
  Scenario: When an user enters www.fairdeals.dk he will be redirected to Danish version of procurment
    Given a deal named "PrimaryGroupDeal" exists within category "Electronics deals"
    And a deal named "PrimaryGroupDeal" exists with attributes "published:1,group_deal:1,price:99,deal_price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "PrimaryGroupDeal" is a primary featured deal
    Given I visit domain http://fairdeals.dk
    Then locale should be set to "da"
    And I should see CSS path "#primary_group_deal"

  @_done @_tested
  Scenario: When an user enters www.fairdeals.eu he will be redirected to UK version of procurment
    Given I visit domain http://thefairdeals.com
    Then locale should be set to "en"

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
    Given I visit domain http://fairdeals.com
    Then I should see "1" elements within CSS path ".introduction_video"

  # Join - log in fairdeals: (as is “create procurement manager account”)
  @_done @_tested
  Scenario: I can create procurement manager account
    Given I visit domain http://thefairdeals.com
    And I follow translated "fairdeals_home.show.view.get_free_account"
    And I should see translated "member_accounts.new.view.header"

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
  @_done @_tested @_deprecated
  Scenario: I can browse news for Procurement manager
    #Given published purchase manager news exists with attributes "title:sample procurment news,content:quo vadis"
    #Given I visit domain http://fairdeals.dk
    #And I should see "sample procurment news"
    #And I should see "quo vadis"

  @_done @_tested
  Scenario: As not logged user I should have a menu on the right side with buttons
    Given I visit domain http://fairdeals.dk
    Then I should see CSS path ".homepage_actions"
    And I should see "3" elements within CSS path ".homepage_actions a"

  @_done @_tested
  Scenario: I should see one primary group deal
    Given a deal named "PrimaryGroupDeal" exists within category "Electronics deals"
    And a deal named "PrimaryGroupDeal" exists with attributes "published:1,group_deal:1,price:99,deal_price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "PrimaryGroupDeal" is a primary featured deal
    Given I visit domain http://fairdeals.dk
    Then I should see "PrimaryGroupDeal" within "div#primary_group_deal"

  @added @_done @_tested
  Scenario: I should not see one primary group deal when it has been disabled or expired
    Given a deal named "PrimaryGroupDeal" exists within category "Electronics deals"
    And a deal named "PrimaryGroupDeal" exists with attributes "published:1,group_deal:1,price:99,deal_price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "PrimaryGroupDeal" is a primary featured deal
    And deal named "PrimaryGroupDeal" has been unpublished
    Given I visit domain http://fairdeals.dk
    Then I should not see CSS path "div#primary_group_deal"

  @_done @_tested
  Scenario: I can select a primary deal to display by accessing the page with deal number in the URL like www.fairdeals.dk/1223
    Given a deal named "PrimaryGroupDeal" exists within category "Electronics deals"
    And a deal named "PrimaryGroupDeal" exists with attributes "published:1,group_deal:1,price:99,deal_price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "PrimaryGroupDeal" is a primary featured deal
    And a deal named "SecondaryGroupDeal" exists within category "Electronics deals"
    And a deal named "SecondaryGroupDeal" exists with attributes "published:1,group_deal:1,price:99,deal_price:200,discounted_price:50,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "PrimaryGroupDeal" is "1" secondary featured deal
    And I visit domain http://fairdeals.dk
    Then I should see "PrimaryGroupDeal" within "div#primary_group_deal"
    When I append id of deal "SecondaryGroupDeal" to url
    Then I should see "SecondaryGroupDeal" within "div#primary_group_deal"

  @_done @_tested
  Scenario: I should see three minor deals
    Given a deal named "PrimaryGroupDeal" exists within category "Electronics deals"
    And a deal named "PrimaryGroupDeal" exists with attributes "published:1,group_deal:1,price:99,deal_price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "PrimaryGroupDeal" is a primary featured deal
    And a deal named "SecondaryGroupDealOne" exists within category "Electronics deals"
    And a deal named "SecondaryGroupDealOne" exists with attributes "published:1,group_deal:1,price:99,deal_price:200,discounted_price:50,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "SecondaryGroupDealOne" is "1" secondary featured deal
    And a deal named "SecondaryGroupDealTwo" exists within category "Electronics deals"
    And a deal named "SecondaryGroupDealTwo" exists with attributes "published:1,group_deal:1,price:99,deal_price:200,discounted_price:50,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "SecondaryGroupDealTwo" is "2" secondary featured deal
    And a deal named "SecondaryGroupDealThree" exists within category "Electronics deals"
    And a deal named "SecondaryGroupDealThree" exists with attributes "published:1,group_deal:1,price:99,deal_price:200,discounted_price:50,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "SecondaryGroupDealThree" is "3" secondary featured deal
    And I visit domain http://fairdeals.dk
    Then I should see "PrimaryGroupDeal" within "div#primary_group_deal"
    Then I should see "SecondaryGroupDealOne" within "div#secondary_featured_deal_1"
    Then I should see "SecondaryGroupDealTwo" within "div#secondary_featured_deal_2"
    Then I should see "SecondaryGroupDealThree" within "div#secondary_featured_deal_3"

  @_done @_tested
  Scenario: I should not see three minor deals when they have been disabled or expired (the expired are excluded and next one takes his place)
    Given a deal named "PrimaryGroupDeal" exists within category "Electronics deals"
    And a deal named "PrimaryGroupDeal" exists with attributes "published:1,group_deal:1,price:99,deal_price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "PrimaryGroupDeal" is a primary featured deal
    And a deal named "SecondaryGroupDealOne" exists within category "Electronics deals"
    And a deal named "SecondaryGroupDealOne" exists with attributes "published:1,group_deal:1,price:99,deal_price:200,discounted_price:50,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "SecondaryGroupDealOne" is "1" secondary featured deal
    And a deal named "SecondaryGroupDealTwo" exists within category "Electronics deals"
    And a deal named "SecondaryGroupDealTwo" exists with attributes "published:1,group_deal:1,price:99,deal_price:200,discounted_price:50,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "SecondaryGroupDealTwo" is "2" secondary featured deal
    And a deal named "SecondaryGroupDealThree" exists within category "Electronics deals"
    And a deal named "SecondaryGroupDealThree" exists with attributes "published:1,group_deal:1,price:99,deal_price:200,discounted_price:50,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "SecondaryGroupDealThree" is "3" secondary featured deal
    And deal named "SecondaryGroupDealTwo" has been unpublished
    And I visit domain http://fairdeals.dk
    Then I should see "PrimaryGroupDeal" within "div#primary_group_deal"
    Then I should see "SecondaryGroupDealOne" within "div#secondary_featured_deal_1"
    Then I should not see "SecondaryGroupDealTwo" within "div#secondary_featured_deal_2"
    Then I should see "SecondaryGroupDealThree" within "div#secondary_featured_deal_2"

  #Compare with: huddlebuy.co.uk
  @_done @_tested
  Scenario: Featured group deal on the front page should have highlights, graphic and full description
    Given a deal named "PrimaryGroupDeal" exists within category "Electronics deals"
    And a deal named "PrimaryGroupDeal" exists with attributes "published:1,group_deal:1,price:99,deal_price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "PrimaryGroupDeal" is a primary featured deal
    And I visit domain http://fairdeals.dk
    # then I should see desc

  @_done @_tested
  Scenario: Featured group deal should have time left displayed
    Given a deal named "PrimaryGroupDeal" exists within category "Electronics deals"
    And a deal named "PrimaryGroupDeal" exists with attributes "published:1,group_deal:1,price:99,deal_price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "PrimaryGroupDeal" is a primary featured deal
    And I visit domain http://fairdeals.dk
    Then I should see CSS path "div.countdown .seconds_dash"

  @is @non_testable @_done
  Scenario: It should be possible to tweet the featured group deal

  @is @non_testable @_done
  Scenario: It should be possible to share on FB the featured group deal

  @is @non_testable @_done
  Scenario: It should be possible to share on Linkedin the featured group deal

  @tgn @_done @_tested @selenium
  Scenario: It should be possible to share by email the featured group deal
    Given a deal named "GroupDealA" exists within category "Electronics deals"
    And a deal named "GroupDealA" exists with attributes "published:1,group_deal:1,price:99,deal_price:100,discounted_price:25,social_media_description:super ultra deal social medias,start_date:01-01-2011,end_date:01-01-2013"
    Given I am signed up and confirmed as user with email purchase_manager@nbs.com and password secret and role member
    And I am on the homepage
    And I visit domain http://fairdeals.dk
    And I make sure current locale is "en"
    Then I sign in as purchase_manager@nbs.com with password secret
    And I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Electronics deals"
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
    And a deal named "GroupDealA" exists with attributes "published:1,group_deal:1,price:99,deal_price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    Given a deal named "GroupDealB" exists within category "Electronics deals"
    And a deal named "GroupDealB" exists with attributes "published:1,group_deal:1,price:99,deal_price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    Given a deal named "GroupDealC" exists within category "Electronics deals"
    And a deal named "GroupDealC" exists with attributes "published:1,group_deal:1,price:99,deal_price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    Given a deal named "GroupDealD" exists within category "Electronics deals"
    And a deal named "GroupDealD" exists with attributes "published:1,group_deal:1,price:99,deal_price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
    Then I sign in as bob@person.com with password supersecret
    And I follow translated "layout.main_menu.admin.featured_deals"
    And I select "GroupDealA (01.01.2011-01.01.2013)" from "featured_deals_0"
    And I select "GroupDealB (01.01.2011-01.01.2013)" from "featured_deals_1"
    And I select "GroupDealC (01.01.2011-01.01.2013)" from "featured_deals_2"
    And I select "GroupDealD (01.01.2011-01.01.2013)" from "featured_deals_3"
    And I select "GroupDealA (01.01.2011-01.01.2013)" from "featured_deals_4"
    And I select "GroupDealB (01.01.2011-01.01.2013)" from "featured_deals_5"
    And I select "GroupDealC (01.01.2011-01.01.2013)" from "featured_deals_6"
    And I select "GroupDealD (01.01.2011-01.01.2013)" from "featured_deals_7"
    And I select "GroupDealA (01.01.2011-01.01.2013)" from "featured_deals_8"
    And I select "GroupDealB (01.01.2011-01.01.2013)" from "featured_deals_9"
    And I select "GroupDealC (01.01.2011-01.01.2013)" from "featured_deals_10"
    And I select "GroupDealD (01.01.2011-01.01.2013)" from "featured_deals_11"
    And I select "GroupDealA (01.01.2011-01.01.2013)" from "featured_deals_12"
    And I select "GroupDealB (01.01.2011-01.01.2013)" from "featured_deals_13"
    And I select "GroupDealC (01.01.2011-01.01.2013)" from "featured_deals_14"
    And I select "GroupDealD (01.01.2011-01.01.2013)" from "featured_deals_15"
    And I press "Set featured deals"

  @is @tested_elsewhere @_done
  Scenario: As admin I can select three secondary featured deals to be displayed on procurement page

  #7450
  @m19 @requested @_done @_tested @tgn
  Scenario: I should see box with contact info: Phone number, Email, Skype on the home page
    Given I visit domain http://fairdeals.dk
    Then I should see translated "fairdeals_home.show.view.contact_us"
    And I should see "+44 0000000"
    And I should see "admin@fairleads.com"
    And I should see "fairleads_contact"

  #7449
  @m19 @requested @selenium @_done @_tested @tgn @hanging_js
  Scenario: I should see box where I can request deal from default deal admin, I should be able to fill in name, phone number, email and details of my request
    Given I am on the homepage
    Given I visit domain http://fairdeals.dk
    Given setting for "default_deal_admin_email" is set to "agent@nbs.com"
    Then I should see translated "fairdeals_home.show.view.request_a_deal"
    And I fill in "email_deal_request_preview_name" with "Ana Kasparian"
    And I fill in "email_deal_request_preview_email_from" with "anakasparian@tyt.com"
    And I fill in "email_deal_request_preview_phone_number" with "+44 4234254345"
    And I fill in "email_deal_request_preview_deal_description" with "I would like to buy a deal that..."
    And I press translated "fairdeals_home.show.view.deal_request.send_email_button"
    And I should see translated "deal_requests.create.flash.email_sent"
    And last email sent should have been sent to recipient "agent@nbs.com"
    And last email sent should have content "Name: Ana Kasparian"
    And last email sent should have content "Phone number: +44 4234254345"
    And last email sent should have content "E-mail: anakasparian@tyt.com"
    And last email sent should have content "Request: I would like to buy a deal that..."
    Given I visit domain http://localhost


  #7630
  @m19 @requested @group_deals @_done @_tested @rb
  Scenario: Group deal should be marked by a splash saying "Group deal" on the main page in the featured deal box
    Given a deal named "PrimaryGroupDeal" exists within category "Electronics deals"
    And a deal named "PrimaryGroupDeal" exists with attributes "published:1,group_deal:1,price:99,deal_price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "PrimaryGroupDeal" is a primary featured deal
    Given I visit domain http://fairdeals.dk
    And I should see "1" occurrences of css class "splash_red" for tag "div"
    And I should see translated "deals.index.view.group_deal_splash_label" within ".splash span"

  #7630
  @m19 @requested @group_deals @_tested @_done @tgn
  Scenario: On the main page in the featured group deal I should see how many leads were generated and how many are missing to reach the minimum (5 leads / 2 missing)
    Given a deal named "Abc group deal #1" exists within category "Electronics deals"
    And a deal named "Abc group deal #1" exists with attributes "published:1,group_deal:1,price:123,deal_price:100,discounted_price:25,social_media_description:quo vadis,created_leads:5,min_created_leads:7"
    And deal named "Abc group deal #1" is a primary featured deal
    Given I visit domain http://fairdeals.dk
    And I should see "5 leads / 2 missing"

  #7630
  @m19 @requested @group_deals @_tested @_done @tgn
  Scenario: As admin I can set per deal minimum number of leads that needs to be generated to give the displayed price
    Given a deal named "Abc group deal #1" exists with attributes "published:1,group_deal:1,price:123,deal_price:100,discounted_price:25,social_media_description:quo vadis,created_leads:5,min_created_leads:7"
    And I am on the homepage
    And I sign in as blazejek@gmail.com with password secret
    And I follow translated "layout.main_menu.admin.deals"
    And I follow translated "administration.deals.index.view.edit"
    And I fill in "deal_min_created_leads" with "22"
    And I press translated "administration.deals.edit.view.update_button"

  #7529
  @m20 @requested @non_testable @_done
  Scenario: Boxes with secondary featured deals should ber clickable

  @m21 @requested @is @tested_elsewhere @_done
  Scenario: I can select 6 backup featured deals

  @m21 @requested @is @tested_elsewhere @_done
  Scenario: When featured deal is unpublished then available backup deal should appear on the front page

  @m22 @requested @_done @_tested @ao
  Scenario: I should not see time countdown when deal is not a group deal
    Given a deal named "PrimaryDeal" exists within category "Electronics deals"
    And a deal named "PrimaryDeal" exists with attributes "published:1,group_deal:0,price:99,deal_price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "PrimaryDeal" is a primary featured deal
    And I visit domain http://fairdeals.dk
    Then I should not see CSS path "#countdown"

  @m22 @requested @_done @_tested @ao
  Scenario: I should see "Featured description" for the main featured deal
    Given a deal named "PrimaryDeal" exists within category "Electronics deals"
    And a deal named "PrimaryDeal" exists with attributes "featured_description:FeaturedDescriptionText,published:1,group_deal:0,price:99,deal_price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "PrimaryDeal" is a primary featured deal
    And I visit domain http://fairdeals.dk
    Then I should see "FeaturedDescriptionText" within "div.deal_desc"

  @m22 @requested @_done @_tested @ao
  Scenario: I should see "Short featured description" for the secondary featured deals
    Given a deal named "PrimaryDeal" exists within category "Electronics deals"
    And a deal named "PrimaryDeal" exists with attributes "featured_description:FeaturedDescriptionText,published:1,group_deal:0,price:99,deal_price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "PrimaryDeal" is a primary featured deal
    When a deal named "SecondaryGroupDeal" exists within category "Electronics deals"
    And a deal named "SecondaryGroupDeal" exists with attributes "short_featured_description:ShortDescription,published:1,group_deal:1,price:99,deal_price:200,discounted_price:50,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "SecondaryGroupDeal" is "1" secondary featured deal
    And I visit domain http://fairdeals.dk
    Then I should see "ShortDescription" within "div.other_deals"

  @m22 @requested @_done @_tested @ao
  Scenario: Non-group deal should be marked by a splash saying "Fair deal" on the main page in the featured deal box
    Given a deal named "PrimaryDeal" exists within category "Electronics deals"
    And a deal named "PrimaryDeal" exists with attributes "published:1,group_deal:0,price:99,deal_price:100,discounted_price:25,social_media_description:quo vadis,start_date:01-01-2011,end_date:01-01-2013"
    And deal named "PrimaryDeal" is a primary featured deal
    Given I visit domain http://fairdeals.dk
    And I should see "1" occurrences of css class "splash_red" for tag "div"
    And I should see translated "deals.index.view.fair_deal_splash_label" within ".splash span"

  #8883
  @m25 @requested @_done @nontestable
  Scenario: When deals are browsed by the arrows on the fairdeals page then transition effect should be added

  #8882
  @m25 @requested @_done @_tested
  Scenario: I can see a link with arrow underneath the featured deals to load all deals
    When I visit domain http://fairdeals.dk
    And I follow translated "fairdeals_home.show.view.see_all_deals"
    Then I should be on all deals page

  #8882
  @m25 @requested @_done @_tested
  Scenario: When See all deals is clicked then instead of featured deals first six deals are loaded
    When there are "20" existing deals
    And I visit domain http://fairdeals.dk
    And I follow translated "fairdeals_home.show.view.see_all_deals"
    Then I should see "5" elements within CSS path "div.other_deals"

  #8882
  @m25 @requested @_done @nontestable
  Scenario: When I scroll down the next six deals are loaded on the front page until all deals are loaded

  #8882
  @m25 @requested @_done @_tested
  Scenario: I should not see articles listing on the front page
    Given I visit domain http://fairdeals.dk
    Then I should not see CSS path "div.news"

  #9437
  @m26 @requested @ao @_done @non_testable
  Scenario: On fairdeals.dk and fairdeals.eu the certificate should be removed

  #9604
  @m27 @requested
  Scenario: I should see only 3 secondary deals on the front page instead of 9

  #9604
  @m27 @requested
  Scenario: I should always see Normal price, Fairdeals price, You save with percent and rating in primary featured deal on the front page

  #9604
  @m27 @requested
  Scenario: I should see featured description, rating and three prices in the secondary featured deal boxes on the front page

  #9604
  @m27 @requested
  Scenario: I should see deals listed in browse deals as primary deal on the front page

  #9811
  @m27 @requested
  Scenario: I should see splash saying Premium Deal when premium for this deal is enabled by admin or dealmaker