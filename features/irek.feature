Feature: Irek

  @_done @_not_testable
  Scenario: I am automatically log out after 5 minutes

  @_done @_not_testable
  Scenario: I can see message box before I will be log out

  @_done @_not_testable
  Scenario: If I click Cancel on message box then I will be not log out

  @_done @_tested
  Scenario: After I log in to the system new Regular Log is created with start time and end time set to Time now and Time now plus 5 min
    Given I am on the homepage
    Then Count for model UserSessionLog is equal 0
    Then I sign in as agent@nbs.com with password secret
    Then Count for model UserSessionLog is equal 1
    Then Last regular UserSessionLog is valid after create
    Then I wait 5 second
    Then I follow translated "layout.main_menu.shared.browse_leads"
    Then Last regular UserSessionLog is valid after invoke some controller action
    Then I go to the logout page
    Then Last regular UserSessionLog is valid after close
    Then Count for model UserSessionLog is equal 1

  @_done @_tested_elsewhere
  Scenario: Before I log out, end time of current Regular Log is set to Time now

  @_done @_tested_elsewhere
  Scenario: Before I execute any controller action then end time of current Regular Log is set to Time now plus 5 min

  @wip
  Scenario: If I execute any campaign controller first time then new Campaign Log is created with start time and end time set to Time now and Time now plus 5 min
    Given I am on the homepage
    Then Count for model UserSessionLog is equal 0
    Then I sign in as agent@nbs.com with password secret
    Then Count for model UserSessionLog is equal 1
    Then I follow translated "layout.main_menu.call_centre_agent.campaigns"
    Then Count for model UserSessionLog is equal 2
    Then Last campaign UserSessionLog is valid after create
    Then I wait 5 second
    Then I follow translated "layout.main_menu.call_centre_agent.campaigns"
    Then Last campaign UserSessionLog is valid after invoke some controller action
    Then Last regular UserSessionLog is valid after invoke some controller action
    Then I follow translated "layout.main_menu.shared.browse_leads"
    Then Last campaign UserSessionLog is valid after close
    Then I follow translated "layout.main_menu.call_centre_agent.campaigns"
    Then Count for model UserSessionLog is equal 3
    Then Last campaign UserSessionLog is valid after create
    Then I wait 5 second
    Then I follow translated "layout.main_menu.call_centre_agent.campaigns"
    Then Last campaign UserSessionLog is valid after invoke some controller action
    Then I go to the logout page
    Then Last campaign UserSessionLog is valid after close
    Then Last regular UserSessionLog is valid after close

  @_done @_tested_elsewhere
  Scenario: If I execute any campaign controller next time then end time current Campaign Log is set to Time now plus 5 min

  @_done @_tested_elsewhere
  Scenario: If I execute any controller that is belongs to campaign controllers then end time of current Campaign Log is set to Time now

  @_done @_tested_elsewhere
  Scenario: Before I log out and Current Campaign Log exist then end time of this Log is set to Time now

#-----

  @_done @_tested
  Scenario: Buyer can see link to Interests on buyer home page if he don't have set any interests yet
    Given I am on the homepage
    Then I sign in as buyer@nbs.com with password secret
    Then I should not see translated "buyer_home.show.view.configure_interests_link"
    Then User with email buyer@nbs.com don't have interests
    Given I am on buyer home
    Then I should see translated "buyer_home.show.view.configure_interests_link"
    Then I follow translated "buyer_home.show.view.configure_interests_link"
    Then I should see translated "customer.interests.edit.view.title"

