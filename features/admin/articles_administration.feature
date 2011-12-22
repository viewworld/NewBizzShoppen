@articles @$_admin @m3 @ao
Feature: Articles administration

Background: I am logged in as a system admin
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  Then I sign in as jon@lajoie.ca with password secret

@selenium @_done
Scenario: I can create new article
  When I click hidden link by url regex "/administration\/articles/"
  And I follow translated "administration.articles.index.view.new_article"
  And I fill in "article_title" with "MainPageArticle"
  And I fill in "article_content_editor" ckeditor with "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  And I press translated "administration.articles.edit.view.button_save"
  And I should be on administration articles page

@selenium @_done
Scenario: I can edit article
  When main page article exists with attributes "title:MainPageArticle,content:lorem"
  And I click hidden link by url regex "/administration\/articles/"
  And I click hidden link by url regex "/administration\/articles\/\d+\/edit/"
  And I fill in "article_title" with "OtherTitle"
  And I fill in "article_content_editor" ckeditor with "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  And I press translated "administration.articles.edit.view.button_save"
  Then I should be on the homepage

@_done
Scenario: I can browse articles with pagination
  When there are 5 main page articles
  And there are 10 interface content texts
  And there are 5 help popups
  And I follow translated "layout.main_menu.admin.articles"
  Then I should see "2" within ".pagination"

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
  And I select translated "administration.articles.index.view.main_page_articles" from "search_with_subclass"
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
  And I select translated "administration.articles.index.view.interface_content_texts" from "search_with_subclass"
  And I press translated "administration.articles.index.view.search_button"
  Then I should see "Interface content text"
  And I should not see "MainPageArticle"
  And I should not see "HelpPopup"

@_done
Scenario: I can filter articles to help only
  When main page article exists with attributes "title:MainPageArticle,content:lorem"
  And interface content text exists with attributes "title:InterfaceContentText,content:lorem,key:inter_1"
  And help popup exists with attributes "title:HelpPopup,content:lorem,key:help_1"
  And I follow translated "layout.main_menu.admin.articles"
  And I select translated "administration.articles.index.view.help_popups" from "search_with_subclass"
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
  And I fill in "search_with_keyword" with "MainPageArticle"
  And I press translated "administration.articles.index.view.search_button"
  Then I should see "MainPageArticle"
  And I follow translated "administration.articles.index.view.delete_link"
  And I fill in "search_with_keyword" with "MainPageArticle"
  And I press translated "administration.articles.index.view.search_button"
  Then I should not see "MainPageArticle"

@added @_done
Scenario: I can not destroy interface content text
  When interface content text exists with attributes "title:Blurb,key:blurb"
  And help popup exists with attributes "title:HelpPopup,key:help_popup"
  And I follow translated "layout.main_menu.admin.articles"
  Then I should see "Blurb"
  And I fill in "search_with_keyword" with "HelpPopup"
  And I press translated "administration.articles.index.view.search_button"
  And I should see "HelpPopup"
  And I should not see translated "administration.articles.index.view.delete_link"

@added @_done
Scenario: I can see link to edit article when viewing it with admin role
  When main page article exists with attributes "title:MainPageArticle,content:lorem,published:1"
  And I am on MainPageArticle article page
  Then I should see "Edit"

@added @_done
Scenario: I can't see link to edit article when viewing it without admin role
  When main page article exists with attributes "title:MainPageArticle,content:lorem,published:1"
  And I sign out
  And I am on MainPageArticle article page
  Then I should not see "Edit"

@added @_done
Scenario: I can see link to edit help popup when viewing it with admin role
  When help popup exists with attributes "title:HelpPopup,content:lorem,key:help_1,published:1"
  And I am on HelpPopup article page
  Then I should see "Edit"

@added @_done
Scenario: I can't see link to edit help popup when viewing it without admin role
  When help popup exists with attributes "title:HelpPopup,content:lorem,key:help_1,published:1"
  And I sign out
  And I am on HelpPopup article page
  Then I should not see "Edit"

@added @_done
Scenario: I can see link to edit blurb when viewing it with admin role
  When interface content text exists with attributes "title:Blurb,content:lorem,key:blurb_1,published:1"
  And I am on Blurb article page
  Then I should see "Edit"

@added @_done
Scenario: I can't see link to edit blurb when viewing it without admin role
  When interface content text exists with attributes "title:Blurb,content:lorem,key:blurb_1,published:1"
  And I sign out
  And I am on Blurb article page
  Then I should not see "Edit"

@added @_done
Scenario: I can see type of article on the listing
  When interface content text exists with attributes "title:Blurb,key:blurb"
  And help popup exists with attributes "title:HelpPopup,key:help_popup"
  And I follow translated "layout.main_menu.admin.articles"
  Then I should see translated "administration.articles.index.view.type"

@m5 @tgn @_tested @_done
Scenario: As admin, it should be possible to edit all kind of articles by displaying Edit link in interface when articles is listed or displayed
  Given I go to the home page
  Then I click hidden link by url regex "/administration\/articles\/\d+\/edit/"
  And I should see translated "administration.articles.edit.view.header" with options "name:Blurb supplier home"

#8603
@m23 @requested @_done @tested_elsewhere @rspec
Scenario: I can save a blurb with empty body

#8603
@m23 @requested @_done @non_testable
Scenario: When blurb has empty body it is not displayed (takes no space on the page)