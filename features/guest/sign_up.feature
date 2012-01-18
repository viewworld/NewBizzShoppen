@user_accounts
Feature: Sign up feature

  @m6 @ao @_done @_tested
  Scenario: When I sign up set the country accordingly to selected language
    When I make sure current locale is "en"
    And I am on agent sign up page
    Then "user_agent_address_attributes_country_id" should be selected for value "United Kingdom"
    When I make sure current locale is "da"
    And I am on supplier sign up page
    Then "user_category_supplier_address_attributes_country_id" should be selected for value "Denmark"

  # 5779
  @m12 @$_guest @requested @tgn @_done @_tested @selenium @faircalls
  Scenario: When I am on sign up page, the coutry should be selected to my browser locale/country
    Given I am on the homepage
    And I visit domain http://faircalls.eu
    Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role agent
    And User bob@person.com with role agent is from country Denmark
    And I make sure current locale is "da"
    Then I sign in as bob@person.com with password supersecret
    And I go to agents leads
    Given Category Test category 1 is created
    And I go to agents leads
    And I select "Test category 1" from "category_id"
    And I follow translated "agent.leads.index.view.new_lead"
    Then "lead_country_id" should be selected for value "Denmark"

  #If the user chooses link he is prompted with a modal window with the text:
  #Thank you for linking, now lets set up your account. Please chose account type:
  #Sales manager (If you want to buy new leads to your business)
  #Procurement manager (If you want to a bid on you business)
  #Agent (If you are really good at creating new leads)
  #Cancel
  @m12 @$_guest @janrain @requested @is @_done @_not_testable
  Scenario: When I decide to sign up from home page then I should select a desired role in modal box (after I try to sign in with Facebook/Google/LinkedIn and ther is no account for it)

  @m12 @$_guest @janrain @requested @is @_done @_not_testable
  Scenario: When I choose role from modal box I should be redirected to proper user create form, with filled first name, last name and email

  #The user is automatically created in the applicable role for the category or role home page.
  @m12 @$_guest @janrain @requested @is @_done @_not_testable
  Scenario: When I decide to sign up from role home page or category home page account should be automatically assigned a applicable role

  #Great now we just need a little more information that we was not abel to get from your face book account please fill in: (A list of ONLY the mandatory fields)
  @m12 @$_guest @janrain @requested @is @_done @_not_testable
  Scenario: I should specify only mandatory information to create account with given role

  #User signs up via facebook
  #We can see that the same email is used in and link it to his account, so he can sign up via face book in the furtere.
  #He is loged in and redirected to his role homepage
  @m12 @$_guest @janrain @requested @is @_done @_not_testable
  Scenario: When I try to sing up with Facebook/Google and I already have Fairleads account with the same email they should be linked and login page should be displayed

  @m12 @$_guest @janrain @requested @is @_done @_not_testable
  Scenario: When I try to sing up with LinkedIn then the note about linking account should be displayed

  @m14 @requested @sign_up @$_customer @tgn @_done @_tested
  Scenario: I can't enable Team Buyers option when signing up
    When I am on the supplier home page
    And I follow translated "supplier_home.show.view.create_new_supplier_account"
    Then I should not see "Team buyers"

  @m21 @requested @subscriptions @tgn @_done @_tested
  Scenario: I can view popup with a blurb describing different subscription types
    When I am on the supplier home page
    And I follow translated "supplier_home.show.view.create_new_supplier_account"
    Then I should see "Blurb subscription select"

  @m21 @requested @subscriptions @tgn @_done @_tested
  Scenario: I can select a subscription type (will there be free on the list?)
    Given subscription plan exists with attributes "name:Premium supplier,assigned_roles:supplier,big_buyer:1"
    And subscription plan has following lines
    | name | price |
    | abc  | 23.0  |
    | def  | 11.0  |
    Given subscription plan exists with attributes "name:Ultra supplier,assigned_roles:supplier,big_buyer:1,team_buyers:1"
    And subscription plan has following lines
    | name | price |
    | abc  | 99.0  |
    | def  | 11.0  |
    When I am on the supplier home page
    And I follow translated "supplier_home.show.view.create_new_supplier_account"
    And I choose "user_category_supplier_subscription_plan_id"

  @m21 @requested @subscriptions @tgn @_done @_tested
  Scenario: I can select only subscription types which are active and match my role
    Given subscription plan exists with attributes "name:Premium supplier,assigned_roles:category_supplier,big_buyer:1"
    And subscription plan has following lines
    | name | price |
    | abc  | 23.0  |
    | def  | 11.0  |
    Given subscription plan exists with attributes "name:Ultra member,assigned_roles:member,big_buyer:1,team_buyers:1"
    And subscription plan has following lines
    | name | price |
    | abc  | 99.0  |
    | def  | 11.0  |
    When I am on the supplier home page
    And I follow translated "supplier_home.show.view.create_new_supplier_account"
    And I should see "Premium supplier"
    And I should not see "Ultra member"

    Given I visit domain http://fairdeals.dk
    When I follow translated "fairdeals_home.show.view.get_free_account"
    And I should not see "Premium supplier"
    And I should see "Ultra member"

  #9514
  @m26 @requested @tgn @_done @_tested_elsewhere
  Scenario: When I sign up from fairleads.com I should become a category supplier

  #9514
  @m26 @requested @tgn @_done @_tested_elsewhere @rspec
  Scenario: Every newly created category supplier should have a unique category (no buyout, default price taken from settings)

  #9563
  @m27 @requested
  Scenario: I should be automatically signed in when I sign up and email confirmation is turned off

  #9411
  @m27 @requested
  Scenario: I can select only subscription plan which is active and public