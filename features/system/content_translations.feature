@translations @m2 @$_system
Feature: Content translations

Background:
  Given I am on the homepage
  And I go to leads

@tgn @_done @_tested_elsewhere
Scenario: I should see apropriate language version of the content if I change the language for the page

@tgn @_done @_tested
Scenario: Lead translations
  Given lead Printers ultimate deal exists within category Computers
  Given lead Printers ultimate deal exists with attributes "description:Description for printers deal"
  And lead "Printers ultimate deal" has translation for lang "dk" with attributes "header:Printere ultimative aftale,description:Beskrivelse til printere behandle,hidden_description:Skjult beskrivelse til printere behandle"
  When I follow translated "locales.dk_locale"
  Then I go to leads
  And I follow "Computers"
  Then I should see "Printere ultimative aftale"
  Then I should see "Beskrivelse til printere behandle"

@selenium @m3 @ao @_done
Scenario: News translations
  Given I make sure current locale is English
  And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  And I sign in as jon@lajoie.ca with password secret
  When I follow translated "layout.main_menu.admin.news"
  And I press translated "administration.news.index.view.new_news"
  And I fill in "article_news_title" with "[EN]FirstNews"
  And I fill in "article_news_content_editor" ckeditor with "[EN]Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  And I check "article_news_published"
  And I press translated "administration.news.edit.view.button_save"
  When I follow "DK" within "#langs_dropdown"
  When I follow translated "layout.main_menu.admin.news"
  And I follow translated "administration.news.index.view.edit_link"
  And I fill in "article_news_title" with "[DK]FirstNews"
  And I fill in "article_news_content_editor" ckeditor with "[DK]Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  And I press translated "administration.news.edit.view.button_save"
  And I should be on administration [DK]FirstNews news page
  And I should see "[DK]FirstNews"
  And I should see "[DK]Lorem"
  When I follow "EN" within "#langs_dropdown"
  And I am on administration [DK]FirstNews news page
  Then I should see "[EN]FirstNews"
  And I should see "[EN]Lorem"

@selenium @m3 @ao @_done
Scenario: Article translations
  Given I make sure current locale is English
  And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  And I sign in as jon@lajoie.ca with password secret
  When I follow translated "layout.main_menu.admin.articles"
  And I press translated "administration.articles.index.view.new_article"
  And I fill in "article_cms_title" with "[EN]FirstArticle"
  And I fill in "article_cms_content_editor" ckeditor with "[EN]Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  And I check "article_cms_published"
  And I press translated "administration.articles.edit.view.button_save"
  When I follow "DK" within "#langs_dropdown"
  When I follow translated "layout.main_menu.admin.articles"
  And I follow translated "administration.articles.index.view.edit_link"
  And I fill in "article_cms_title" with "[DK]FirstArticle"
  And I fill in "article_cms_content_editor" ckeditor with "[DK]Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  And I press translated "administration.articles.edit.view.button_save"
  And I should be on administration [DK]FirstArticle article page
  And I should see "[DK]FirstArticle"
  And I should see "[DK]Lorem"
  When I follow "EN" within "#langs_dropdown"
  And I am on administration [EN]FirstArticle article page
  Then I should see "[EN]FirstArticle"
  And I should see "[EN]Lorem"

@m3 @tgn
Scenario: Email translations

@tgn @_done @_tested_elsewhere
Scenario: Content language is displayed on the basis of choosen language
