@news @$_admin @m3 @ao
Feature: News administration

Background: I am logged in as a system admin
  Given I am on the homepage
  And I make sure current locale is English
  And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  Then I sign in as jon@lajoie.ca with password secret

@_done
Scenario: I can see a listing of all news
  When there are 3 agent news
  And there are 2 purchase manager news
  And I follow translated "layout.main_menu.admin.news"
  Then I should see "5" rows in a table within "#news_table"

@_done
Scenario: I can sort listing of all news by creation date and title
  When agent news exists with attributes "title:AAANews"
  And agent news exists with attributes "title:BBBNews"
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
  When published agent news exists with attributes "title:AgentNews"
  And published buyer news exists with attributes "title:BuyerNews"
  And I follow translated "layout.main_menu.admin.news"
  Then I should see "AgentNews"
  And I should see "BuyerNews"
  When I select translated "administration.news.index.view.agents" from "search_with_subclass"
  And I press translated "administration.news.index.view.search_button"
  Then I should see "AgentNews"
  And I should not see "BuyerNews"
  When I select translated "administration.news.index.view.buyers" from "search_with_subclass"
  And I press translated "administration.news.index.view.search_button"
  Then I should see "BuyerNews"
  And I should not see "AgentNews"

@_done @selenium
Scenario: I can edit existing news entry
  When agent news exists with attributes "title:FirstNews"
  And I follow translated "layout.main_menu.admin.news"
  And I click hidden link by url regex "/administration\/news\/\d+\/edit/"
  And I fill in "news_title" with "OtherTitle"
  And I fill in "news_content_editor" ckeditor with "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  And I press translated "administration.news.edit.view.button_save"
  Then I should be on administration OtherTitle news page

@selenium @_done
Scenario: I can create new news entry
  When I follow translated "layout.main_menu.admin.news"
  And I follow translated "administration.news.index.view.new_news"
  And I fill in "news_title" with "FirstNews"
  And I fill in "news_content_editor" ckeditor with "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  And I press translated "administration.news.edit.view.button_save"
  And I should be on administration FirstNews news page

@selenium @_done
Scenario: I have to specify both title and content for news entry
  When I follow translated "layout.main_menu.admin.news"
  And I follow translated "administration.news.index.view.new_news"
  And I fill in "news_title" with "FirstNews"
  And I press translated "administration.news.edit.view.button_save"
  Then I should see "can't be blank"
  And I fill in "news_title" with ""
  And I fill in "news_content_editor" ckeditor with "lllorem"
  And I press translated "administration.news.edit.view.button_save"
  Then I should see "can't be blank"

@_done @selenium
Scenario: I can specify if news should be displayed for buyers, agents or both(?)
  When I follow translated "layout.main_menu.admin.news"
  And I follow translated "administration.news.index.view.new_news"
  And I select translated "administration.news.index.view.agents" from "news_scope"
  And I select translated "administration.news.index.view.buyers" from "news_scope"

@selenium @_done
Scenario: I can use WYSIWYG to edit news entry content
  When I follow translated "layout.main_menu.admin.news"
  And I follow translated "administration.news.index.view.new_news"
  Then I should see ckeditor on the page

@_done @nontestable
Scenario: I can upload and embed image into news entry

@_done
Scenario: I can filter between agent and buyer
  When published agent news exists with attributes "title:AgentNews"
  And published buyer news exists with attributes "title:BuyerNews"
  And I follow translated "layout.main_menu.admin.news"
  And I select translated "administration.news.index.view.agents" from "search_with_subclass"
  And I press translated "administration.news.index.view.search_button"
  Then I should see "AgentNews"
  And I should not see "BuyerNews"

@added @_done
Scenario: I can destroy news
  When agent news exists with attributes "title:FirstNews"
  And I follow translated "layout.main_menu.admin.news"
  Then I should see "FirstNews"
  And I follow translated "administration.news.index.view.delete_link"
  Then I should not see "FirstNews"

# It works i you create at new news
# Right - after creating new news article, the back option should redirect to news listing
@m5 @ao
Scenario: When you edit a news article you should be able to cancel, and have the back option.

@m5 @category_home_pages @ao @_done
Scenario: I can see all news for categories
  When Category named "Best Leads" already exists
  And there is a published news for category "Best Leads"
  And Category named "Worst Leads" already exists
  And there is a published news for category "Worst Leads"
  And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  And I am on the home page
  And I sign in as jon@lajoie.ca with password secret
  And I follow translated "layout.main_menu.admin.news"
  And I select translated "administration.news.index.view.category_homes" from "search_with_subclass"
  And I press translated "administration.news.index.view.search_button"
  Then I should see "2" rows in a table within "#news_table"

@m5 @category_home_pages @ao @selenium @_done
Scenario: I can update and change category for category news
  When Category named "Best Leads" already exists
  And Category named "Worst Leads" already exists
  And there is a published news for category "Best Leads"
  And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  And I am on the home page
  And I sign in as jon@lajoie.ca with password secret
  And I follow translated "layout.main_menu.admin.news"
  And I select translated "administration.news.index.view.category_homes" from "search_with_subclass"
  And I press translated "administration.news.index.view.search_button"
  And I click hidden link by url regex "/administration\/news\/\d+\/edit/"
  And I fill in "news_title" with "NewsForWorstLeads"
  And I select "Worst Leads" from "news_resource_id"
  And I press translated "administration.news.edit.view.button_save"
  And I am on category home page for Worst Leads
  Then I should see "1" items on a list within "#news"
  And I should see "NewsForWorstLeads"

@m5 @category_home_pages @ao @selenium @_done
Scenario: I can create news for category
  When Category named "Best Leads" already exists
  And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  And I am on the home page
  And I sign in as jon@lajoie.ca with password secret
  And I follow translated "layout.main_menu.admin.news"
  And I select translated "administration.news.index.view.category_homes" from "subclass"
  And I follow translated "administration.news.index.view.new_news"
  And I fill in "news_title" with "NewsForBestLeads"
  And I select "Best Leads" from "news_resource_id"
  And I fill in "news_content_editor" ckeditor with "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  And I check "news_published"
  And I press translated "administration.news.edit.view.button_save"
  And I am on category home page for Best Leads
  Then I should see "1" items on a list within "#news"
  And I should see "NewsForBestLeads"

