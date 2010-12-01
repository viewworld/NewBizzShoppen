@news @$_admin @m3 @ao
Feature: News administration

Background: I am logged in as a system admin
  Given I am on the homepage
  And I make sure current locale is English
  And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  Then I sign in as jon@lajoie.ca with password secret

@_done
Scenario: I can see a listing of all news
  When there are 5 random news
  And I follow translated "layout.main_menu.admin.news"
  Then I should see "5" rows in a table within "#news_table"

@_done
Scenario: I can sort listing of all news by creation date and title
  When news exists with attributes "title:AAANews"
  And news exists with attributes "title:BBBNews"
  And I follow translated "layout.main_menu.admin.news"
  And I follow translated "administration.news.index.view.title"
  Then I should see "AAANews" before "BBBNews"
  When I follow translated "administration.news.index.view.title"
  Then I should see "BBBNews" before "AAANews"
  When I follow translated "administration.news.index.view.created_at"
  Then I should see "AAANews" before "BBBNews"
  When I follow translated "administration.news.index.view.created_at"
  Then I should see "BBBNews" before "AAANews"

@_done
Scenario: I can filter listing of all news by scope (buyers, agents, both) and by keyword (on title and content)
  When agent news exists with attributes "title:AgentNews"
  And buyer news exists with attributes "title:BuyerNews"
  And I follow translated "layout.main_menu.admin.news"
  Then I should see "AgentNews"
  And I should see "BuyerNews"
  When I select translated "administration.news.index.view.agent" from "search_with_scope"
  And I press translated "administration.news.index.view.search_button"
  Then I should see "AgentNews"
  And I should not see "BuyerNews"
  When I select translated "administration.news.index.view.buyer" from "search_with_scope"
  And I press translated "administration.news.index.view.search_button"
  Then I should see "BuyerNews"
  And I should not see "AgentNews"

@_done
Scenario: I can edit existing news entry
  When news exists with attributes "title:FirstNews"
  And I follow translated "layout.main_menu.admin.news"
  And I follow translated "administration.news.index.view.edit_link"
  And I fill in "article_news_title" with "OtherTitle"
  And I press translated "administration.news.edit.view.button_save"
  Then I should be on administration OtherTitle news page

@_done
Scenario: I can create new news entry
  When I follow translated "layout.main_menu.admin.news"
  And I press translated "administration.news.index.view.new_news"
  And I fill in "article_news_title" with "FirstNews"
  And I fill in "article_news_content" with "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  And I press translated "administration.news.new.view.button_create"
  And I should be on administration FirstNews news page

@_done
Scenario: I have to specify both title and content for news entry
  When I follow translated "layout.main_menu.admin.news"
  And I press translated "administration.news.index.view.new_news"
  And I fill in "article_news_title" with "FirstNews"
  And I press translated "administration.news.new.view.button_create"
  Then I should see "can't be blank"
  And I fill in "article_news_title" with ""
  And I fill in "article_news_content" with "lllorem"
  And I press translated "administration.news.new.view.button_create"
  Then I should see "can't be blank"

@_done
Scenario: I can specify if news should be displayed for buyers, agents or both(?)
  When I follow translated "layout.main_menu.admin.news"
  And I press translated "administration.news.index.view.new_news"
  And I select translated "administration.news.index.view.agent" from "article_news_scope"
  And I select translated "administration.news.index.view.buyer" from "article_news_scope"

Scenario: I can use WYSIWYG to edit news entry content

Scenario: I can upload and embed image into news entry

@_done
Scenario: I can filter between agent and buyer
  When agent news exists with attributes "title:AgentNews"
  And buyer news exists with attributes "title:BuyerNews"
  And I follow translated "layout.main_menu.admin.news"
  And I select translated "administration.news.index.view.agent" from "search_with_scope"
  And I press translated "administration.news.index.view.search_button"
  Then I should see "AgentNews"
  And I should not see "BuyerNews"

@_added @_done
Scenario: I can destroy news
  When news exists with attributes "title:FirstNews"
  And I follow translated "layout.main_menu.admin.news"
  Then I should see "FirstNews"
  And I follow translated "administration.news.index.view.delete_link"
  Then I should not see "FirstNews"

