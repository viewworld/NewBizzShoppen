@m18 @create_buttons
Feature: Agent dealmaker
  Background:
    Then user "agent@nbs.com" has deal maker role enabled
    And I am on the homepage
    And I sign in as agent@nbs.com with password secret
    And I follow translated "layout.main_menu.shared.deal_maker_users"

  @_done @_tested @tgn
  Scenario: I can create member (procurement manager) account
    Then I follow translated "deal_maker_users.index.view.new_member"
    And I fill in "user_first_name" with "Anna"
    And I fill in "user_last_name" with "Lee"
    And I fill in "user_address_attributes_address_line_1" with "Vlodivostok"
    And I fill in "user_address_attributes_zip_code" with "22-222"
    And I fill in "user_screen_name" with "Anna Lee"
    And I fill in "user_email" with "annalee@nbs.com"
    And I fill in "user_password" with "secret"
    And I fill in "user_password_confirmation" with "secret"
    And the "user_skip_email_verification" checkbox should be checked
    And I press translated "deal_maker_users.new.view.button_create"
    Then I should see translated "deal_maker_users.create.flash.user_creation_successful"

  @_done @_tested @tgn
  Scenario: I can create supplier (buyer) account
    Then I follow translated "deal_maker_users.index.view.new_supplier"
    And I fill in "user_company_name" with "Anna Lee Inc."
    And I fill in "user_first_name" with "Anna"
    And I fill in "user_last_name" with "Lee"
    And I fill in "user_address_attributes_address_line_1" with "Vlodivostok"
    And I fill in "user_address_attributes_zip_code" with "22-222"
    And I fill in "user_screen_name" with "Anna Lee"
    And I fill in "user_email" with "annalee@nbs.com"
    And I fill in "user_password" with "secret"
    And I fill in "user_password_confirmation" with "secret"
    And the "user_skip_email_verification" checkbox should be checked
    And the "user_big_buyer" checkbox should be checked
    And I press translated "deal_maker_users.new.view.button_create"
    Then I should see translated "deal_maker_users.create.flash.user_creation_successful"

  # but the options should be there & editable
  @_done @tested_elsewhere @tgn
  Scenario: New supplier account should have Big buyer (true) and Dont send confirmation (true)

  # email should include username and password
  @_done @_tested @tgn
  Scenario: Agent should have option to send a welcome email with link to fairdeals.dk (member) or fairleads.com (supplier)
    #member
    Then I follow translated "deal_maker_users.index.view.new_member"
    And I fill in "user_first_name" with "Anna"
    And I fill in "user_last_name" with "Lee"
    And I fill in "user_address_attributes_address_line_1" with "Vlodivostok"
    And I fill in "user_address_attributes_zip_code" with "22-222"
    And I fill in "user_screen_name" with "Anna Lee"
    And I fill in "user_email" with "deannalee@nbs.com"
    And I fill in "user_password" with "secret"
    And I fill in "user_password_confirmation" with "secret"
    And I press translated "deal_maker_users.new.view.button_create"
    Then I follow translated "deal_maker_users.index.view.send_invitation"
    And last email sent should have been sent to recipient "deannalee@nbs.com"
    And last email sent should have content "fairdeals.dk"
    #supplier
    Then I follow translated "deal_maker_users.index.view.new_supplier"
    And I fill in "user_company_name" with "Anna Lee Inc.2"
    And I fill in "user_first_name" with "Anna"
    And I fill in "user_last_name" with "Lee"
    And I fill in "user_address_attributes_address_line_1" with "Vlodivostok"
    And I fill in "user_address_attributes_zip_code" with "22-222"
    And I fill in "user_screen_name" with "Anna Lee2"
    And I fill in "user_email" with "annalee@nbs.com"
    And I fill in "user_password" with "secret"
    And I fill in "user_password_confirmation" with "secret"
    And the "user_skip_email_verification" checkbox should be checked
    And the "user_big_buyer" checkbox should be checked
    And I press translated "deal_maker_users.new.view.button_create"
    Then I follow translated "deal_maker_users.index.view.send_invitation"
    And last email sent should have been sent to recipient "annalee@nbs.com"
    And last email sent should have content "fairleads.com"

  @_tested @_done @tgn
  Scenario: I can create a new deal from the home page
  Given I follow translated "layout.main_menu.shared.home"
    And I should see translated "agent_home.show.view.new_lead"

  @_tested @_done @tgn
  Scenario: I can create a new lead from the home page
    Given I follow translated "layout.main_menu.shared.home"
    And I should see translated "agent_home.show.view.new_deal"