#-----

  @_done @_tested_elsewhere @selenium
  Scenario: A call centre manager should be able to post call centre news to all his agents.
    Given I am on the homepage
    Then I sign in as translator_call_centre@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre_agent.news"
    Then I follow translated "administration.news.index.view.new_news"
    Then I should see "Call centre news was successfully created."
    Then I should see "Editing news"
    Then I press translated "administration.news.edit.view.button_save"
    Then I should see "can't be blank"
    Then I fill in "news_title" with "Breakthrough news!!!!"
    Then I fill in "news_content_editor" ckeditor with "super super super super"
    Then I press translated "administration.news.edit.view.button_save"
    Then I follow translated "layout.main_menu.call_centre_agent.news"
    Then I should see "Breakthrough news!!!!"
    Then I follow translated "administration.news.index.view.new_news"
    Then I fill in "news_title" with "Attack of mars-not-human-being"
    Then I fill in "news_content_editor" ckeditor with "no no no no, no no no no"
    Then I press translated "administration.news.edit.view.button_save"
    Then I follow translated "layout.main_menu.call_centre_agent.news"
    Then I should see "Attack of mars-not-human-being"
    Then I fill in "search_with_keyword" with "Breakthrough"
    Then I press translated "administration.news.index.view.search_button"
    Then I should see "Breakthrough news!!!!"
    Then I should not see "Attack of mars-not-human-being"
    Then I follow translated "common.clear_filter"
    Then I should see "Breakthrough news!!!!"
    Then I should see "Attack of mars-not-human-being"
    Then I fill in "search_with_keyword" with "Breakthrough"
    Then I press translated "administration.news.index.view.search_button"
    Then I click hidden link by url regex "/call_centres\/news\/\d+\/edit/"
    Then I should see "Breakthrough news!!!!"
    Then I fill in "news_title" with "Interesting news! ;)"
    Then I check "news_published"
    Then I press translated "administration.news.edit.view.button_save"
    Then I follow translated "layout.main_menu.call_centre_agent.news"
    Then I should see "Interesting news! ;)"
    Then I should not see "Breakthrough news!!!!"
    Then I follow translated "administration.news.index.view.title"
    Then I should see "Attack of mars-not-human-being" before "Interesting news!"
    Then I follow translated "administration.news.index.view.title"
    Then I should see "Interesting news!" before "Attack of mars-not-human-being"
    Then I follow translated "administration.news.index.view.title"
    Then I fill in "search_with_keyword" with "mars"
    Then I press translated "administration.news.index.view.search_button"
    Then I execute js for display action block for "news_table"
    Then I confirm a js popup on the next step
    Then I follow translated "administration.news.index.view.delete_link"
    Then I follow translated "layout.main_menu.call_centre_agent.news"
    Then I should see "Interesting news! ;)"
    Then I should not see "mars"
    Then I go to the logout page
    Then I sign in as translator_call_centre_agent@nbs.com with password secret
    Then I should see "Interesting news! ;)"
    Then I should see "super super super super"

  @_done @_tested_elsewhere
  Scenario: Call Centre can crate news (visible to all his agents)

  @_done @_tested_elsewhere
  Scenario: Call Centre can edit his news

  @_done @_tested_elsewhere
  Scenario: Call Centre can remove his news

  @_done @_tested_elsewhere
  Scenario: Call Centre can sort and filter his news

  @_done @_tested_elsewhere
  Scenario: Call Centre Agent can see news created by his Call Centre

#-----

  Scenario: Agent can see his latest comments on home page
    And I have user with email customer2@nbs.com and role customer
    And user "customer2@nbs.com" with role "customer" has attributes "screen_name: Adam Savage"
    And a lead Lead#1 exists within category Business and is bought by user customer2@nbs.com with role customer
    And comment thread for lead "Lead#1" was posted by users "agent@nbs.com"
    And comment for lead "Lead#1" was posted by user "customer2@nbs.com" with attributes "title:First Lead1 comment, created_at: 2011-01-01, last_thread_created_at:2011-01-01"
    Given I am on the homepage
    And comments for lead "Lead#1" are read by by users "agent@nbs.com"
    Then I sign in as agent@nbs.com with password secret
    Given I am on agent home
    Then show me the page

#-----

  @_done @_tested
  Scenario: User can see created by in Lead Template edit view
    And I have user with email super@person.com role Agent first_name Irek last_name Skrobis and company_name Selleo
    Given template named "Special" for category "Electronics" is created by user "super@person.com" with role "agent"
    Given I am on the homepage
    Then I sign in as super@person.com with password secret
    Then I follow translated "layout.main_menu.shared.browse_leads"
    Then I follow translated "categories.index.view.view_lead_templates"
    Then I should see "Irek Skrobis"
    Then I should see translated "lead_templates.table.created_by"
    Then I follow translated "agent.lead_templates.index.view.edit"
    Then I should see "Irek Skrobis"
    Then I should see translated "agent.lead_templates.edit.view.created_by"

  @_done @_tested_elsewhere
  Scenario: User can see created by in Lead Templates listing

