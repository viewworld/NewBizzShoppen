@translations @m2 @$_system
Feature: Content translations

Background:
  Given I am on the homepage
  And I go to browse leads

@tgn @_done @_tested_elsewhere
Scenario: I should see apropriate language version of the content if I change the language for the page

@tgn @_done @_tested
Scenario: Lead translations
  Given lead Printers ultimate deal exists within category Computers
  Given lead Printers ultimate deal exists with attributes "description:Description for printers deal"
  And lead "Printers ultimate deal" has translation for lang "da" with attributes "header:Printere ultimative aftale,description:Beskrivelse til printere behandle,hidden_description:Skjult beskrivelse til printere behandle"
  When I follow translated "locales.dk_locale"
  Then I go to browse leads
  And I follow category "Computers"
  Then I should see "Printere ultimative aftale"
  Then I should see "Beskrivelse til printere behandle"

@selenium @m3 @ao @_done
Scenario: News translations
  Given I make sure current locale is "en"
  And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  And I sign in as jon@lajoie.ca with password secret
  When I click hidden link by url regex "/administration\/news/"
  And I follow translated "administration.news.index.view.new_news"
  And I fill in "news_title" with "[EN]FirstNews"
  And I fill in "news_content_editor" ckeditor with "[EN]Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  And I check "news_published"
  And I press translated "administration.news.edit.view.button_save"
  When I click hidden link by url regex "/locales\/da/"
  When I click hidden link by url regex "/administration\/news/"
  And I click hidden link by url regex "/administration\/news\/\d+\/edit/"
  And I fill in "news_title" with "[DK]FirstNews"
  And I fill in "news_content_editor" ckeditor with "[DK]Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  And I press translated "administration.news.edit.view.button_save"
  And I should be on administration [DK]FirstNews news page
  And I should see "[DK]FirstNews"
  And I should see "[DK]Lorem"
  When I click hidden link by url regex "/locales\/en/"
  And I am on administration [DK]FirstNews news page
  Then I should see "[EN]FirstNews"
  And I should see "[EN]Lorem"

@selenium @m3 @ao @_done
Scenario: Article translations
  Given I make sure current locale is "en"
  And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  And I sign in as jon@lajoie.ca with password secret
  When I click hidden link by url regex "/administration\/articles/"
  And I follow translated "administration.articles.index.view.new_article"
  And I fill in "article_title" with "[EN]FirstArticle"
  And I fill in "article_content_editor" ckeditor with "[EN]Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  And I check "article_published"
  And I press translated "administration.articles.edit.view.button_save"
  When I click hidden link by url regex "/locales\/da/"
  When I click hidden link by url regex "/administration\/articles/"
  And I click hidden link by url regex "/administration\/articles\/\d+\/edit/"
  And I fill in "article_title" with "[DK]FirstArticle"
  And I fill in "article_content_editor" ckeditor with "[DK]Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  And I press translated "administration.articles.edit.view.button_save"
  And I should be on the homepage
  When I click hidden link by url regex "/administration\/articles/"
  And I fill in "search_with_keyword" with "FirstArticle"
  And I press translated "administration.articles.index.view.search_button"
  And I click hidden link by url regex "/administration\/articles\/\d+$/"
  And I should see "[DK]FirstArticle"
  And I should see "[DK]Lorem"
  When I click hidden link by url regex "/locales\/en/"
  And I am on administration [EN]FirstArticle article page
  Then I should see "[EN]FirstArticle"
  And I should see "[EN]Lorem"

@m3 @tgn @_tested @_done
Scenario: Email translations
  When email "confirmation_instructions" has translation for lang "da" with attributes "subject:Bekraeftelse instruktioner,body:Du kan bekraefte din konto via nedenstaende link"
  And confirmation email is sent for locale "da"
  Then last email sent should have content "Du kan bekraefte din konto via nedenstaende link"

@tgn @_done @_tested_elsewhere
Scenario: Content language is displayed on the basis of choosen language

@m8 @_requested @_done @non_testable @tgn
Scenario: Put a flag of language next to each field not only to translations when editing translatable content (for user to know in which language he is entering primary data)

#9400
@m26 @_requested @_done @non_testable @tgn
Scenario: All big supplier labels should be changed to Got credit