@translations @m2
Feature: Internationalization core

Background:
  Given I am on the homepage

@tgn @_done @_tested
Scenario: First visit gets the user to the US language page
  Then locale is set to "en" for translation "home.show.view.header"

@nontestable @_done @bk
Scenario: Selected language is stored in session

@tgn @_done @_tested
Scenario: I can change the language by selecting a flag on the interface
  When locale is set to "en" for translation "home.show.view.header"
  And I follow translated "locales.dk_locale"
  Then locale is set to "dk" for translation "home.show.view.header"

@tgn @_done @_tested
Scenario: The interface is displayed in English if English language is selected
  When I follow translated "locales.en_locale"
  Then locale is set to "en" for translation "home.show.view.header"

@tgn @_done @_tested
Scenario: The interface is displayed in Danish if Danish language is selected
  When I follow translated "locales.dk_locale"
  Then locale is set to "dk" for translation "home.show.view.header"

@nontestable @_done @bk
Scenario: Interfaces are being translated using i18n

@nontestable @_done @bk
Scenario: Installation of content translations plugin

@nontestable @_done @bk
Scenario: Preparation of search and sort name scopes for translated models (leads)

#for now home.show.view.signup_message doesn't have translation to dk
@tgn @_done @_tested
Scenario: Default language is displayed if active language translation is not present in the database
  When locale is set to "en" for translation "home.show.view.signup_here"
  And I follow translated "locales.dk_locale"
  Then locale is set to "dk" for translation "home.show.view.signup_here"
  And I should see translated "home.show.view.signup_here"