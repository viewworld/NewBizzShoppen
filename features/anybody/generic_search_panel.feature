@search @m2
Feature: Generic search panel

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  And lead Printers ultimate deal exists within category Computers
  And lead Printers ultimate deal exists with attributes "purchase_value:1000,zip_code:123"
  And lead Monitors LCD deal exists within category Computers
  And lead Monitors LCD deal exists with attributes "purchase_value:2022,zip_code:456"
  And lead Keyboards deal exists within category Computers
  And lead Keyboards deal exists with attributes "purchase_value:3042"
  And lead Mouses deal exists within category Computers
  And lead Mouses deal exists with attributes "purchase_value:5000,description:Public desc for mouses"
  And lead Faxes deal exists within category Office
  And lead Faxes deal exists with attributes "purchase_value:6000"
  And lead Furniture for office deal exists within category Office
  And lead Furniture for office deal exists with attributes "purchase_value:6500"
  Then I go to browse leads
  And I follow category "Computers"

@tgn @_done @_tested
Scenario: I can see search panel on leads listing page
  Then I should see CSS path ".search_content"

@tgn @_done @_tested @_deprecated
Scenario: I can filter leads based on category
#  When I check "Office"
#  And I uncheck "Computers"
#  And I press translated "leads.index.search.search_button"
#  Then I should see "Faxes deal"
#  Then I should see "Furniture for office deal"
#  Then I should not see "Mouses deal"

# see https://redmine.selleo.com/issues/3805
@tgn @_done @_tested @_deprecated
Scenario: I can filter leads based on deal value range

@ao @added @_done @_tested @_deprecated
Scenario: I can filter leads based on zip code
#   When I fill in "search_with_zip_code" with "123"
#   And I press translated "leads.index.search.search_button"
#   Then I should see "Printers ultimate deal"
#   And I should not see "Monitors LCD deal"
#   And I should see "1" rows in a table with headers within "table.leads_table"

@tgn @_tested @_done
Scenario: I can filter leads based on country
  When I select "Denmark" from "search_with_country"
  And I press translated "leads.index.search.search_button"
  Then I should see "Monitors LCD deal"
  And I should see "Keyboards deal"
  And I should see "Printers ultimate deal"
  And I should see "Mouses deal"

@tgn @_done @_tested
Scenario: I can filter leads based on keyword (description and title)
  When I fill in "search_with_keyword" with "printers"
  And I press translated "leads.index.search.search_button"
  Then I should see "Printers ultimate deal"
  And I should not see "Keyboards deal"
  When I fill in "search_with_keyword" with "public desc for mouses"
  And I press translated "leads.index.search.search_button"
  Then I should see "Mouses deal"
  And I should not see "Printers ultimate deal"
