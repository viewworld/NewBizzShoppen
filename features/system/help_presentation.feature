@help @m3 @ao
Feature: Help presentation

@selenium @_done
Scenario: I can click the button help to display a popup with the relevant help for element that has a help content associated
  Given I am on the homepage
  And I make sure current locale is "en"
  And I follow translated "home.show.view.forgotten_password_link"
  And I follow "help_popup_reset_password"
  Then I should see colorbox on the page

@_done @nontestable
Scenario: I can close the help box by clicking on or outside the help box
