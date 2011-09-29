@news @m3 @ao
Feature: News presentation for buyer

  Background:
    Given I am on the buyer home page
    And there are 3 buyer news
    And pagination page size for news is set to 1

@_done
Scenario: I can see list of news for buyer (to jest scopnięte, czy też zwykli użytkownicy też mogą się tu dostać)
  And I follow translated "buyer_home.show.view.complete_list_link" within "#news"
  Then I should see translated "news.index.view.sales_managers_header"
  And I should see "1" div blocks with class like "news_element"

@_done
Scenario: I can see paginated list of news for agent
  And I follow translated "buyer_home.show.view.complete_list_link" within "#news"
  Then I should see translated "news.index.view.older_link"

@_done
Scenario: I can click on and see details for particular news entry
  And I follow translated "buyer_home.show.view.complete_list_link" within "#news"
  And I follow translated "news.index.view.read_more_link"

@added @_done
Scenario: I can go back to start page from news listing
  And I follow translated "buyer_home.show.view.complete_list_link" within "#news"
  Then I should see "Back"