#-----

  @_done @_tested
  Scenario: There should not be Lead Templates tab for any user
    Given I am on the homepage
    Then I sign in as agent@nbs.com with password secret
    Then I should not see "Lead templates"
    Given I go to the logout page
    Given I am on the homepage
    Then I sign in as buyer@nbs.com with password secret
    Then I should not see "Lead templates"
    Given I go to the logout page
    Given I am on the homepage
    Then I sign in as translator_call_centre@nbs.com with password secret
    Then I should not see "Lead templates"
    Given I go to the logout page
    Given I am on the homepage
    Then I sign in as translator_customer@nbs.com with password secret
    Then I should not see "Lead templates"
    Given I go to the logout page
    Given I am on the homepage
    Then I sign in as translator_purchase_manager@nbs.com with password secret
    Then I should not see "Lead templates"
    Given I go to the logout page
    Given I am on the homepage
    Then I sign in as translator_category_buyer@nbs.com with password secret
    Then I should not see "Lead templates"
    Given I go to the logout page
    Given I am on the homepage
    Then I sign in as translator_call_centre_agent@nbs.com with password secret
    Then I should not see "Lead templates"

 #-----

  @_done @_tested
  Scenario: As Admin I can see Name (default Company Name, if empty then First Name + Last Name) in user listing
    Given I am on the homepage
    Then I sign in as blazejek@gmail.com with password secret
    And I have user with email super@person.com role CategoryBuyer first_name Irek last_name Skrobis and company_name Selleo
    And I go to administration users
    Then I should see "Selleo"
    Then I should not see "Irek"
    Then I should not see "Skrobis"
    Then User with email super@person.com has blank company name
    And I go to administration users
    Then I should not see "Selleo"
    Then I should see "Irek"
    Then I should see "Skrobis"

#-----

  @_done @_tested
  Scenario: Call centers is able to reset password to all his agents
    Given I am on the homepage
    Then I sign in as translator_call_centre@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre.call_centre_agents"
    Then I follow translated "call_centre.call_centre_agents.index.view.edit"
    Then I follow translated "call_centre.call_centre_agents.edit.view.reset_password_link"
    Then I should see translated "administration.password.destroy.flash.password_reset_successful"
    Then a call_center password reset message should be sent to translator_call_centre_agent@nbs.com

  @added @_done @_tested
  Scenario: Call centers is able to set password to all his agents
    Given I am on the homepage
    Then I sign in as translator_call_centre@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre.call_centre_agents"
    Then I follow translated "call_centre.call_centre_agents.index.view.edit"
    Then I follow translated "call_centre.call_centre_agents.edit.view.change_password_link"
    Then I fill in "password" with "3343secret33234"
    Then I fill in "user_password_confirmation" with "3343secret33234"
    Then I press translated "password.edit.view.button_update_user"
    Then I should see translated "password.flashes.successfully_changed"
    Then I go to the logout page
    Given I am on the homepage
    Then I sign in as translator_call_centre_agent@nbs.com with password 3343secret33234
    Then I should see translated "devise.sessions.signed_in"

  @_done @_tested
  Scenario: Call centers is able to skip email confirmation when creating new agent
    Given I am on the homepage
    Then I sign in as translator_call_centre@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre.call_centre_agents"
    Then I follow translated "call_centre.call_centre_agents.new.view.button_create"
    Then I should see "Skip email verification"
    Then I fill in "user_call_centre_agent_first_name" with "Johnny"
    Then I fill in "user_call_centre_agent_last_name" with "Cage"
    Then I fill in "user_call_centre_agent_screen_name" with "Movie Star"
    Then I fill in "user_call_centre_agent_password" with "secret"
    Then I fill in "user_call_centre_agent_password_confirmation" with "secret"
    Then I fill in "user_call_centre_agent_email" with "johnny_cage@mk.com"
    Then I check "user_call_centre_agent_skip_email_verification"
    Then I press "Create"
    Then I go to the logout page
    Given I am on the homepage
    Then I sign in as johnny_cage@mk.com with password secret
    Then I should see translated "devise.sessions.signed_in"

#-----

  @_done @not_testable
  Scenario: I can subscribe by email to category

  @_done @_tested
  Scenario: I can subscribe by rss to category
    Given I am on the homepage
    Then I sign in as agent@nbs.com with password secret
    Then I follow translated "layout.main_menu.shared.browse_leads"
    Then I follow "Business"
    Then I should see "leads.index.subscribe_to_rss"

