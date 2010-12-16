@articles @$_admin @m3 @ao
Feature: Articles administration

Background: I am logged in as a system admin
  Given I am on the homepage
  And I make sure current locale is English
  And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  Then I sign in as jon@lajoie.ca with password secret

@selenium @_done
Scenario: I can create new article
  When I follow translated "layout.main_menu.admin.articles"
  And I press translated "administration.articles.index.view.new_article"
  And I fill in "article_title" with "MainPageArticle"
  And I fill in "article_content_editor" ckeditor with "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  And I press translated "administration.articles.edit.view.button_save"
  And I should be on administration MainPageArticle article page

@selenium @_done
Scenario: I can edit article
  When main page article exists with attributes "title:MainPageArticle,content:lorem"
  And I follow translated "layout.main_menu.admin.articles"
  And I follow translated "administration.articles.index.view.edit_link"
  And I fill in "article_title" with "OtherTitle"
  And I fill in "article_content_editor" ckeditor with "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  And I press translated "administration.articles.edit.view.button_save"
  Then I should see "OtherTitle"

@_done
Scenario: I can browse articles with pagination
  When there are 3 random cms articles
  And pagination per page size in model Article::Cms is set to 1
  And I follow translated "layout.main_menu.admin.articles"
  Then I should see "3" within ".pagination"

@_done
Scenario: I can search through the articles
  When main page article exists with attributes "title:FirstArticle,content:lorem"
  And main page article exists with attributes "title:SecondArticle,content:lorem"
  And I follow translated "layout.main_menu.admin.articles"
  When I fill in "search_with_keyword" with "first"
  And I press translated "administration.articles.index.view.search_button"
  Then I should see "FirstArticle"
  And I should not see "SecondArticle"

@_done
Scenario: I can filter articles to articles only
  When main page article exists with attributes "title:MainPageArticle,content:lorem"
  And interface content text exists with attributes "title:InterfaceContentText,content:lorem,key:inter_1"
  And help popup exists with attributes "title:HelpPopup,content:lorem,key:help_1"
  And I follow translated "layout.main_menu.admin.articles"
  And I select translated "administration.articles.index.view.main_page_article" from "search_with_scope"
  And I press translated "administration.articles.index.view.search_button"
  Then I should see "MainPageArticle"
  And I should not see "InterfaceContentText"
  And I should not see "HelpPopup"

@_done
Scenario: I can filter articles to blurb only
  When main page article exists with attributes "title:MainPageArticle,content:lorem"
  And interface content text exists with attributes "title:InterfaceContentText,content:lorem,key:inter_1"
  And help popup exists with attributes "title:HelpPopup,content:lorem,key:help_1"
  And I follow translated "layout.main_menu.admin.articles"
  And I select translated "administration.articles.index.view.interface_content_text" from "search_with_scope"
  And I press translated "administration.articles.index.view.search_button"
  Then I should see "InterfaceContentText"
  And I should not see "MainPageArticle"
  And I should not see "HelpPopup"

@_done
Scenario: I can filter articles to help only
  When main page article exists with attributes "title:MainPageArticle,content:lorem"
  And interface content text exists with attributes "title:InterfaceContentText,content:lorem,key:inter_1"
  And help popup exists with attributes "title:HelpPopup,content:lorem,key:help_1"
  And I follow translated "layout.main_menu.admin.articles"
  And I select translated "administration.articles.index.view.help_popup" from "search_with_scope"
  And I press translated "administration.articles.index.view.search_button"
  Then I should see "HelpPopup"
  And I should not see "InterfaceContentText"
  And I should not see "MainPageArticle"

@_done
Scenario: I can view the article
  When main page article exists with attributes "title:MainPageArticle,content:lorem"
  And I am on administration MainPageArticle article page
  Then I should see "MainPageArticle"
  And I should see "lorem"

@added @_done
Scenario: I can destroy main page article
  When main page article exists with attributes "title:MainPageArticle"
  And I follow translated "layout.main_menu.admin.articles"
  Then I should see "MainPageArticle"
  And I follow translated "administration.articles.index.view.delete_link"
  Then I should not see "MainPageArticle"

@added @_done
Scenario: I can not destroy interface content text
  When interface content text exists with attributes "title:Blurb,key:blurb"
  And help popup exists with attributes "title:HelpPopup,key:help_popup"
  And I follow translated "layout.main_menu.admin.articles"
  Then I should see "Blurb"
  And I should see "HelpPopup"
  And I should not see translated "administration.articles.index.view.delete_link"
