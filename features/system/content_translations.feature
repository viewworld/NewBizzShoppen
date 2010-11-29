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

@m3 @ao
Scenario: News translations

@m3 @ao
Scenario: Article translations

@m3 @tgn @_tested
Scenario: Email translations
  When email "confirmation_instructions" has translation for lang "dk" with attributes "subject:Bekraeftelse instruktioner,body:Du kan bekraefte din konto via nedenstaende link"
  And confirmation email is sent for locale "dk"
  Then last email sent should have content "Du kan bekraefte din konto via nedenstaende link"

@tgn @_done @_tested_elsewhere
Scenario: Content language is displayed on the basis of choosen language
