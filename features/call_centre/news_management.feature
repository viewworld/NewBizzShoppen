@call_center_news @m11 @requested @$_call_centre @is
Feature: News management for call centre

@_done @_tested @selenium
Scenario: A call centre manager should be able to post call centre news to all his agents.
  Given I am on the homepage
  And I visit domain http://faircalls.eu
  Then I sign in as translator_call_centre@nbs.com with password secret
  Then I follow translated "layout.main_menu.call_centre_agent.news"
  Then I follow translated "administration.news.index.view.new_news"
  And I open page in browser
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
  #For now there is no News tab for logged in user...
  #Then I sign in as translator_call_centre_agent@nbs.com with password secret
  #Then I should see "Interesting news! ;)"
  #Then I should see "super super super super"

  @_done @_tested_elsewhere
  Scenario: Call Centre can crate news (visible to all his agents)

  @_done @_tested_elsewhere
  Scenario: Call Centre can edit his news

  @_done @_tested_elsewhere
  Scenario: Call Centre can remove his news

  @_done @_tested_elsewhere
  Scenario: Call Centre can sort and filter his news

