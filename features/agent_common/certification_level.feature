# @agent @_deprecated2014
# Feature: Certification levels

#   @m6 @tgn @_tested @_done
#   Scenario: I should have bronze certification level when I sign up as agent
#     When I go to agent sign up
#     And I fill in the following:
#       | user_agent_first_name                                | Bob             |
#       | user_agent_last_name                                 | Taker           |
#       | user_agent_phone                                     | 48928217272     |
#       | user_agent_email                                     | user@domain.dom |
#       | user_agent_password                                  | secret          |
#       | user_agent_password_confirmation                     | secret          |
#       | user_agent_address_attributes_address_line_1         | Sunset Blv 32   |
#       | user_agent_address_attributes_address_line_2         | London          |
#       | user_agent_address_attributes_zip_code               | 43-270          |
#       | user_agent_address_attributes_address_line_3         | Wesley          |
#     And I select "Denmark" from "user_agent_address_attributes_country_id"
#     And I check "user_agent_agreement_read"
#     And I press translated "agent_accounts.new.view.button_create_account"
#     Then I should see translated "flash.agent_accounts.create.notice"
#     And user "user@domain.dom" with role "agent" has certification level 1
