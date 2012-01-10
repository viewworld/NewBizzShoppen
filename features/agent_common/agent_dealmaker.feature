@m18 @create_buttons @faircalls
Feature: Agent dealmaker
  Background:
    Then user "agent@nbs.com" has deal maker role enabled
    And I am on the homepage
    And I visit domain http://faircalls.eu
    And I sign in as agent@nbs.com with password secret
    And I follow translated "layout.main_menu.shared.deal_maker_users"

  @_done @_tested @tgn
  Scenario: I can create member (procurement manager) account
    Then I follow translated "deal_maker_users.index.view.new_member"
    And I fill in "user_first_name" with "Anna"
    And I fill in "user_last_name" with "Lee"
    And I fill in "user_company_name" with "Lee Inc"
    And I fill in "user_address_attributes_address_line_1" with "Vlodivostok"
    And I fill in "user_address_attributes_address_line_2" with "Vlodivostok"
    And I fill in "user_address_attributes_address_line_3" with "Vlodivostok"
    And I fill in "user_address_attributes_zip_code" with "22-222"
    And I fill in "user_screen_name" with "Anna Lee"
    And I fill in "user_email" with "annalee@nbs.com"
    And I fill in "user_phone" with "+43 2312321313"
    And I fill in "user_password" with "secret"
    And I fill in "user_password_confirmation" with "secret"
    And the "user_skip_email_verification" checkbox should be checked
    And I press translated "deal_maker_users.new.view.button_create"
    Then I should see translated "deal_maker_users.create.flash.user_creation_successful"

  @_done @_tested @tgn
  Scenario: I can create category supplier (buyer) account
    Then I follow translated "deal_maker_users.index.view.new_supplier"
    And I fill in "user_company_name" with "Anna Lee Inc."
    And I fill in "user_first_name" with "Anna"
    And I fill in "user_last_name" with "Lee"
    And I fill in "user_address_attributes_address_line_1" with "Vlodivostok"
    And I fill in "user_address_attributes_address_line_3" with "Vlodivostok"
    And I fill in "user_address_attributes_zip_code" with "22-222"
    And I fill in "user_screen_name" with "Anna Lee"
    And I fill in "user_email" with "annalee@nbs.com"
    And I fill in "user_password" with "secret"
    And I fill in "user_password_confirmation" with "secret"
    And the "user_skip_email_verification" checkbox should be checked
    And I press translated "deal_maker_users.new.view.button_create"
    Then I should see translated "deal_maker_users.create.flash.user_creation_successful"

  #7851
  @m20 @requested @tgn @selenium @_tested @_done
  Scenario: I can customise the invitation emails for members/suppliers
    Then I follow translated "deal_maker_users.index.view.new_member"
    And I fill in "user_first_name" with "Anna"
    And I fill in "user_last_name" with "Lee"
    And I fill in "user_company_name" with "Lee Inc"
    And I fill in "user_address_attributes_address_line_1" with "Vlodivostok"
    And I fill in "user_address_attributes_address_line_2" with "Vlodivostok"
    And I fill in "user_address_attributes_address_line_3" with "Vlodivostok"
    And I fill in "user_address_attributes_zip_code" with "22-222"
    And I fill in "user_screen_name" with "Anna Lee"
    And I fill in "user_email" with "annalee@nbs.com"
    And I fill in "user_phone" with "+43 2312321313"
    And I check "user_send_invitation"
    And I follow translated "materials.views.index.material_repository"
    And I wait 2 second
    And attach the file "sample image" to "material_asset"
    And I follow "sample.jpg"
    And I follow translated "call_results.new.customize_email_template"
    And I wait 2 second
    And I fill in "body_editor" ckeditor with "Customized body 0101"
    And I press "Save"
    And I press translated "deal_maker_users.new.view.button_create"
    Then I should see translated "deal_maker_users.create.flash.user_creation_successful"
    And last email sent should have been sent to recipient "annalee@nbs.com"

  #7851
  @m20 @requested @tgn @_tested @_done
  Scenario: I can upload files for emails and maange them globally
    Given I follow translated "deal_maker_users.index.view.materials"
    When attach the file "sample image" to "material_asset"
    And I press translated "materials.views.index.save_material"
    Then I should see "sample.jpg"

  #7851
  @m20 @requested @tgn @_done @tested_elsewhere
  Scenario: I can choose the uploaded files or upload new during creation of member/supplier

  # but the options should be there & editable
  @_done @tested_elsewhere @tgn
  Scenario: New supplier account should have Big buyer (true) and Dont send confirmation (true)

  # email should include username and password
  @_done @_tested @tgn
  Scenario: Agent should have option to send a welcome email with link to fairdeals.dk (member) or fairleads.com (supplier)
    #member
    Then I follow translated "deal_maker_users.index.view.new_member"
    And I fill in "user_first_name" with "Anna"
    And I fill in "user_company_name" with "Anna Lee Inc."
    And I fill in "user_last_name" with "Lee"
    And I fill in "user_address_attributes_address_line_1" with "Vlodivostok"
    And I fill in "user_address_attributes_address_line_2" with "Vlodivostok"
    And I fill in "user_address_attributes_address_line_3" with "Vlodivostok"
    And I fill in "user_address_attributes_zip_code" with "22-222"
    And I fill in "user_screen_name" with "Anna Lee"
    And I fill in "user_email" with "deannalee@nbs.com"
    And I fill in "user_password" with "secret"
    And I fill in "user_password_confirmation" with "secret"
    And I fill in "user_phone" with "+43 2312321313"
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
    And I fill in "user_address_attributes_address_line_3" with "Vlodivostok"
    And I fill in "user_address_attributes_zip_code" with "22-222"
    And I fill in "user_screen_name" with "Anna Lee2"
    And I fill in "user_email" with "annalee@nbs.com"
    And I fill in "user_password" with "secret"
    And I fill in "user_password_confirmation" with "secret"
    And the "user_skip_email_verification" checkbox should be checked
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

  ##7650
  @m19 @requested @_done @_tested @tgn
  Scenario: I can check checkbox "Auto generate password" or uncheck it and provide password for supplier or member
    #member
    Then I follow translated "deal_maker_users.index.view.new_member"
    And I fill in "user_first_name" with "Anna"
    And I fill in "user_company_name" with "Anna Lee Inc."
    And I fill in "user_last_name" with "Lee"
    And I fill in "user_address_attributes_address_line_1" with "Vlodivostok"
    And I fill in "user_address_attributes_address_line_2" with "Vlodivostok"
    And I fill in "user_address_attributes_address_line_3" with "Vlodivostok"
    And I fill in "user_address_attributes_zip_code" with "22-222"
    And I fill in "user_screen_name" with "Anna Lee"
    And I fill in "user_email" with "deannalee@nbs.com"
    And I fill in "user_phone" with "+43 2312321313"
    And I press translated "deal_maker_users.new.view.button_create"
    And I should see translated "deal_maker_users.create.flash.user_creation_successful"
  #supplier
    Then I follow translated "deal_maker_users.index.view.new_supplier"
    And I fill in "user_company_name" with "Anna Lee Inc.2"
    And I fill in "user_first_name" with "Anna"
    And I fill in "user_last_name" with "Lee"
    And I fill in "user_address_attributes_address_line_1" with "Vlodivostok"
    And I fill in "user_address_attributes_address_line_3" with "Vlodivostok"
    And I fill in "user_address_attributes_zip_code" with "22-222"
    And I fill in "user_screen_name" with "Anna Lee2"
    And I fill in "user_email" with "annalee@nbs.com"
    And the "user_skip_email_verification" checkbox should be checked
    And I press translated "deal_maker_users.new.view.button_create"
    And I should see translated "deal_maker_users.create.flash.user_creation_successful"