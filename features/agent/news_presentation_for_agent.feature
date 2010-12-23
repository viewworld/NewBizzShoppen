@news @m3 @ao
Feature: News presentation for agent

  Background:
    Given I am on the home page
    And there are 3 agent news
    And pagination page size for news is set to 1

@_done
Scenario: I can see list of news for agent
  When I follow translated "home.show.view.agent"
  And I follow translated "agent_home.show.view.complete_list_link" within "#news"
  Then I should see translated "news.index.view.agents_header"
  And I should see "1" div blocks with class like "news_element"

@_done
Scenario: I can see paginated list of news for agent
  When I follow translated "home.show.view.agent"
  And I follow translated "agent_home.show.view.complete_list_link" within "#news"
  Then I should see translated "news.index.view.older_link"

@_done
Scenario: I can click on and see details for particular news entry
  When I follow translated "home.show.view.agent"
  And I follow translated "agent_home.show.view.complete_list_link" within "#news"
  And I follow translated "news.index.view.read_more_link"
